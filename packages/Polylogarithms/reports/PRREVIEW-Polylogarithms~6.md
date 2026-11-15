# Review of Polylogarithms (pull request #1424 at bd1c355)

**Verdict:** needs changes

Incremental re-review of the 36 lines changed since `1cf0554`, and of the pull request's title and description against this head. No P1 or P2 finding; one P3 finding, in the description. The folder's files need no change.

## R01 (P3) — The description's list of suppliers on main omits StableHomotopyKTheory

**Location:** the description, dependency paragraph: “Direct suppliers on main, cited by name: PolylogarithmFunctions, AlgebraicCurves, AlgebraicTopology, AlgebraicVectorBundles, ComplexKahlerGeometry, DGFloer, DifferentialGeometry, GeometricCurrents, GeometricTopology and SchemeAndStackFoundations.”

**Claim:** The list is given as the direct suppliers on main, and one is missing: the README consumes StableHomotopyKTheory, which is on main.

**Witness:** `TauCetiRoadmap/Polylogarithms/README.md:14` (“**StableHomotopyKTheory** §§4.14, 6.1–6.2 and 7.19 own the stable-linear-group H-space, K-spectrum and … decomposition”), `:128`, `:169` (*Needs:* §3.37); `TauCetiRoadmap/StableHomotopyKTheory/README.md` is on main (§3.37 at line 1429, §4.14 at 1649).

**Repair:** “Direct suppliers on main, cited by name: PolylogarithmFunctions, StableHomotopyKTheory, AlgebraicCurves, AlgebraicTopology, AlgebraicVectorBundles, ComplexKahlerGeometry, DGFloer, DifferentialGeometry, GeometricCurrents, GeometricTopology and SchemeAndStackFoundations.” With it the eleven names are exactly the roadmaps on main that the README names.

## Previous findings

- R01 — repaired: `zagierExistence_totallyRealEven` and the Layer 4 section are gone from `Suggested.lean`; the docstring no longer lists it; README `:721` keeps the §4.7 target unbackticked, citing BorelRegulators §5.1.
- R02 — repaired: `:40`, `:1085` “the supplier's degree involution `J_q=(-1)^q`”; `:122` “its action on maps and its natural isomorphisms for fibre products”; `:967` “§5.2’s `Chow.properPushforward`”; `:1343` §§10.23 and 10.12; `:1529` prose; EllipticRegulators deleted.
- R03 — repaired: `:646` “### 4.4 The two Zagier assertions and their normalization”.
- R04 — repaired: `:655` “(§§3.8 and 4.6; Goncharov [G95], Theorem 1.1, p.203, for existence) … Part II treats `n=4` ([GR], Theorem 1.2, p.5)”.
- R05 — partly repaired: the three sentences now agree with the head (“Symbol groups are rational vector spaces over every field”, “no statement assumes one”, PolylogarithmFunctions under main); the list of suppliers on main lacks StableHomotopyKTheory. Written again as R01.

## Verified sound

