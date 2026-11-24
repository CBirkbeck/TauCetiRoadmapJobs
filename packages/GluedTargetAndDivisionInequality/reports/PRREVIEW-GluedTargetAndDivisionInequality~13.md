# Review of GluedTargetAndDivisionInequality (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 406 changed lines since `aecb53a`. The change gives all 26 sections `*Origin:*` and `*Method of the formal proof:*` labels and gives 8.5c a `*Corollary of:*` line. It also adds supplier-contract entries and references and narrows the formal-proof attribution in the docstring of `pairing_integral_of_localDivision`. It alters or removes no statement, layer or item. Checks:

- the labels against their statements and routes;
- the formal-proof claims of 7.12, 8.2, 8.3 and 8.7 (b) against the formal proof's source;
- every new cross-roadmap citation;
- the readable new literature locators (Bost, Gaudron–Rémond, Bannai–Kobayashi).

Nothing asserts false mathematics, so there is no finding. Accepted with two small corrections and two format notes, none blocking:

- C01: the stated form of 8.2 (c) is not labelled as the roadmap's own.
- C02: the description omits this folder's new suppliers.

Two points are left for the human reviewers.

## C01 — 8.2 (c) as stated is not the formal proof's form, yet neither its Origin label nor the Labels paragraph calls it the roadmap's own formulation

A reader who trusts the Labels paragraph (Conventions, lines 254–258) takes 8.2 (c) as a statement of [FormalProof]. That paragraph lists the sections whose Origin labels name a wider form (7.12, 8.1, 8.3, 8.6, 8.21, 8.24), and 8.2 is not among them.

But 8.2's own Method label (lines 577–578) says the formal proof states (c) only for blocks of one size, with the factor `∏_τ e·(2n_τ + 2)^{2|ι_τ|}`. The formal proof agrees: `BlockBound` in `Formalism/ThetaSupremumBounds/StatementA.lean` is over the index type `Pl × ι`. The statement (line 596) instead has `e·(2n + 2)^{2N}`, for blocks of any sizes, and neither factor bounds the other. Take two blocks of one variable each:

- `n_τ = 0`: `16e² ≈ 118.2` (formal proof) against `16e ≈ 43.5` (here);
- `n_τ = 100`: `e²·202⁴ ≈ 1.23·10¹⁰` against `e·402⁴ ≈ 7.10·10¹⁰`.

The route proves both forms (line 605). The fix would be to add to 8.2's Origin label "(c) as stated, with the factor `e·(2n + 2)^{2N}` for blocks of any sizes, is this roadmap's own formulation", and to add 8.2 to the list on line 257.

## C02 — The description does not say that this roadmap gains two supplier roadmaps

The description lists the new supplier relations between general roadmaps, but for the family it mentions only "the changed citations". In this folder the supplier contracts (lines 2492–2530) gain:

- a subsection `From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII` (§§0.2, 4.6);
- a subsection `From TauCetiRoadmap.MetaplecticAutomorphicForms` (§1.5 (ii));
- three entries for ArakelovGeometryAndAbelianHeights (§§1A.5 (b), 2.9, 4.6).

Each of these sections is on `main` or added by this pull request. A sentence under "For reviewers" would cover it, for example: "GluedTargetAndDivisionInequality now lists ComplexMultiplicationAndExplicitReciprocityPartII §§0.2, 4.6, MetaplecticAutomorphicForms §1.5 (ii) and ArakelovGeometryAndAbelianHeights §§1A.5 (b), 2.9, 4.6 among its suppliers. They are cited in the Conventions and in the labels of 8.2, 8.5c and 8.24."

## N01 — Five lines headed `*Sources:*` name topics, not sources

In 8.1, 8.2, 8.3, 8.8 and 8.10 (lines 560, 612, 652, 926, 1036) the old `*KNOWN*` tag became `*Sources:*` followed by a topic in parentheses. For example, 8.3's "(sub-mean-value estimates for theta functions)" names no work, under an Origin label that calls the bound particular to this proof. Either name the work (Bargmann 1961 at 8.2, Frame–Robinson–Thrall at 8.10), or drop the heading and leave the provenance to the Origin label.

## N02 — Gillet and Soulé's paper is in English, so the lemma is "Lemma 30"

