# Review of LogicAndDefinabilityInNumberTheoryPartII (pull request #2438 at 05885da)

**Verdict:** accepted

## Previous findings

- R01 — repaired: "The twisted coefficients `ℤ/ℓ(d) ≅ μ_ℓ^{⊗d}`, for a prime `ℓ` invertible in `K`, exist at the pins as Tau Ceti's `TauCeti.ZModTwist (TauCeti.continuousLocalCyclotomicCharacter ℓ K ^ d) 1`; the pins lack Kato's groups of logarithmic differentials in characteristic two and the residue maps" (`Suggested.lean:30–34`).
- R02 — repaired: "(Cossart–Piltant I, proof of Theorem 2.1 and the reduction Theorem 7.2, of the HAL version), and the second proves that uniformization by blow-ups along regular centres and along regular cylinders over the base" (`README.md:646`); References line 1621 adds cossart_piltant_i, recorded as certified in `sources.toml`.
- R03 — repaired: the `roadmap-summary` block now reads "Among roadmaps it alone supplies three cohomological local–global principles and Cossart–Piltant's projective resolution of quasi-projective threefolds over fields of positive characteristic differentially finite over a perfect subfield."

## Verified sound

| Target | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| Docstring `ℤ/ℓ(d) ≅ μ_ℓ^{⊗d}` (`Suggested.lean:30–32`) | `ℓ = 3`, `K = ℚ`, complex conjugation `c`, `d = 1, 2` | `χ₃(c) = −1`: twist acts by `2`, `(−1)² = 1`; on `μ₃`, `ζ ↦ ζ²`; on `μ₃^{⊗2}`, `ζ⊗ζ ↦ ζ²⊗ζ² = ζ⊗ζ` | agree |
| Same, degenerate cases | `ℓ = 2`; `d = 0`; `K = 𝔽₃(t)`, `ℓ = 3` | `χ(g) ≡ 1 mod 2`, so trivial, as is `μ₂^{⊗d}`; `χ⁰ = 1` gives `ℤ/ℓ`; in characteristic `ℓ`, `μ₃(K̄) = 1` but the twist has 3 elements | the clause "`ℓ` invertible in `K`" excludes the last case |
| Same, in Lean | scratch probe at the pins | the type and its `ContinuousSMul (Field.absoluteGaloisGroup K)` instance elaborate; `(g • x).val = toZModPow 1 (χ g ^ d) * x.val` closes by `simp` | holds |
| 1.3b statement vs cossart_piltant_i Theorem 2.1 (lines 140–146) | hypotheses one by one | `char k = p > 0`, `Ω¹_{k/k₀}` finite over perfect `k₀`, `Z` reduced quasi-projective of dimension 3, `π` projective, (i)–(iii) on both sides | same statement |
| 1.3b statement, reducible `Z` | `Z = V(xy) ⊂ 𝔸⁴_{𝔽₂}` | `Σ = V(x, y) ≅ 𝔸²`; blow-up along `(x, y)` has charts `y = xt` with `x²t = 0`, so `t = 0`; `Z̃ = 𝔸³ ⊔ 𝔸³`; `π⁻¹(Σ)` is a smooth divisor in each component | holds; this is the first step of the proof at line 147 |
| 1.3b route vs proof of Theorem 2.1 (lines 147–163) and Theorem 7.2 (lines 862–876) | the steps used | Prop. 4.9 reduces to local uniformization; Prop. 5.1 to rank one with `κ(V)/k` algebraic; Thm 7.2 to degree-`p` Artin–Schreier or purely inseparable covers; [13] = Part II | matches the README sentence |
| Reference gloss "Part II cites its Theorem 2.1 as conjecture 3.1" | cossart_piltant lines 139, 160–167 vs cossart_piltant_i §3 (line 165) | Part II recalls "[CP1, 3.1]" with exactly the statement of Theorem 2.1; HAL v1 §3 is notation, with no item 3.1 | gloss correct; numbering of HAL v1 cited |
| 1.3b second-paper clause | cossart_piltant lines 178–183 | blow-ups along regular centres or along regular cylinders over `Spec S`; maximal contact; resolution in dimension two | matches |

The diff changes no Lean statement. The rows for the untouched statements stand as in the previous review, of `83f6dd6`.

- **Gate.** The push gate passes every check at this head. The worker's run includes `build=0`. Dependency check: "depcheck: 255 roadmaps, 2431 edges, 0 problem(s)". There are no changes outside the folder.
- **Elaboration.** `lake env lean Suggested.lean` gives only the 9 `declaration uses sorry` warnings. The 11 declarations are unchanged since `8eb7da8`, so the earlier `#check @` comparison and one-tactic probe still apply. Their types in `signatures.md` lose no binder.
- **Sources.** 7 locators checked against the text: cossart_piltant_i lines 55–64, 84–85, 140–146 (Thm 2.1), 147–163 (its proof) and 862–876 (Thm 7.2); cossart_piltant lines 139 and 160–167, and 178–183.
- **Library declarations.** 4 opened at the Tau Ceti pin: `TauCeti.ZModTwist` (`ZModTwist.lean:137`), `ZModTwist.val_smul` (line 209), its `ContinuousSMul` instance (line 221), and `TauCeti.continuousLocalCyclotomicCharacter` (`Cyclotomic/Character.lean:54`, under `[Fact p.Prime]`, line 30).
- **Seeded sample.** None of the sampled targets falls in the changed passages: 1.3b, References and the module docstring. Nothing that cites 1.3b changed (README lines 11, 23, 41, 97, 556, 664, 670–675, 1172), and its statement is unchanged.
- **Pull request text.** Every sentence of the title, the summary block and the prose agrees with this head. The change adds no supplier, section or declaration and removes none.

Overlap check: read QuadraticFormInvariantsPartII, AdicCoefficientsAndComparisonsPartII, LogicAndDefinabilityInNumberTheory, LocalFieldsRamificationPartII, EtaleDualityAndPerverseSheavesPartII and SchemeAndStackFoundations. A search of all roadmaps, open and on main, for Cossart–Piltant and for "differentially finite" finds only AdicCoefficientsAndComparisonsPartII. Its lines 454–465 and 1770 cover arithmetical threefolds in the proper sense, a different theorem. The projective resolution of threefolds over differentially finite fields has one owner, this roadmap (1.3b). The docstring sentence names a Tau Ceti carrier, which no roadmap owns.

Source independence: changed passages only. 4 passages compared with 2 sources. The 1.3b statement shares only the hypothesis list that Theorem 2.1 forces (cossart_piltant_i lines 140–146). The 1.3b route shares at most 4 words with cossart_piltant_i lines 55–64 and cossart_piltant lines 178–183. The References gloss shares at most 8 words with cossart_piltant_i lines 84–85; they form the technical name of the class of valuations. The largest share is still dittmann_pop, about 68 of 278 locators; Cossart–Piltant locators rose from 3 to 5. No layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- kato_hasse, merkurjev_suslin, moret_bailly, lenstra_cm: settled as uncertified and cited by locator only, as in the previous reviews.

## Source issues

- **Misprint** in cossart_piltant_i at proof of Theorem 2.1, printed p. 3 (HAL v1): the source says condition (2) of proposition 7.2 holds; it should be condition (2) of theorem 7.2, since 7.2 is a theorem; affects nothing.

## For the human reviewers

- none