Rows for the statements the changed text cites; the diff changes no README statement and removes one Lean theorem.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §4.7 totally-real even-weight existence (README only) | ℚ, `n = 2` and `n = 4`, empty family | `Z₂ = π²/√1`, `ζ(2) = π²/6`, so `q = 6`; `Z₄ = π⁴`, `ζ(4) = π⁴/90`, `q = 90` | as stated; BorelRegulators `Suggested.lean:105` gives `ζ(2) = q′π²`, `q′ = 1/6` |
| Conventions: `δ J_q = J_{q−1} ∂_M` with `δ = −∂_M`, `J_q = (−1)^q` | general `q`; `q = 1` | `(−∂_M)(−1)^q = (−1)^{q−1}∂_M`; at `q = 1`: `∂_M = ∂⁰−∂^∞`, supplier's `Σ(−1)^{i−1}(∂ᵢ⁰−∂ᵢ^∞) = ∂⁰−∂^∞` | both sides equal; MotivicEtaleKTheory §1.1 states `Jₙ = (−1)ⁿ` and this boundary |
| §5.15 `res N = sum_(g in G) g_*` from K2SymbolsBrauer §10.23 | supplier's formula with `M = E` Galois, characteristic 0; `F = ℚ`, `E = ℚ(i)`, `n = 1`, element `1+i` | `[E:F]_insep = 1`, embeddings `E ↪ M` are `G`; `N(1+i) = 2`, `(1+i)(1−i) = 2` | the cited section gives the identity; §10.12 is its simple-transfer input, as the text now says |
| §6.2 zero real derivative of `L₃` at one | displayed `dL₃(z)[v]` as `z → 1`, `ρ = |z−1|` | `D(z) → 0`; `log|z| = O(ρ)`, so `log|z|·log|1−z| = O(ρ log ρ) → 0` and `log²|z|/|z−1| = O(ρ) → 0` | limit `0`; PolylogarithmFunctions §4.8 states it in these words |
| §4.4 existence at `n = 3`, source [G95], Theorem 1.1 | ℚ, `y = [1]`; the source's determinant size | `r₁+r₂ = 1`, `L₃(1) = ζ(3)`, `Z₃ = q·ζ(3)` with `q ∈ ℚˣ`; G95 line 249: an `(r₁+r₂)`-determinant for `ζ_F(3)` | locator on the right sentence; GR lines 196–199 are the `ζ_F(4)` statement |
| `Suggested.lean:198` proved example, `multiplicity_primes` | the pin | Mathlib `NumberTheory/Padics/PadicVal/Basic.lean:515` declares it; `padicValNat_primes` is its deprecated alias (line 520) | elaborates without a deprecation warning |
| Description: “eight headline theorems” | count of sorried theorems at the head | lines 118, 139, 145, 150, 162, 221, 232, 262: eight, matching the eight named in the sentence | agrees |

The rows for the untouched statements stand as in the previous review, of `1cf0554`.

- Source locators opened for the changed passages: 4, all as cited. G95 lines 245–249 (Theorem 1.1, p.203), GR lines 196–199 (Theorem 1.2, p.5), BFT line 823 ((6.3), p.16) and line 828 (Lemma 6.4, p.17). Seeded sample in the changed passages: §4.7, §5.8, §6.2; their locators are unchanged.
- Cross-roadmap citations resolved: 6. SchemeAndStackFoundations §5.2 (main, README line 8059, `Chow.properPushforward`); K2SymbolsBrauer §10.12 and §10.23 (open head); MotivicEtaleKTheory §1.1 (open head); ComplexComparisonPartII §C-1.1 (open head: functor on morphisms, natural isomorphisms for `X×_Z Y`); PolylogarithmFunctions §4.8 (main); BorelRegulators §5.1 and `Suggested.lean:105` (open head).
- Names the change removed (`cubicalOrientationChange`, `complexSchemeAnalytification.map`, `.fibreProduct`, `proper-pushforward`, `hasFDerivAt_singleValued_three_one`, EllipticRegulators): no occurrence left in the README. No other roadmap, on main or at an open head, mentions zagierExistence_totallyRealEven.
- Description checked sentence by sentence against the head: adds the folder (three files); eight theorems; consumers Polylogarithms, Part II and HabiroNahmSeries (its open head cites §§2.1 and 2.3); the totally-real sentence matches README `:721`. One defect: R01.
- Gate at `bd1c355`: every check passes. Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Outside-folder diff against the merge base: empty.
- Elaboration of `TauCetiRoadmap/Polylogarithms/Suggested.lean`: exit 0, eight warnings, all `declaration uses sorry` (lines 118, 139, 145, 150, 162, 221, 232, 262). The remaining signatures are unchanged since `1cf0554`.
- Remark, no change asked: the board package ZagierConjecturePolylogarithms (README line 80) still says “the three assertions” of §4.4.
- Overlap check: read BorelRegulators, MotivicEtaleKTheory, PolylogarithmFunctions (the sections the changed text cites); nothing newly shared. The totally-real even-weight rationality is BorelRegulators', now cited and not restated; the cubical complex and `J` are MotivicEtaleKTheory's; the `L₃` differential is PolylogarithmFunctions'.
- Source independence: changed passages only; 4 passages compared with 3 sources (G95, GR, BFT), none shared; largest share G95, as in the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- The items of the previous reports' lists (the full induction of `relationSpecialization_induction` with poles, the OCR-garbled 22-term display of G95, cycle lifting in G95 §9.2, the constant `−4/3` of §5.18, the Borel scalars) are untouched and stand as recorded there.

## Source issues

- none

## For the human reviewers

- **Licence.** [GR] (Goncharov–Rudenko) is read from its arXiv text, recorded in the manifest with year 2026; whether a refereed version with the same numbering exists was not checked.
