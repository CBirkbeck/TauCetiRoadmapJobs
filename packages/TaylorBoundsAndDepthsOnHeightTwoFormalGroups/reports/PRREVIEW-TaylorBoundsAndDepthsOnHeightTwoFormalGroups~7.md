# Review of TaylorBoundsAndDepthsOnHeightTwoFormalGroups (pull request #2914 at 5943273)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups/`
**Verdict:** accepted

**Summary.** Accepted: the three findings of the previous review are repaired and the repairs introduce no false statement. The colength bound 4.8c and its use in 4.18 (c) now carry the principal polarisation of the supplier section, the sign Check of 4.4a is restricted and records the twist with sign `+1`, and 4.8b′ (1) now has a route for the polarisation series, which I recomputed step by step. There is one small correction and one format note, neither blocking; the scope and licence questions about the formal proof remain for the human reviewers.

## C01 — The new route of 4.8b′ (1) uses two classical facts that its *Needs:* line does not name

The route for the polarisation series (lines 603–607) starts from "Over `K_R` the formal group law of `𝒜̂` has a logarithm `lg` (characteristic `0`), so its normalised symmetric 2-cocycles are coboundaries". Both facts are needed in dimension `g` and with coefficients in `K_R[[z]]`: the logarithm of a commutative formal group law of dimension `g` over a `ℚ`-algebra, and the vanishing of the normalised symmetric 2-cocycles of the additive group of dimension `g` over a `ℚ`-algebra (Lazard's lemma). The *Needs:* line of 4.8b′ lists 4.8b, AbelianSchemesAndArithmeticModuli A2.3 and PadicDifferentialEquationsAndRigidCohomology §RD.0.30, and no roadmap on main or in an open pull request states the cocycle lemma (a search of all of them for "symmetric 2-cocycle" finds only this sentence), so an implementer has no owner to import it from. Name the two facts on the *Needs:* line, either as steps proved here or with a locator into Hazewinkel's book, which the References already list.

## N01 — The classical references still carry no theorem or page locators

The titles of Lubin–Tate (1965) and Honda (1970) are now given; Hazewinkel, Katz, Mumford, Breen, Cayley and Capelli are still listed for whole ranges of sections. Where a target is marked *KNOWN* (4.1, 4.6, 4.8a) a locator at the claim would let a reader find it.

## Questions for the author

- Does `GlobalTheory.CharMinor.colength_bound` assume a principal polarisation through its moduli datum? Its statement has `p ≠ 2`, an algebraic point and `p ∤ disc(E)`, and no explicit hypothesis on the polarisation; I did not unfold the moduli datum. If it does not, the line on the formal proof under 4.8c could say that the form there is wider.
- 4.19c says that (ii), (iii) and (iv) without bi-blocks hold for every `ℓ ≥ 3`. Is that the range of the formal proof, or this roadmap's own widening? (Untouched text; not checked in this round.)

## Previous findings

- R01 — repaired: 4.8c now reads "an algebraic integral framed point of `M` over `R` (4.8b) whose polarisation `λ` is principal"; 4.18 (c) and the supplier contract on §0.5d (a) carry the same hypothesis.
- R02 — repaired: "The sign `−1` is that of an elliptic curve over `ℤ_p` with good reduction and `a_p = 0`", and the twist by `2 + i` at `7` is recorded with sign `+1`.
- R03 — repaired: (1) now asserts the polarisation series in any integral coordinates, and the route constructs it from the units `e₁, e₂, e₃, e_a` of a rigidified section; C01 of this report is the one loose end.
- C01 (previous) — repaired: the *Needs:* line names `ProperCone.hyperplane_separation_point` and `ProperCone.relative_hyperplane_separation` and says duality is proved here from Farkas' lemma.
- C02 (previous) — repaired: (f) says the route "gives (f) for every prime `p ≥ 3` (the range `p ≥ 5` is the form of [FormalProof], Conventions)".
- C03 (previous) — repaired: the description now says "outside the roadmap folder the pull request changes only the three files of the family index", and states the principal polarisation.
- N01 (previous) — partly repaired: two titles added, no locators; written again as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.4a Check (changed) | `E/ℤ_p`, `a_p = 0`; CM over `ℚ`, inert `p`; twist `(2+i)y² = x³ − x` at `7` | `a_{p²} = −2p`, `s = −1`; Frobenius anticommutes with CM, `π² = −p`, `a_p = 0`; `2·50 − 64 = 36 = 6²`, `s = +1` | holds; supplier §4.4 gives both signs | none |
| 4.6 (f) (changed sentence) | `p = 3`; route term by term | `3^{−3} < 2/3`; `γ = 3/8 ≥ 1/3`; losses `κΣw/p³ + 4Σw/p + 4Σw/p`; odd `e ≥ n_o ≥ 2` is `≥ 3`, `p^e·p^{−3} ≥ 1` | holds for `p ≥ 3`; formal proof has `5 ≤ l` | none |
| 4.6 *Needs:* (changed) | pinned Mathlib | `hyperplane_separation_point`: `x₀ ∉ C → ∃ f, f ≥ 0 on C, f x₀ < 0`; `relative_hyperplane_separation`: `b ∈ C.map f ↔ …`; `map` unfolds to a closure | names exist as cited | none |
| 4.8b′ (1) (changed) | cocycle identities; `τ′ = τ̄`; `τ′ ≠ τ̄` | `δ_x log e₂ = δ_zδ_x h₁`; `h(0,z) = log e₁(0,0;z) = 0`; `B(x,x′) + B(x′,x) = 0`; `B_{ab} = τ(b)B_a + τ̄′(a)B_b`; `Q_{τ,τ′}(x,x′) = Q_{τ′,τ}(x′,x)` | route correct; two inputs unnamed | C01 |
| 4.8b′ (1), uniqueness step | units of `𝒜 × 𝒜`, torus part allowed | a unit is constant on the abelian generic fibre, so constant; value at the origin in `R^×` | holds for semi-abelian `𝒜` | none |
| 4.8c (changed) | supplier §0.5d; `R` a complete DVR | supplier: `B` principal, `p ≠ 2`, `p ∤ disc`, `T` normal for degeneration data; here `λ` principal, `R` normal; `S(τ_s)` same formula | hypotheses match | none |
| 4.18 (c) (changed) | uses of 4.8c | 4.18 (c), 4.19e, 4.19f and headline (3) all carry "principal"; 4.18 (a) takes the characters as a hypothesis | consistent | none |
| Headline (2), Lean (untouched, cited by 4.6) | elaboration | three `sorry` warnings, nothing else | unchanged | none |

Rows for the untouched statements stand as in the previous review, of `ef74e2f`.

- Source locators checked against the text: 3 lines "In [FormalProof]" touched by the change (4.6 (f): `5 ≤ l`, integer `l`; 4.8b′ (1): `intChart_exists` for a host datum; 4.8c: `colength_bound` with `p ≠ 2`, `p ∤ disc(E)` and the same exponent sum), read in a copy of the repository the operator holds.
- Library declarations opened at the pin: `ProperCone.hyperplane_separation_point` (`Mathlib/Analysis/Convex/Cone/Dual.lean`, 132), `ProperCone.relative_hyperplane_separation` (`Mathlib/Analysis/Convex/Cone/InnerDual.lean`, 111), the duality to-do list (`Mathlib/Analysis/Convex/Cone/Basic.lean`, 35–37).
- Cross-roadmap citations resolved in the changed passages: HodgeTateLatticesAndLubinTateLogarithms §0.5d (open head), LubinTateFormalModulesAndQuasiCanonicalLifts §4.4 (open head; `s = 1` is its second Check), AbelianSchemesAndArithmeticModuli A2.3; all found and cited for what they state.
- Dependency check: `depcheck: 170 roadmaps, 1991 edges, 0 problem(s)`; no upward or cyclic edge. The worker's automatic checks all passed at this head.
- Elaboration of `Suggested.lean`: three `sorry` warnings and nothing else; the file is unchanged since `ef74e2f`, so the signature comparison and the one-tactic probe of the previous review stand.
- No file changed outside the folder since `ef74e2f`; no layer added, removed or reordered.
- Pull request text read against the head: no sentence contradicted, no change left unstated.
- Overlap check: read HodgeTateLatticesAndLubinTateLogarithms, LocalGainOfThetaChains, GluedTargetAndDivisionInequality, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties; nothing shared (as in the previous review; the change moves no ownership).

Source independence: changed passages only; 3 passages compared with 1 source ([FormalProof], Lean statements), nothing shared beyond the mathematics; largest share [FormalProof], 21 of 21 located statements; arrangement not compared again (no layer added, removed or reordered).

Research link: The targets are steps of the Lean formalisation of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026), unrefereed, with classical inputs from Lubin–Tate (1965), Honda (1970), Hazewinkel (1978) and Mumford (1969); this rests on the README's References and on [Announcement] lines 9–13 and 116–117.

## Not verifiable

- The remaining 18 lines "In [FormalProof]" and the targets whose routes are stated as not given (4.7 (i), 4.8, 4.19a, 4.19e (a)–(c), 4.19f (o), (g1), (g3)): outside the changed passages, not read in this round.
- Whether the formal colength bound assumes a principal polarisation: its moduli datum was not unfolded (see the questions).
- Hazewinkel's book: no locator is cited and the text was not read, so C01 offers it without a section number.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof], a Lean formalisation announced on 20 November 2026; [Announcement] lines 45–49 say no written proof exists yet. No refereed source states these targets.
- Licence: the README records 63 file paths and many declaration names of the [FormalProof] repository, which is published without a licence; I read three of its statements in a copy the operator holds.
- Not tested: wording and arrangement were compared with [FormalProof] for the three changed locators only; the README numbers its layer "`4` as in the family's core", and the family index says the family "follows" that proof.
