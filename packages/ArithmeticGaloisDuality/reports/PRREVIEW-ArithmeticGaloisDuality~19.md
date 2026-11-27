# Review of ArithmeticGaloisDuality (pull request #3184 at 4ea5e62)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 261 changed lines since `94e80af`. Every added or changed passage was read and recomputed: the general bounded-exponent statement of §R02.4.4 with its two instances and four Checks, the cochain tensor comparison of §D7.3 with its naturality in the group and its four Checks, the rewritten opening of *Nakamura cochain tensor comparisons*, and the clause added to §D7.7.3, the last two against Nekovář's text at the cited places. No finding; one small correction to the description and two format notes, none blocking. Nothing is left for a human to decide.

## C01 — The description cites SelmerIwasawaCohomology §2.23a as if it were on `main`

The sentence "SelmerIwasawaCohomology §2.23a uses it in this form" sends a reader to a section that the roadmap on `main` does not have: its headings go from §2.23 to §2.24. §2.23a (*Selmer complexes of simple structures: `H²` and the change of conditions*), whose *Needs:* line names §D7.7.3, exists only at the head of the open revision of SelmerIwasawaCohomology. Text that would be right: "The open revision of SelmerIwasawaCohomology uses it in this form in its §2.23a."

## N01 — *Uniform vanishing of cocycles of bounded exponent* (§R02.4.4, README line 3086) still carries no source locator

Nothing is unsupported, since the proof sketch is complete from the cited targets, but its neighbours each end with a locator. A parenthesis naming Milne, *Arithmetic Duality Theorems*, I §4, Lemma 4.9, p. 56 for the number-field finiteness (the locator *Finiteness of `H¹(G_{K,S}, M)`* already has), and saying that the uniform form and the function-field argument are the roadmap's own, would let a reader place the statement.

## N02 — The *In Tau Ceti* note of §R02.4.4 (README lines 3155–3168) names a library commit later than the pinned one