The References entry (line 2672) writes "Lemme 30", which is how Gaudron and Rémond cite it in French.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 7.12 integrality after division (headline; `pairing_integral_of_localDivision`) | Check (i) over `ℚ`, `N = 6ℤ`; Check (iii) in `ℚ(i)`, `R = (2−i)⁻¹𝒪` | `τ₂ = 2`: `N′ = ½ℤ`, value `½ ∉ ℤ`, excluded since `2 > ⌈σ₂⌉ = 1`; (iii): value `(2+i)⁻¹`, hypothesis at `c(𝔭)` fails | consistent; Lean `valuation (c d) = 1` ⇔ `d ∉ c⁻¹(𝔭)` | none |
| 7.12 Method label | formal proof `DivIntoDualShift` | bilinear (`c = id`), `Fin d → K`, local map `ι w · π w`, equality of localisations, `IsShift N N′ τ` | matches label | none |
| 7.14 (route via 7.12 with `c = c_𝕃`) | `ℚ(i)`, `𝔭 = (2+i)`, `N = 𝔭`, `R = 𝒪` | dividing by `𝔭`: integral; by `c(𝔭)`: value `(2+i)/(2−i) = (3+4i)/5` | Method's "route differs" accurate | none |
| 8.1 chain height bound | Check: `m = 1`, `ι` scaling 1 and 4 | `‖B‖² = 1`; bound with `min`: `1·1/1 = 1`; with `max`: `1/4 < 1` | true; `max` variant fails | none |
| 8.2 (a)–(c) | Check `N = 1`, `Th = e^{u²/2}`, `n = 1`; formal proof `BlockBound` | LHS `Ω⁻²`, RHS `144/e ≈ 52.97·Ω⁻²`; factors 118.2 vs 43.5 (`n_τ = 0`), 1.23e10 vs 7.10e10 (`n_τ = 100`) | true; the two forms are incomparable | C01 |
| 8.3 pointwise bound | formal proof `sup_le_mean_square`, rescaling `u = √π·z` | covolume `1 → π^g`, `1/v → h`; constant `3(2g/h+1)^g π^{−g}` = 2.86 at `g = h = 1`; `e^{π/4} = 2.19 ≤ 3` | label accurate | none |
| 8.4 step norm | Check `N = 1`, `n = 2, 4` | `|c_n n!|² = 1, 9` against `√(2/(πn))·n! = 1.13, 9.57` | consistent | none |
| 8.5c transport term, Corollary line | `|d_E| = N(𝔡)·D^{[E:K]}`; `ℚ(i)` heights | `(1/[E:ℚ])·log N(𝔡) = log(rd_E/√D)`; `−1.657107 + ½·log 2π = −0.738168 = −½·1.476336` | consistent with AVIF §8.5, CMER II §4.6 | none |
| 8.6 step height | under `SizeT_u` | `C f m² N_m²(La + C_T m La) ≤ C′ f m³ N_m² La` | own form correctly labelled | none |
| 8.9 explicit height (headline) | 8.1 with `κ = 𝔫/|P_1|` | `−log κ = −log 𝔫 + log|P_1|`, the tail of `h_u` | consistent | none |
| 8.10 (a) | `μ = (2,1)` | hooks `3,1,1`: `H = 3 ≥ 2!·1! = 2`; `Σph = −1.614 ≤ log 3 = 1.099` | true | none |
| 8.20, 8.20b twist cost | sums over primes | `Σ log p/p² = 0.4931`, twice `0.986 < 1`; `Σ 2/p² = 0.904` | true | none |
| 8.20a depth table | Check `g = 13`, `T = 3` | `E/e_v = 13/4 = 3.25 ≤ 3 + 13/24 = 3.542` | true | none |
| 8.21 (c) multiplicities | `24fr ≤ g` | `δ_G = 8fr/g ≤ 1/3`; `e^{1/12} = 1.087 ≤ 1 + 1/6 = 1.167` | true; own deviation labelled | none |
| 8.22 division inequality (headline) | (D4): `Σ_j (2j − 1 − m)` | `p_j − q_j − k = 2j − 1 − m`; `m = 3`: `−2 + 0 + 2 = 0` | Method's route note correct | none |
| 8.23 (a), odd conjugate type | `k ≤ x⁵`, `2^n ≥ x²` | `k·log(2^n)/2^{3n} ≤ 2 log x/x ≤ 2/e = 0.74 ≤ 2` | true | none |
| 8.24a | no twist; `p_□ + q_□` | `r_ij(1) = 1`, valuation `0`; `m − j = 4`: `1 + 2 = 3`; `= 5`: `2 + 2 = 4` | true | none |
| 8.24b (ii) | norm = two coordinates over one stabiliser | `v_𝔭 ≥ −d − d − d = −3d(ℓ)·v_𝔭(ℓ)` | true | none |
| 8.24c (ii), Method label | product formula | `Σϱ|v| = mean log|σx| + 2Σϱv⁻ ≤ mean log⁺ + 6Σϱd_l` | "twice" correct | none |
| 8.24d Origin label | Bannai–Kobayashi Cor. 2.16 | `p ≥ 5` split in `K`, `z₀ ∈ n⁻¹Γ` with `p ∤ n`: translates integral; label says the same | accurate | none |
| 8.24 slope test, Origin label | `c = id`; conjugate lattice | Slopes §2.4 (b) plus §2.1 for `𝔞M`; `idx_𝔭(L^c) = idx_{c⁻¹𝔭}(L)`, `ϱ` equal | consistent with Arakelov §1A.5 (b) | none |

