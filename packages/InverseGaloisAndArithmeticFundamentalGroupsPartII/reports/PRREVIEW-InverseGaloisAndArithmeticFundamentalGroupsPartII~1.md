# Review of InverseGaloisAndArithmeticFundamentalGroupsPartII (pull request #2263 at 5cf2ffd)

**Verdict:** needs changes

## R01 (P2) — `Mod(D, P)` is defined here, and the supplier is asked for a theorem about it

**Location:** `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:416–420` ("the bijectivity of the homomorphism `π_0 Diff(D, P; ∂D) → Mod(D, P)` … defined in §2.1") and `:1111–1113` ("Define `Mod(D, P)` as … isotopy classes … of orientation-preserving homeomorphisms").

**Claim:** GeometricTopology Layer 3 can supply a bijection onto an object that this later roadmap defines, and the topological mapping class group is needed.

**Witness:** GeometricTopology is on main and cannot cite §2.1 here, so it must define the object itself: two owners. `TauCetiRoadmap/GeometricTopology/README.md:1214–1216` defines `Mod(F)` by diffeomorphisms. §§2.2–2.6 use only `Diff(D, P; ∂D)`; homeomorphisms do not preserve the smooth arcs of §2.2.

**Repair:** Use the supplier's smooth convention and shrink the gap. Tested on `n = 2`: the fibration of §2.1 gives `π_0 Diff(D, P; ∂D) ≅ π_1(Conf_2(int D)) ≅ ℤ` with no homeomorphism group.

- `:1111–1113` becomes: "Define `Mod(D, P) = π_0 Diff(D, P; ∂D)`, the group of isotopy classes relative to `∂D` of diffeomorphisms of `D` that fix `∂D` pointwise and preserve `P` setwise, the convention of GeometricTopology §1.7.2."
- `:416–420` becomes: "What GeometricTopology must provide (gap:geomtop-marked-disc-diffeomorphisms): in Layer 3, the closed subgroup `Diff(D, P; ∂D)` of `Diff(D, ∂D) = TauCeti.DiscDiff 2` preserving a finite set `P` of interior points setwise."
- Delete the API bullet at `:1126–1127`, drop `Mod(D, P) ≅` as a separate link of the chain at `:1141` and the composition at `:1169`, and replace the coning argument in the Check at `:1131–1132` by: "for `n = 1`, `Conf_1(int D)` is contractible, so the exact sequence gives the trivial group."
- Give the plan's `gaps` entry of the same slug the same shortened sentence.

## R02 (P3) — triviality of the mapping class group of the disc is restated

**Location:** `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:1122–1124`: "`Mod(D, ∅)` is trivial: a homeomorphism of the disc fixing `∂D` pointwise is isotopic to the identity relative to `∂D` through the coning isotopy … (ALEX23, pp. 406–407)."

**Claim:** This fact is this roadmap's to state, with its own source.

**Witness:** `TauCetiRoadmap/GeometricTopology/README.md:1236–1239` on main: "`Mod(D²)` is trivial: for homeomorphisms by Alexander's trick …; for diffeomorphisms by Smale's theorem on the square".