The note is true as written: at Tau Ceti `2a9233e5` the three theorems exist in the two files named, with the statements the note gives, and the three applications it describes type-check against their hypotheses (the first has no finite-index clause, which the second's hypothesis only adds). At the Tau Ceti commit this repository pins (`2fd255d`), neither file exists, so a reader who searches the pinned library finds nothing. When the pin reaches that commit the hash can go; until then the note would be clearer saying "later than the pinned commit".

## Previous findings

- The previous review, of `f9dd6d6`, had no finding and no small correction.
- Its N01 (no source locator on *Uniform vanishing of cocycles of bounded exponent*) is not repaired: the statement, now in its general form at README line 3086, ends its proof sketch at line 3153 with the *Needs:* line and no locator. Written again as N01.

## Verified sound

| Statement | Instance | Computed: one side | Computed: other side | Result |
|---|---|---|---|---|
| Uniform vanishing, general form (§R02.4.4) | `G = S₃`, `U = C₃`, `m = 3`, `B = 𝔽₃(sgn)` (`C₃` acts trivially) | `Hom(C₃, ℤ/3)` has order 3; `V = 1`, `N = 1` | `H¹(S₃, 𝔽₃(sgn)) = Hom(C₃, 𝔽₃(sgn))^{C₂} = 𝔽₃ ≠ 0`: a cocycle nonzero on `C₃`, so `N = C₃` fails | holds; `N` sharp |
| Same | `G = S₃`, `U = C₃`, `m = 2`, any `B` with `2B = 0`, `C₃` trivial | `Hom(C₃, ℤ/2) = 0`, `V = C₃`, `N = C₃` | `f|_{C₃}` a homomorphism `C₃ → B`, `B` 2-torsion: zero | holds |
| Same, non-normal `U` | `G = S₃`, `U = ⟨(12)⟩`, `m = 2` | `V = 1` (kernel of the nontrivial character), conjugates: 3 = `[G : U]`; core `N = 1` | bound "at most `[G : U]` conjugates": 3 ≤ 3 | holds |
| Same, `m = 1` (Check) | any `G`, `U` | `B = 0`; `Hom(U, 0)` one element, kernel `U`, `V = U` | `N` = normal core of `U`, open | Check true |
| Same, Check `ℚ`, `S = {2, ∞}`, `m = 2` | `B = ⊕_ℕ ℤ/2` | continuous homs have finite image, factor through `G_S/V ≅ (ℤ/2)²` | `Hom((ℤ/2)², B) = B ⊕ B`, infinite | Check true |
| Same, Check on fixed exponent | `m = 2ⁿ` | `(ℤ/2^{n+2})^×/{±1} ≅ ℤ/2ⁿ`, kernel of index `2ⁿ` | `N ⊆ ker` forces `[G_S : N] ≥ 2ⁿ` | Check true |
| Same, Artin–Schreier Check | `𝔽_p(t)`, `S = {∞}`, `m = p` | `g^p − g` polynomial forces `g ∈ 𝔽_p[t]`; nonconstant `g` gives top degree `p·deg g` | left side has only degrees prime to `p`; so `g ∈ 𝔽_p`, `g^p − g = 0`, all `c_j = 0` | Check true |
| Function-field finiteness (proof sketch) | `L_wˣ ≅ ℤ × k_wˣ × (1 + 𝔪_w)`, `ℓ ∤ m` | `L_wˣ/m`: `ℤ/m × k_wˣ/m × 0`, finite | `C_{L,S}/m → C_S(L)/m → Cl_S(L)/m → 0` exact, outer terms finite | `C_S(L)/m` finite; cokernel `Ẑ/ℤ` divisible, so `χ ↦ χ ∘ rec` injective |
| Cochain tensor comparison (§D7.3) | `G` trivial, any `n` | `Cⁿ = ρ`, source `ρ ⊗ M` | target `ρ ⊗ M`, map the identity | holds; flatness Check: `A/𝔪` not flat unless `𝔪 = 0` |
| Same, non-free Check | `ρ = M = A/𝔪`, `𝔪 ≠ 0`, `G = 1` | `Tor₁^A(k, k) = 𝔪/𝔪² ≠ 0` (Nakayama) in degree `−1` | `RΓ(1, k ⊗ k) = k[0]` | derived base change fails, as stated |
| Same, `C₂` Check | `A = 𝔽₂[ε]/(ε²)`, `σ = 1 + ε` | `σ ∓ 1 = ε`; `ker ε/im ε = 0`, `H⁰ = εA ≅ 𝔽₂`; `H¹(𝔽₂ ⊗^L 𝔽₂[0]) = 0` | `H¹(C₂, 𝔽₂) = Hom(C₂, 𝔽₂) = 𝔽₂` | Check true |
| Same, `A⟦T⟧` Check | `f = Tⁿ` on `Uₙ ∖ Uₙ₊₁`, `0` on `⋂ Uₙ` | `f(Uₙ) ⊆ (T)ⁿ`: continuous at `⋂ Uₙ`; locally constant elsewhere | values span `A[T]`, not finitely generated over Noetherian `A ≠ 0` | Check true |
| Same, naturality in `φ : G′ → G` | cochain `c ⊗ m` | iso for `G′` after `φ^* ⊗ id`: `g′ ↦ c(φ g′) ⊗ m` | `φ^*` after iso for `G`: the same | commutes |
| §D7.7.3 clause | Nekovář 6.2.1.2, 5.2.1.3 | source: product ends with truncation onto `τ^{II}_{≥2} C_cont(G_v, J(1))`; `r_v` defined on that truncation | README clause: the same target and the same retraction, §D7.4 defines `r_v` so | agrees |
| *Cohomological finiteness and perfect amplitude* (sampled; cited by the new text) | what §D7.3 says it proves | new text: finite generation under (F); perfectness for free `ρ` under (F) and a bound on `cd_p` | statement at line 4947: finite type under (F); perfect in `[a, b + e]` for perfect `T` under `cd_p ≤ e` | consistent (`ρ` free: `[0, e]`) |

- Source locators checked against the text: 5, all in Nekovář, *Selmer complexes* (Numdam copy): §3.4.1 on printed pp. 82–83, 3.4.1.6 (change of group), Proposition 3.4.4 and its proof by Lazard on p. 84, 6.2.1.2–6.2.1.3 on p. 138, (5.2.1.3) on p. 115.
- Library declarations opened: 3, at Tau Ceti `2a9233e5` (`TauCeti/Topology/Algebra/Group/OpenSubgroup/BoundedIndex.lean` lines 41 and 69; `TauCeti/NumberTheory/NumberField/RestrictedRamification/Cohomology.lean` line 62); absent at the pinned `2fd255d`.
- Citations resolved: 12 inside the roadmap (lines 1402, 1539, 1638, 1696, 1807, 2232, 4589, 4761, 4819, 4947, 5167, and the Conventions' `C_v^ord` at line 87); PerfectoidTowers §P9.0 *Comparison with the canonical carrier for compact coefficients* (on `main`, README line 1637, joint continuity required, as the new text says); ProfiniteCohomology Layers 1, 3, 5 on `main`.
- Record: the README at the merge base and at the head have the same 8 layers and the same headings; no item removed; the two Checks and the example taken out of *Nakamura cochain tensor comparisons* reappear under the new statement.
- Dependency check: `depcheck: 94 roadmaps, 1066 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder. The automatic checks all pass.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` gives 12 `sorry` warnings and nothing else. The file is identical to `main`'s, so the one-tactic probe and the `#check` comparison were not rerun; neither new statement is among the roadmap's headline theorems of the opening summary.
- Title and description read against the head: 1 sentence corrected (C01); the rest agree, including "`README.md` only".
- Other open pull requests changing this folder: one merges cleanly with this head; the other is ordered after this one by the description's merge-order paragraph. No id dropped on either side.

Overlap check: read SelmerIwasawaCohomology (main and its two open revisions), NoncommutativeAndEquivariantIwasawa, InverseGaloisAndArithmeticFundamentalGroups; nothing shared. Both new statements are stated here only; the open revision of SelmerIwasawaCohomology cites §D7.3 and §D7.7.3.

Source independence: changed passages only; 5 passages compared with 1 source (Nekovář), none shared beyond what the mathematics forces; largest share MilneADT, 86 of about 190 source mentions; contents not compared, since the change adds, removes and reorders no layer.

Research link: §D7.3 is the degreewise base change beneath Nekovář's Selmer complexes (2006, §3.4) and Nakamura's comparisons for rank-two universal deformations (arXiv 2006.13647, Appendix B); the Poitou–Tate and Euler-characteristic formulas are the duality inputs of Selmer-group and deformation-theoretic arguments. Rests on the README's summary and on Nekovář §3.4 and §6.2 as read.

## Not verifiable

- Neukirch–Schmidt–Wingberg, VIII §1 and §3, the locators of the function-field targets the new proof cites (*The class formation of a global function field*): no text held. Those statements are untouched; the new proof was checked against them as the README states them.
- Nekovář §4.2.1–4.2.9 and Pottharst §1, the locators of the sampled *Cohomological finiteness and perfect amplitude*: untouched, not reopened this round.

## Source issues

- none

## For the human reviewers

- none
