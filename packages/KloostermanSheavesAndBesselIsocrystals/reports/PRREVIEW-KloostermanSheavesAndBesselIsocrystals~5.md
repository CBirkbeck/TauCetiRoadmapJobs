# Review of KloostermanSheavesAndBesselIsocrystals (pull request #2289 at 0f55f75)

**Verdict:** accepted

Incremental re-review of the 35 lines changed since `8fd0dad`; no finding. The acceptance is conditional on the 13 declared supplier gaps.

## Previous findings

- R01 — repaired: `README.md:358`–`369` now names semisimplicity with Frobenius forgotten (Abe–Caro Theorem 4.3.1, p. 58), the unipotent radical (D'Addezio Theorem 3.4.4, p. 17), trace independence "nearby cycles included", and the logarithmic fibre at `0` (Xu–Zhu Proposition 2.9.4, p. 24).
- R02 — repaired: the description reads "the two exponential-sum identities … The elementary convolution identity in every characteristic is a README target without a Lean statement (§11.1(iii))"; `Suggested.lean` has four theorems.
- R03 — repaired: `README.md:600`–`601`: "The determinant test detects nothing for `diag(1 + t², 1)`, whose determinant `1 + t² = (1 + t)²` is a square; so not every `diag(1 + y, 1)` … is a witness."
- R04 — repaired: `README.md:1671`–`1677`: radical unipotent (DeligneWeightsAndPurity §5.7), reductive by geometric semisimplicity (§8.19), hence semisimple, commutative, trivial; the `p`-adic side by Abe–Caro semisimplicity and Crew's theorem, both in the gap contract.
- R05 — repaired: `README.md:964` ends "ReductiveGroups Layers 1, 10"; `:1532` begins "§§RD.1.44, RD.2.13–RD.2.16". The further additions (Layer 1 at `:1615`, Layer 2 at `:2612`, `AddChar.sum_eq_zero_of_ne_one` at `:2108`, `:2615`) match the Needs lines of their sections.

## Verified sound

| Statement | Instances tried | Left-side values | Right-side values | Result; change |
| --- | --- | --- | --- | --- |
| gap:arithmetic-d-module-operations, semisimplicity clause (`README.md:364`) | AC line 3019–3020 (p. 58) | README: `ι`-pure, semisimple with Frobenius forgotten | Source: `ι`-pure F-module on a realizable variety, semisimple without Frobenius, not with it | Same hypotheses; none |
| Same gap, radical clause (`:366`) | DAd line 712–717 (p. 17, arXiv v6, the version the references name); rank one on `𝔾_m` | README: radical of the geometric group unipotent; rank one: group in `μ_n`, radical `1` | Without Frobenius, `d − c dx/x`, `c ∉ ℚ`: group `𝔾_m`, radical not unipotent | Frobenius hypothesis is stated and needed; not already in the supplier (§RD.6.66 is rank one only) |
| Same gap, logarithmic fibre clause (`:367`), used by §4.3 | XZ line 1139–1142 (p. 24); `SL₂`, `C(0) = diag(c_q^{−1}, c_q)` | `N C(0)`: entry `c_q` | `q C(0) N`: entry `q/c_q = c_q` | `𝔾_m`, unipotent at `0`, Frobenius-compatible, as in the source |
| §6.2 route, `ℓ`-adic step (`:1671`) | Commutative connected groups `1`, `𝔾_m`, `𝔾_a`, `𝔾_m × 𝔾_a` | Radical unipotent and reductive: only `1` | `𝔾_m`: reductive, radical not unipotent; `𝔾_a`: not reductive | Both inputs needed; §5.7 states "The radical of `G_geom`° is unipotent", §8.19 the semisimplicity |
| §0.2 Check (`:598`–`601`) | `𝔽₂[[t]]`: `1 + t`, `1 + t²` | Squares are series in `t²`: `1 + t` is not one | `(1 + t)² = 1 + 2t + t² = 1 + t²` | Check true; `y` now introduced |
| `orthogonalSum_sub_card_eq_kloostermanSum` (cited by the changed Layer 11 list) | `𝔽₂`, `n = 1`; `𝔽₄`, `n = 1`, all `a` | `U₁ − q`: `−1`; `5, −3, −3` | `R₃(a)`: `−1`; `5, −3, −3` | Holds; statement unchanged |

The rows for the untouched statements stand as in the previous review, of `8fd0dad`.

- Source locators checked against the text: 3 in 3 sources (AC line 3019, p. 58; DAd line 712, p. 17; XZ line 1139, p. 24). All agree.
- Library declarations opened at the pin: 1, Mathlib `NumberTheory/LegendreSymbol/AddCharacter.lean:240` (`AddChar.sum_eq_zero_of_ne_one`, with `[IsDomain R']`); it is listed under "From Mathlib" at `README.md:191`.
- Cross-roadmap citations resolved: DeligneWeightsAndPurity §§5.7, 8.19 and PadicDifferentialEquationsAndRigidCohomology §§RD.1.44, RD.5.103 at their open heads; ReductiveGroups Layers 1, 10 on main. None missing.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: every check 0, `OK`. `lake env lean` on `Suggested.lean`: four `sorry` warnings, nothing else. No change outside the folder.
- The diff changes no Lean declaration; signatures and the one-tactic probe stand as in the previous review.
- Pull request text against this head: two identities, four theorems, the convolution identity as a README target; no supplier added or dropped by the change. No sentence contradicted.
- Seeded sample: the changed passages touch it only through the gap contract used by §4.1 and §7.6, checked in the rows above.

Overlap check: read KloostermanMomentsAndPotentialAutomorphy, GlobalShtukasAndFunctionFieldLanglandsPartII, PadicDifferentialEquationsAndRigidCohomology, PadicDifferentialEquationsAndRigidCohomologyPartII, GeometricSatakeAndFusion and AffineLieAlgebras (scope as in the review of `8fd0dad`; the change moves no ownership); for the changed passages, the `ℓ`-adic unipotent-radical theorem is owned by DeligneWeightsAndPurity §5.7 and cited, and its `p`-adic form is owned by no roadmap and is asked of PadicDifferentialEquationsAndRigidCohomology in the gap.

Source independence: changed passages only; 4 passages compared with 3 sources (AC, DAd, XZ), none shared beyond standard names; largest share XZ, about 100 of 190 locators; the change adds, removes and reorders no layer, so the contents were not compared again (independent in the review of `8fd0dad`).

## Not verifiable

- AS89, Wan93, Wan04, Bal82, DH35, ESDE, KatzCC: uncertified, cited by locator only; none is in a changed passage.
- Crew, *F-isocrystals and their monodromy groups* (1992), Theorem 4.9: not in the manifest; read only through DAd line 715, which the README cites.

## Source issues

- none (none new in the changed passages; the eight of the review of `8fd0dad` stand).

## For the human reviewers

- **Licence.** BD is an unpublished author-hosted preprint, cited at `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:762` and in the references at `:2666`.
- **Scope.** The README corrects XZ in §§3.3, 6.3, 7.6, 8.5, 9.3, 9.4 and 11.1; the review of `8fd0dad` confirmed the corrections numerically or by a short argument, not by a full proof of §3.3(i).
- **Scope.** The board package `packages/KloostermanSheavesAndBesselIsocrystals/README.md` differs from this head (852 differing lines); this review read the pull request head only.
- **Scope.** The README contract of gap:arithmetic-d-module-operations (`README.md:366`) now asks for Crew's unipotent-radical theorem; the `needs` sentence of the same slug in `packages/KloostermanSheavesAndBesselIsocrystals/design/plan.json` does not mention it.