- Source locators read at the text: 6. Bost1996 Prop. 4.3 (1), p. 131 (Bost1996 lines 467–476; PDF page 18 is printed page 131). GaudronRemond2014 Lemme 6.3 and the Gromov citation after it (lines 1009–1022). Bannai–Kobayashi, arXiv:math/0610163v4: §2.1 (line 897), §2.2 (line 978), Prop. 2.14–2.15 (lines 1271–1308), Cor. 2.16 (lines 1331–1346).
- [FormalProof]: all 159 file-and-declaration locators in the README resolve in the operator's local copy. Statements compared: 7.12 (`DivIntoDualShift`), 8.2 (`FockJet`, `SingularIntegral`, `BlockBound`), 8.3 (`sup_le_mean_square`, `sup_le_euclidean`), 8.7 (b) (`HtNums` clauses t1–t10).
- Cross-roadmap citations resolved: 12.
  - ArakelovGeometryAndAbelianHeights §§1A.5 (b), 2.9, 4.6 (head)
  - ComplexMultiplicationAndExplicitReciprocityPartII §§0.2, 4.6 (main)
  - MetaplecticAutomorphicForms §1.5 (ii) (head)
  - ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.5 (c), 8.18b (head)
  - SlopesOfHermitianVectorBundles §§1.2a (iii), 2.4 (b) (head)
  - HeightsAndUnits §0.3 (Completed, main)
  - SingularHermitianMetricsAndL2Methods §3.7 (head)
- Library declarations opened: Mathlib `IsDedekindDomain.HeightOneSpectrum.valuation` (RingTheory/DedekindDomain/AdicValuation/Valuation.lean:314) and `FractionalIdeal.count` (RingTheory/DedekindDomain/Factorization.lean:306), the carriers of the Lean statement.
- Automatic checks: all passed. Dependency check output: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of Suggested.lean gives only the `sorry` warning. `#check @pairing_integral_of_localDivision` elaborates with no section binder lost, and its type matches README 7.12. This pull request changes only its docstring.
- Record: no layer, heading or item of the README at `aecb53a` is removed or retitled; the two added headings are supplier-contract subsections.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities, SeesawForThetaChains, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, FiniteReductiveGroups, UniformWildKernelBounds; nothing shared (each names this roadmap only as supplier or consumer, and the change moves no ownership).

Source independence: 9 passages compared (changed passages only) with 4 sources: Bost1996, GaudronRemond2014, Bannai–Kobayashi 2010 and [FormalProof] (its Lean files carry no prose). None shared. Largest share: [FormalProof], 159 of about 168 locators. Arrangement not compared, since the change adds, removes or reorders no layer.

Research link: The headline targets (integrality after division, the height of the period pairing, the division inequality) are steps of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions, announced 20 November 2026. They rest on Bost's slope inequality (Bost 1996) and the Chowla–Selberg formula (1967). This line rests on the README's summary and References.

## Not verifiable

- Gillet–Soulé 1992, Lemma 30: behind Springer's paywall, and the sources service found no open copy. Checked only through Gaudron–Rémond's citation of it (GaudronRemond2014 line 1022).
- Bargmann 1961, Comm. Pure Appl. Math. 14, 187–214: behind the publisher's paywall; only the bibliographic data was checked.
- Chowla–Selberg 1967, pp. 86–110: the De Gruyter landing page is on a host in no licence class, so the text was not fetched.
- [FormalProof] at commit `40e56bab`: the operator's local copy of the same repository is at `e50d098`. Locators were checked against that copy; I did not check that the two commits agree.
- The description's kernel-export claims (that each declaration is present in the export by name): not searched.

## Source issues

- none

## For the human reviewers

- Scope: the new labels mark 22 of the 26 sections "particular to this proof", 4 "adapted" and none "published". The statements rest on [FormalProof], a public Lean repository announced 20 November 2026 (README References), not on refereed literature.
- The `*Corollary of:*` convention (Conventions, lines 260–266; used once, in 8.5c) states a special case now and the general theorem later. The description calls it a decision of the family's owner. Here the general theorem (ComplexMultiplicationAndExplicitReciprocityPartII §4.6) is already on `main`.
- Licence: the formal proof's repository is cited only by file path and declaration name; its licence was not read.
