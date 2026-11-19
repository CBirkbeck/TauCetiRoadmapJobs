# Review of GL2ModularityLifting (pull request #1071 at 0ba9e9a)

**Verdict:** needs changes

**Summary.** Changes are needed: one finding. The finding of the previous review is repaired (§§6.15, 8.6 and 8.7 are now in the roadmap's own words) and the fifteen sampled statements agree with their sources, but §1.7 and the second theorem of `Suggested.lean` restate a target that the supplier ClassicalSerreModularity now states in the same generality and declares itself, and three sentences here describe that supplier as it no longer reads. There are one small correction and two format notes, none blocking, and two points for a human to decide.

## R01 (P2) — §1.7 and `cht_soluble_prescribed_completions` restate a theorem that ClassicalSerreModularity states and owns, and the text misdescribes that supplier

Two roadmaps in one supply chain would each carry Clozel–Harris–Taylor's Lemma 4.1.2 as a target with its own Lean statement, and a reader of §1.7 is told a difference between the two that does not exist.

§1.7 (line 243) says the supplier's `I.0/soluble-totally-real-base-change` "states the totally real case of this lemma, with prescribed completions at finitely many finite places and a further finite set of places required to split completely", and that "it is this general form that `cht_soluble_prescribed_completions` declares". Scope and ownership (the last paragraph but one) and the contract *From ClassicalSerreModularity* (line 2798) say the same. At the head of ClassicalSerreModularity's pull request the target reads: `K` a number field, `S` a finite set of places "finite or infinite", `E_v` equal to `ℝ` or `ℂ` at a real place, with the totally real form derived as a special case (its README, §I.0, first target). Its `Suggested.lean` declares `soluble_prescribed_completions` (line 81) with the hypotheses and conclusion of the theorem here, binder for binder: `D` a finite Galois intermediate field, `S : Finset (Place K)`, finite Galois `L v` over the completion, and a soluble Galois `E`, linearly disjoint from `D`, with `K_v ⊗[K] E ≃ₐ (Fin n → L v)`, `0 < n`. Its Scope says of this roadmap's §1.7: "This target is owned here." The only difference is the carrier: the supplier uses `TauCeti.GlobalNumberFields.Place.Completion` (pinned Tau Ceti, `TauCeti/NumberTheory/NumberField/Global/Places/Completion.lean`, line 36, with its `Field` and `Algebra K` instances on the next lines), while `completionAt`, `completionAtField` and `completionAtAlgebra` here redefine it; `completionAt F v = Place.Completion v` is proved by `cases v <;> rfl` at the pins.

The smallest change: make §1.7 an import of ClassicalSerreModularity `I.0/soluble-totally-real-base-change` in its number-field form (keeping §1.8, which derives the allowable-change clauses, as this roadmap's own); replace the three sentences that call the supplier's target the totally real case by one saying that it is the general lemma; remove `cht_soluble_prescribed_completions` and the three completion declarations from `Suggested.lean` and its docstring, leaving `odd_involution_descent`; and in Downstream consumers (line 2730) say that consumers take the lemma from the supplier. The pull request's description names the theorem twice and would change with it.

## C01 — The first Check of §12.2 illustrates the dyadic transfer by a step of the source that does not use it

A reader looking for where the 2-adic congruence transfer is applied is sent to the wrong place. The Check (line 2571) cites Dieulefait–Pacetti §3, where a weight-two system through a lift of the mod 2 representation is reduced at a prime greater than 3 and modularity returns to the 2-adic member because one member of a compatible system is modular if another is (dp lines 686–704); no pair of congruent 2-adic lifts occurs and Theorem 1.5 is not invoked. The source applies Theorem 1.5 in Paso 4, steps (1) and (3), p. 13 (dp lines 614 and 633), between a 2-adic member and a minimal weight-two lift of its reduction, with non-solvable image supplied by the good-dihedral prime. The README does not mention Paso 4. Citing Paso 4 in this Check, with the two lifts it compares, would make it an instance of the statement.

## N01 — Three proposition names stay in code font although nothing declares them

`OddPrimeLifting` (§7.1), `DyadicLifting` (§§7.2, 9.3) and `OrdinaryThreeLifting` (§7.4) read as declarations of `Suggested.lean`; §7.3's name was turned into prose at this head ("the residually reducible lifting proposition at p"), and the other three would read the same way.

## N02 — The first Check of §1.7 writes `L_v = K_v` where the section's notation is `E_v` and `F_v`

The second Check states the same case in the section's notation.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.7 (sample) | `S = ∅`; all `E_v = F_v`; complex v; source | `E = F`; `n = [E:F]`; `ℂ` forced; cht lines 5723–5740 give number field, any finite S | sound; duplicated | R01 |
| §1.14 (sample) | `M = T = 𝒪`; zero action | `𝒪[[y]]` reduced, flat, faithful; first nonzero coefficient acts nontrivially; kw2 lines 3716–3730 | sound | none |
| §3.4a (sample) | `T_r = ∅`; two-component B | identity comparison; A-module without faithful quotient; Gee §5.6 as in previous round's §3.3 reading | sound | none |
| §3.7 (sample) | B a domain; kernel | base change of positive-rank projective is faithful; kw2 lines 3776–3777 give p-power torsion kernel | sound | none |
| §6.7a (sample) | `ℤ₂[[x]]/(x(x−2))`; `h = 1` | `M ⊗ R/(x) ≅ ℤ₂ ⊕ 𝔽₂`; `g = 2h+1 = 3`, `t = 2−|S|+h`; `dim C = h+j+1` | sound; Kisin text unread | none |
| §7.5 (sample) | `GL₂(𝔽₂)`; `SL₂(𝔽₄)`; `N = G`, `N = 1` | `S₃` solvable; `A₅` not; reducible ⇒ triangular ⇒ solvable; normal image with solvable quotient | sound | none |
| §7.7 (sample) | Emerton, Hu–Tan, Tung | emerton-lgc lines 5074–5083 invoke Serre's conjecture; hu-tan lines 1644–1657; tung-odd lines 765–770 assume `ρ̄` modular | sound | none |
| §7.11 (sample) | `p = 3`, generator `−2`; `k_h = 1` | `ε(−2) = −2 ≠ ±4^m`; weights `{m, m}` contradict distinctness; `μ = χε^{−m}` finite on each inertia | sound | none |
| §8.9 (sample) | Pasos 1, 2, 5, 6, §3; `k = 3, w = 7` | `7 ∉ {3, 5}`; `q ≡ 1 (4)`, `q > 5` gives `q ≥ 13 ∉ {1, 3}`; dp lines 438–471, 507–512, 637–670, 686–704 | sound | none |
| §9.3 (sample) | Tung Theorem A, B; Paškūnas 1.1 | tung-dyadic lines 85–90, 123; paskunas-2adic lines 31–46: (iv) excludes `(χ ∗; 0 χ)`, `det ρ` totally odd | sound | none |
| §10.11 (sample) | `d = 4`; `k[[a,b,c,d,z₁..z₆]]/(ab, cd)` | bounds 8, 7 against 5; components of dimension 8, partitions meet in 7, `(a,c) ∩ (b,d)` in 6; pan lines 5332–5395 | sound | none |
| §10.13 (sample) | Pan 7.4.3, 7.4.4 | `p > 3`, `x₀y₁ − x₁y₀`, ordinary quotient `(x₀, x₁)`: pan lines 5214–5219; `|S∖Σ_p| + 2 < d` at line 5017 | sound | none |
| §11.1 (sample) | DP Theorem 1.7; twist by `η^{−1}` | residual `1 ⊕ χ₃`, inertia `(∗ ∗; 0 1)`, `det = ψχ₃^{k−1}`: dp lines 174–183; determinant becomes `ψη^{−2}ε^{k−1}` | sound | none |
| §12.1 (sample) | DP 1.4; `ℚ(√p*)` against `ℚ(ζ_p)` | dp lines 140–147; cyclic quotient: two distinct characters, stabiliser of index 2 is the quadratic subfield | sound | none |
| §12.2 (sample) | DP 1.5; its uses | dp lines 157–164: odd, de Rham `{0, k−1}`, `k > 1`, modular non-solvable; used at lines 614, 633, not in §3 | sound; Check | C01 |
| `odd_involution_descent` | trivial group; `χ₁ ⊕ χ₂`; irreducible `ρ′`; discrete K | `T(1) = 2 ≠ 0`: vacuous; `D(c) = −1`; `ρ′(c) ~ diag(1, −1)` forces `End = K`; uniqueness in dimension 2, `2 ≠ 0` | sound | none |
| `cht_soluble_prescribed_completions` | supplier's theorem; carrier | same binders and conclusion as `soluble_prescribed_completions`; `completionAt F v = Place.Completion v` by `cases v <;> rfl` | duplicate | R01 |
| §5.4 | Theorem 9.7 and §8.3.3 (A) | kw2 lines 4075–4084, 3480: `k = p+1` only with F split and `k(ρ̄) = p+1`; README says the same | sound | none |
| §6.15 | Theorem 9.7 at `p = 2` | unramified at 2, split if locally irreducible, non-solvable, `(β)`, `(α)` if `k(ρ̄) = 2`, totally odd: kw2 lines 4075–4084 | sound; reworded | none |
| §8.6 | Kisin (2.2.18) | hypotheses (1)–(3) at kisin-fm lines 2222–2236; `(ωχ ∗; 0 χ)` is an extension of `χ` by `ωχ` | sound; reworded | none |
| §8.7 | Tung 4.7; oddness | tung-odd lines 765–770; `det ρ(c) = ±1` reduces to `−1 ≠ 1` for odd p | sound; reworded | none |
| §5.9 | supplier §I.1 | opening sentence: both theorems proved over totally real fields; target over `ℚ` includes `ℚ(√−p)`; OrdinaryAutomorphicFormsAndModularityLifting §5.8 exists | sound | none |
| §11.2 | `p = 3`, `k = 2, 4` | `k − 1 ∈ {1, 3}` odd, `ω₃^{k−1} = ω₃ ≠ 1`; nonordinary reduction `Ind ω₂^{k−1}` irreducible for `k ≤ p+1` | sound | none |
| §7.9, §7.10 | `{m, m+k′−1}` against `{0, k−1}`; `ℤ × ℤ` | `m = 0`, `k′ = k`; `det c = (−1, 1) ≠ −1` although its image in `𝔽₃` is `−1` | sound | none |
| §12.3 Check, worked example 3 | `V₅(11a1) ⊗ ε`; odd involutions lifting `I₂` | `ω ⊕ ω²`, weights `{1, 2}`; `(1+X₁)² + X₂X₃ = 1` gives `X₁² + X₂X₃ + 2X₁` | sound | none |

- Source locators read at the text this round: 31 in 10 sources (kw2 6, cht 1, dp 9, pan 5, tung-dyadic 4, tung-odd 2, paskunas-2adic 1, hu-tan 2, emerton-lgc 2, kisin-fm 1).
- Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): `TauCeti.GlobalNumberFields.Place.Completion` and its two instances (`TauCeti/NumberTheory/NumberField/Global/Places/Completion.lean`, lines 36–44); the others named in the contracts were opened in the previous round and the pins are unchanged.
- Cross-roadmap citations resolved at heads or on main this round: ClassicalSerreModularity's nine cited targets and §I.1; OrdinaryAutomorphicFormsAndModularityLifting §5.8; the four `HeckeGaloisDatum` names (GlobalGaloisDeformations README on main, lines 1642–1696).
- Dependency check: `depcheck: 200 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The automatic checks all passed. No change outside the folder.
- `lake env lean` on `Suggested.lean`: two `sorry` warnings (lines 49, 88) and nothing else. `#check @name` on both theorems in a copy of the file: no `variable` block, no binder lost, types as the README states. One-tactic probe: `simp` leaves the existential of the prescribed-completion theorem open; the descent theorem was decided by reading (an existence statement over `Representation`).
- Headline theorems: Theorem 9.7 over F (§§5.4, 6.15), Kisin's theorems (§§5.10, 6.9), §5.8, §5.18(ii), §§8.7, 9.2, 10.14 with their cases over `ℚ`, Layer 12. None is statable at the pins and the docstring names the missing carriers layer by layer. Stated: §0.1 and §1.7 (the latter: R01).
- Earlier findings: R01 repaired (§6.15 now "Take `p = 2` and a totally real field F in which 2 is unramified…", §8.6 "Suppose that at each place v above p the two Hodge–Tate weights … are different", §8.7 "No oddness hypothesis is needed"); C01 repaired (§5.9 cites the target over `ℚ` and "the totally real form that ClassicalSerreModularity §I.1 proves on the way to that target"); N01 repaired at the six places listed.

Overlap check: read ClassicalSerreModularity, SerreModularityByCompatibleSystems, CompletedCohomologyAndLocalGlobalCompatibility, OrdinaryAutomorphicFormsAndModularityLifting, PotentialModularityAndCompatibleSystems, PotentialAutomorphyInfrastructurePartII, SerreWeightAndLevelOptimisation, GlobalGaloisDeformations, LocalGaloisDeformationRings; shared: Clozel–Harris–Taylor's Lemma 4.1.2 for a number field, stated and declared by both ClassicalSerreModularity `I.0/soluble-totally-real-base-change` and §1.7 here, owner ClassicalSerreModularity (R01); Kisin's potentially Barsotti–Tate theorem, Hypothesis (H) and Theorem 4.1, owner ClassicalSerreModularity §I.2, imported here; `HeckeGaloisDatum`, owner GlobalGaloisDeformations §6.7; the hypotheses LL/CC, stated here and discharged in SerreModularityByCompatibleSystems and CompletedCohomologyAndLocalGlobalCompatibility.

Source independence: 14 passages compared with 10 sources, none shared beyond formulas and standard names (the three statements raised last round are reworded); largest share kw2, 57 of 209 locators; contents compared with kw2: independent (Layers 1–6 draw on its §§7–10 out of order, with Clozel–Harris–Taylor, Kisin and Gee interleaved, and Layer 4 is not in it).

Research link: Layers 1–6 are the lifting theorems of Khare–Wintenberger (2009) and Kisin (2009) behind Serre's conjecture; Layers 7–12 are those of Kisin (2009), Hu–Tan (2015), Tung (2021), Pan (2022) and Skinner–Wiles (1999) that Dieulefait–Pacetti (2023) use. Rests on the README summary and on kw2, dp, pan, tung-odd, tung-dyadic.

## Not verifiable

- Kisin, Modularity of 2-adic Barsotti–Tate representations, proof of Proposition (3.2.9) (§6.7a): no text in the sources cache; the section's Checks and dimension count were computed, the locator was not read.
- Gee, Modularity lifting theorems, §5.6 (§3.4a): the text is in the cache but the passage was not reopened this round; the previous round read it for §3.3.
- Skinner–Wiles (1999), Introduction, Theorem, p. 6 (§11.1): the cached text is an OCR of a scan and the statement's symbols are not legible; §11.1 was checked against Dieulefait–Pacetti's Theorem 1.7 and the supplier target.
- Kisin's Annals, Durham and 2-adic papers are cited by author DVI files that could not be read; page numbers given for the DVI of the Fontaine–Mazur paper were not checked.
- Supplier and consumer heads were read through the roadmap tools; line numbers given for other roadmaps are those of their files at the head named.

## Source issues

- **Misprint** in tung-dyadic at Theorem 8.0.3(3), p. 38: the source says the reduction of ρ is totally odd; it should say ρ itself is totally odd, `det ρ(c_v) = −1`, since the reduction modulo 2 cannot see the sign; affects a stated result.
- **Gap** in dp at Theorem 1.7, pp. 4–5: the source says the determinant is a character ψ times a power of the cyclotomic character, with no condition on ψ; it should require ψ of finite order, as Skinner–Wiles do; affects a stated result.

## For the human reviewers

- **Scope.** Every theorem of Layers 7–12 is conditional on named hypotheses (LL1–LL3, CC1–CC5) that this roadmap does not prove (`README.md`, "Conditional arithmetic hypotheses"); SerreModularityByCompatibleSystems states that it discharges them.
- **Not tested.** Three cited texts of Kisin (the Annals paper, the 2-adic paper, the Durham paper) are cited by author DVI files that the sources service cannot read; wording and locators of §§5.1, 5.6, 5.10, 5.16, 6.7a, 6.8, 6.9 were not compared with them.