**Repair:** Replace the bullet by "`Mod(D, ∅)` is trivial (GeometricTopology §1.7.2)." and add GeometricTopology §1.7.2 to the *Needs:* line at `:1117–1118`. With R01 applied nothing cites ALEX23: remove it from the References.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.6 component ring (EVW16 lines 561–569) | `S₃`, transpositions, `n = 2`; product-one block | 9 tuples, orbits 1+1+1+3+3, `dim R_2 = 5`; `s r_h = r_(∂s h ∂s⁻¹) s = r_h s` when `∂s = 1` | holds | none |
| §0.7 `U_D` (EVW16 line 623) | `C₂`; `S₃`, `D = 1`; trivial `G` | `r_s^(2D)`; degree 2, not 6; `t^D`; block product `g^(Dd) = 1` | holds | none |
| §1.1 degree and shift (EVW16 lines 342–349) | `k[1]` in degree 0; zero module | `M_(0−1) = 0`, not `M_0`; `deg 0 = −∞ ≤ b` for all `b` | holds | none |
| §1.2 `A(M)`, `δ(M)` (EVW16 lines 815–827) | `R = k[t]`, `U = t`, `M = k` and `M = R` | `M[U] = M/UM = k`, `Tor_1 = k[1]`, `δ(k) = 1`; `A(R) = 0` | holds | none |
| §1.4 tensor estimate (EVW16 line 785) | `N = k`; `N = 0` | equality `deg(k ⊗ M) = deg H_0`; `−∞ ≤ −∞` | holds | none |
| §1.5 `Tor` over `R̄` (EVW16 line 800) | `R̄ = k`; `R̄ = k[x]/(x²)`, `V = k` | `Tor_i = 0`, bound `deg V`; `Tor_i = k[i]`, bound `i·1 + 0` attained | holds | none |
| §1.7 higher `Tor` (EVW16 lines 866–898) | induction step with the shift `[a]` | `(b−u−1)A1 + a + δ + A1 u = (b−1)A1 + a + δ ≤ bA1 + δ` iff `a ≤ A1` | holds with `A1 ≥ a` | none |
| §1.8 Nakayama (EVW16 line 899) | `V = R̄`; `V = k[q]`; `k[t,t⁻¹]` over `k[t]` | `deg R̄ ≤ 0 + deg R̄`; `q ≤ q + deg R̄`; coinvariants 0, module nonzero | holds over `R̄` | none |
| §1.9 defect bound (EVW16 lines 909–927) | `k[t]`, `M = k`; `M = R` | `δ = 1 ≤ 1 + 4`; `deg R̄ ≤ 0 + 4A1`; chain `deg R̄ + max(h_1, 3 deg R̄ + h_0)` | holds | none |
| §1.11 K-complex (EVW16 lines 726–740) | `(g, h) ⊗ m`; `A₄`, `g = (123)`, `h = (134)` | `d² = (r_h r_(h⁻¹gh) − r_g r_h)m = 0`; wrong sign: products `h²gh⁻¹ ≠ gh`, both in one class | holds | none |
| §1.12 tensor comparison (EVW16 line 982) | `(g) ⊗ 1` | `r_g` and `r_g · 1` | holds | none |
| §1.13 homotopy `S_g` (EVW16 lines 953–958) | `w = ∅`, `s` with `∂s = b` | prefix `b g b⁻¹`; `d S_g(∅; s) = r_(bgb⁻¹) s = s r_g`; `S_g d = 0` | holds | none |
| §1.15, §1.16 with the enlarged constants | `k[t]`, `M = k`, `q = 3` | `H_q K(R) = k` in degree `q` (even), 0 (odd); EVW constants give bound 2 < 3; README's give 10 | holds | none |
| §3.3 rows (EVW16 lines 1105–1134) | `q = 1`, `(g_0, g_1) = ((12), (23))` | `σ_1⁻¹`: `((23); (13), x)` matches §1.11; `σ_1`: `((13); (12), x)` does not | holds | none |
| §3.5 edge sequence (EVW16 lines 1279–1306) | `G` trivial, `p = 0`, degree 1 | `0 → 0 → k → k → 0 → 0` | holds | none |
| §4.1–§4.2 induction and range | `P > 0`, `n > A2 + 3A0P` | incoming `≤ A2 + A0(3P+4−2j) ≤ A2 + 3A0P` for `j ≥ 2`; diagonal `≤ A2 + A0(3P−1)`; `P < n − 2` from `A2 ≥ 2`, `A0 ≥ 7` | holds | none |
| `hurwitz_homological_stability` | `G = 1`; `full = true`, `n = 0`, `G ≠ 1`; `S₃`, `m = 2`, `n = 1` | `H_p(B_n) → H_p(B_(n+m))`; empty fibres, 0 → 0; sum over `c` gives `[ttt] + 2[ttt']` for both conjugate inputs | consistent with §§4.2–4.5 | none |
| `uniform_betti_bound` | `C = (2\|G\|)^(A+B+a+1)`; `S₄` transpositions | `(A+B+a+1)(i+1) ≥ Ai + B + a`; excluded, `dim R_n` unbounded | holds | none |
| §5.3 étale bound (EVW16 lines 1578–1606, 1461–1466) | `G = 1`, `n = 1`; `S₃`, `n = 2` | scheme empty, `CHur_1/G` contractible: handled apart; 6 generating pairs, product a 3-cycle, fibre `6/6 = 1` | holds | none |
| §2.1 convention witness (touched by R01) | `n = 2`, `∗ = −i` | `h_*(γ_1) = γ_2`, `h_*(γ_2) = γ_2⁻¹γ_1γ_2`, product `γ_1γ_2` fixed; `f ∘ h_*⁻¹ = (aba⁻¹, a)` | holds | R01 |

- Source locators checked against the text: 15 sampled targets in EVW16, plus HW10 lines 1625–1667, CD95 lines 181 and 334, WAH08 line 302, SMA59 lines 15–17; all support the statements as written. The README flags no locator as unverified.
- Library declarations opened at the pins: 38 Tau Ceti (for example `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:477, 494`, `TauCeti/Geometry/Diffeomorphism/Disc.lean:63`, `TauCeti/AlgebraicTopology/FatRealization.lean:89, 204`) and 14 Mathlib (for example `Mathlib/GroupTheory/Sylow.lean:200, 347, 842`, `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76`); all exist where cited. No Hurwitz action exists at either pin.
- Cross-roadmap citations resolved: parent §§IG.3.2, IG.5.1–IG.5.3, IG.5.5 (nine named targets, at the head of its open pull request); ReductiveGroups 11A, 11B; ClassifyingSpaces Stage 4 items 16–17; AlgebraicTopology §§4.7, 5.1, 5.3, 5.5, 8.1–8.5; GeometricTopology §§1.7.2, 3.3, 3.4; DGAInfinity Layer 5. All found. Eight gaps: same slugs in the plan and the README, each with a named supplier.
- Gate: every check passed. Elaboration: `sorry` at lines 475 and 492 the only warnings. One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) closes neither theorem. Elaborated types of both headlines compared with §4.5 and §5.2: same binders and quantifier order.
- Dependency check: `depcheck: 218 roadmaps, 1938 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Pull request text read against the head: no sentence contradicted.
- Overlap check: read ArithmeticStatisticsPartVIII, InverseGaloisAndArithmeticFundamentalGroups, GeometricTopology (main and its open revision), AlgebraicTopology; the EVW chain is shared with ArithmeticStatisticsPartVIII §5.16 (settled earlier as a human decision, see the last section); `Mod(D, P)` is shared with GeometricTopology (R01, R02); nothing else shared. TeichmullerGeometry, AlgebraicTopologyPartII and KhovanovHomology were searched by object (arc complex, marked disc, component ring, nonsplitting) with no hit, not read.
- Source independence: 21 passages compared with 2 sources (EVW16, HW10), none copied; one attributed 8-word phrase at `README.md:754` against EVW16 line 700; largest share EVW16, 117 of 147 locators; contents compared with EVW16: Layers 0–5 against §§2–7 are not one to one (Layer 0 draws on §§2 and 3, Layers 2–3 split §5 and add HW10 §7 and the mapping class identification, Layer 5 joins Proposition 2.5 to Proposition 7.8); §§1.3–1.10 pair with EVW 4.3–4.10 in order, which the *Needs:* lines of §§1.5, 1.7, 1.9, 1.10 force apart from the positions of §§1.3, 1.6, 1.8: independent.

## Not verifiable

- PAL60 Theorem A and ALEX23 pp. 406–407: settled as uncertified, cited by locator only.
- Page numbers of CD95 and HAT91: only the cached line numbers were read; HAT91 lines 101–106 were outside the sample.
- Agreement of EVW16's arXiv numbering with the published article: only the arXiv text is in the cache.
- Ownership against open pull requests whose checkouts were not listed (the parent and ArithmeticStatisticsPartVIII were read through the roadmap index, not a checkout).

## Source issues

- **Misprint** in EVW16 at Definition 2.2, p. 9: the source says the last two fibres are generating tuples of `c^n` and of `G^n`, in that order, and that `Sur(π, G)` lies in `Hom^c`; it should be the reverse order, and only `Sur^c` lies in `Hom^c`; affects nothing.
- **Misprint** in EVW16 at proof of Lemma 4.6, p. 18: the source says the kernel of the first map is a quotient of `M ⊗_R R[U]`; it should be `R[U] ⊗_R M`, as in (4.6.3); affects nothing.
- **Gap** in EVW16 at proof of Lemma 4.7, p. 19: the source says the spliced resolution has `P_0 = P_1 = R` with unshifted `Q_i`; it should shift `P_1` and the `Q_i` by `deg U`, adding `deg U` to (4.7.4); affects the proof.
- **Error** in EVW16 at Proposition 4.13 with (4.5.3), pp. 18 and 21: the source says the bound has slope `A1 = A(R)`; it should require `A1 ≥ 1`, since for trivial `G` the bound is 2 while `H_3 K(k)` has degree 3; affects a stated result.
- **Error** in EVW16 at §5.2, p. 23: the source says `A_q = B_n/L_q` for every `q`; it should be empty for `q ≥ n`, since a `q`-simplex needs `q + 1` distinct endpoints; affects nothing.
- **Error** in EVW16 at (6.1.6), p. 29: the source says `U` acts on the stratum of `Q` as `|c|/|c ∩ Q|` times `U_Q`; it should be `U_Q` itself, each summand with `g ∈ Q` occurring once; affects nothing.
- **Gap** in EVW16 at §7.3 with Lemma 7.4, p. 32: the source says type `c` constrains inertia at every branch point; it should exclude `∞`, since for `S₃` and `n = 2` the monodromy at `∞` is a 3-cycle; affects a stated result.
- **Misprint** in EVW16 at (7.8.3), p. 35: the source says stabilization goes from `n` to `n + D` with `ℓ > max(q, |G|, n + D)`; it should be `n + D|g|` in both places; affects nothing.
- **Gap** in HW10 at Lemma 7.1 and Proposition 7.2, pp. 34–35: the source says `Δ_0` is a finite set; it should be finite and nonempty, since with no boundary points there are no arcs; affects a stated result.

## For the human reviewers

- **Scope.** ArithmeticStatisticsPartVIII §5.16 (open pull request #1179, merge order line 146; this roadmap line 225) plans the same chain, from the component ring to the étale Betti bound; `README.md:110–121` says so and imports nothing. Earlier rounds left the choice of owner to a human.
