# Review of GeometricTopology (pull request #1797 at 308252e)

**Verdict:** needs changes

Six findings: one P2 and five P3.

- **R01:** the repair of the previous review's R03 also moved the Milnor conjecture to GeometricTopology, Part II. CombinatorialHeegaardFloer on main already plans that theorem.
- **R02–R05:**
  - stale text still claims the smooth Poincaré statement for Layer 8.6;
  - a Check in 2.1 is false;
  - the new Agol statement spells out an asphericity predicate the pin already has;
  - a theorem in 7.3 has no locator and no owner.
- **R06:** the order against #1791 is still not stated (previous R12).

Eleven of the previous review's twelve findings are repaired; the table is under *Verified sound*. The gate, the build, the dependency check, the `#check` audit and the one-tactic probe are clean.

## R01 (P2) — The Milnor conjecture gets a second owner

**Location.** `TauCetiRoadmap/GeometricTopology/README.md`:

- *Scope and ownership*, lines 312–317: "It also owns the proofs of three theorems … the Milnor conjecture `g₄(T(p, q)) = (p − 1)(q − 1)/2` (through `τ`, CombinatorialHeegaardFloer Lane G, item 7)";
- the same assignment in 4.8.3, lines 6104–6105 and 6165–6166;
- in 6.5's *Torus knots* Check, lines 8415–8417;
- in *Downstream consumers*, lines 10996–10998.

**Claim.** GeometricTopology, Part II owns the proof of the Milnor conjecture that 4.8.3 consumes as stated. The previous head named CombinatorialHeegaardFloer as the owner instead. What another roadmap plans is imported, not planned again.

**Witness.** CombinatorialHeegaardFloer's README on main, line 284 (Lane G, item 7), reads: "`τ(T_{p,q})` via the canonical cycle; **the Milnor conjecture**". Item 10 (line 302) gives `|τ(K)| ≤ g_s(K)`. Lane K (line 326) carries both to this roadmap's knots.

**Repair.**

- *Scope and ownership*, lines 312–318:
  - write "the proofs of two theorems", dropping the Milnor clause;
  - add: "The Milnor conjecture `u(T(p, q)) = g₄(T(p, q)) = (p − 1)(q − 1)/2`, which 4.8.3 also consumes as stated, is CombinatorialHeegaardFloer's (Lane G, items 7 and 10, carried to Layer 4's knots by its Lane K)."
- 4.8.3, lines 6104–6105: "its proof is CombinatorialHeegaardFloer's (Lane G, items 7 and 10, through its Lane K comparison with Layer 4's knots)".
- 4.8.3, line 6166: "Kawamura's theorem consumed as stated (*Scope and ownership* names their owners)".
- 6.5, lines 8415–8417: "its proof is CombinatorialHeegaardFloer's (Lane G, items 7 and 10), and it is not proved here".
- *Downstream consumers*, lines 10996–10998: "nothing of CombinatorialHeegaardFloer is consumed here as a supplier; its Lane G, items 7 and 10, proves the Milnor conjecture that 4.8.3 consumes as stated".

**Tested.** I applied these five edits to a scratch copy and ran the dependency check: `depcheck: 235 roadmaps, 2293 edges, 0 problem(s)`. No cycle appears, since the *Needs* line names no new supplier. On `T(2, 5)` the theorem reads `u = g₄ = 2 = (2 − 1)(5 − 1)/2`, matching 6.5's own signature value.

## R02 (P3) — The smooth Poincaré statement is still claimed for Layer 8.6

**Location.** README:

- line 151: Layer 8 owns "the statement of the Poincaré conjecture in its smooth form (Layer 8.6)";
- line 9104: "The Poincaré conjecture is stated in its topological and in its smooth form";
- line 9725 (8.6 *Needs*): "the smooth form";
- line 9757 (*Dependencies*): "for the smooth Poincaré conjecture";
- *Downstream consumers* (lines 10956–11020) does not list Poincare3D.

**Claim.** Layer 8.6 states the smooth form.

**Witness.** 8.6, line 9650, reads: "This layer states only the topological form". Poincare3D on main states the smooth form as `poincare_3d_smooth` (Layer 13) and `poincare_3d_smooth_homotopyEquiv` (target 15.2). It consumes Layers 1, 2, 7 and 11 (its README line 61).

**Repair.**

- Line 150–151: "… through the eight model geometries (Layer 8.6)."
- Line 9104: "The Poincaré conjecture is stated in its topological form (its smooth form is Poincare3D's), and the eight model geometries …".
- Line 9725: "For the Poincaré route and the eight geometries also Tau Ceti …".
- Line 9757: "… the uniqueness of smooth structures, for the Poincaré route and the eight geometries)".
- Add to *Downstream consumers*: "**Poincare3D** consumes Layers 1, 2, 7 and 11, and states and proves the smooth Poincaré theorem, including Mathlib's `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 3` (8.6)."

**Tested.** I made these edits on the scratch copy of R01. The dependency check still gives `0 problem(s)`. The remaining "smooth form" mentions (lines 268, 496–502, 9644–9651) all assign the smooth form to Poincare3D.

## R03 (P3) — 2.1's *Half-line* Check is false

**Location.** README lines 2089–2091: "`[0, ∞) ⊂ ℝ` is a locally flat embedding of a manifold with boundary only in the half-space model".

**Claim.** The inclusion `[0, ∞) → ℝ` satisfies `TauCeti.IsLocallyFlat (EuclideanHalfSpace 1) F'` for some `F'`.

**Witness.** The pinned predicate (`LocallyFlat/Basic.lean:390`) needs a chart `φ : U ≅ W ⊆ H¹ × F'` at `0` with `φ(U ∩ [0, ∞)) = W ∩ (H¹ × {0})`. For `F' = ℝ⁰` this forces `U ⊆ [0, ∞)`. For `F' = ℝᵏ`, `dim W = k + 1 ≥ 2`, which invariance of domain excludes.

**Repair.** Replace the Check by:

> *Half-line.* `[0, ∞) ⊂ ℝ` is locally flat in neither model. A boundaryless slice `ℝ × {0}` would give the punctured image germ at `0` two components, not one. A half-space slice chart would map a neighbourhood of `0` in `ℝ` onto an open subset of `EuclideanHalfSpace 1 × F'`, which invariance of domain excludes for every `F' = ℝᵏ`. The half-space model needs an ambient manifold with boundary, as for the ray in the half-plane below.

**Tested.** The ray `{(0, t) : t ≥ 0}` in `{y ≥ 0}` with chart `(x, y) ↦ (y, x)` (the *Three different predicates* Check, lines 2101–2103) is a half-space slice chart. The half-line in `ℝ` fails in both models, as computed above.

## R04 (P3) — The Agol headline spells out an asphericity predicate the pin already has

**Location.**

- `TauCetiRoadmap/GeometricTopology/Suggested.lean` lines 288–291: `(hM : ∀ (k : ℕ) (x : M), 2 ≤ k → Subsingleton (HomotopyGroup (Fin k) M x))`.
- README 7.4, lines 8981–8983, which describes that hypothesis.
- *From Tau Ceti*, which never names `TauCeti.IsAspherical`.

**Claim.** The pins have no asphericity predicate.

**Witness.** `TauCeti.IsAspherical X x` at `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59` is `PathConnectedSpace X ∧ ∀ n, Subsingleton (π_ (n + 2) X x)`. `IsAspherical.of_basepoint` (same file) makes it base-point free.

**Repair.**

- In `Suggested.lean`:
  - add `public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic`;
  - replace `[ConnectedSpace M] (hM : …)` by `(x : M) (hM : TauCeti.IsAspherical M x)`.
- In 7.4, write "with `TauCeti.IsAspherical M x` (path-connected, `π_(n+2)` trivial)" instead of the spelled-out hypothesis.
- List the predicate and its file under *From Tau Ceti*.

**Tested.** On a scratch copy, `theorem (M : Type u) [TopologicalSpace M] [T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) 0 M] [CompactSpace M] (x : M) (hM : TauCeti.IsAspherical M x) : TauCeti.IsVirtuallyHaken M := by sorry` elaborates with `lake env lean`; its only warning is the `sorry` one. It is equivalent to the current form: a connected manifold is path-connected, and asphericity is base-point free. `S³` (`π₃ ≅ ℤ`) and `S² × S¹` (`π₂ ≅ ℤ`) remain excluded; `T³` satisfies it.

## R05 (P3) — 7.3 states the hyperbolic Dehn surgery theorem without locator or owner

**Location.** README lines 8801–8803: "Dehn filling (Layer 5.2) of all but finitely many slopes on a cusp produces hyperbolic manifolds (Thurston's hyperbolic Dehn surgery theorem, Chapter 5), with volumes converging to the volume of the cusped manifold from below."

**Claim.** The bullet is a 7.3 statement, located in Thurston's Chapter 5.

**Witness.** In `thurston-gt3m`, hyperbolicity is Theorem 5.8.2 (line 2642), strict decrease is Theorem 6.5.6 (line 3739), and the limits are in §6.6 (lines 3766–3772). 7.3's *Needs* (7.1, 7.2, 5.2, 8.2) covers no deformation theory; *Scope and ownership* never names it.

The bullet is used by 7.4's *Fillings approach from below* Check (lines 9033–9036).

**Repair.**

- Write "(Thurston, Theorem 5.8.2), with volumes strictly smaller (Theorem 6.5.6) and converging to the volume of the cusped manifold (§6.6, after Corollary 6.6.2)".
- Then do one of the following:
  - add to the bullet "stated here; its proof is GeometricTopology, Part II's", and list it in Part II's paragraph of *Scope and ownership*;
  - or give its route and inputs in 7.3's *Needs* line.

**Tested.** Theorem 5.8.2 gives hyperbolicity for all `(d₁, …, d_k)` in a neighbourhood of `(∞, …, ∞)`, which is all but finitely many slopes per cusp. Theorem 6.5.6 gives `v(M₂) < v(M₁)` for a proper filling. Together they give the 7.4 Check its values: fillings of the figure-eight exterior (`2.0298…`) have volume below `2.0298…` and above `0.9427…`.

## R06 (P3) — The order against #1791 is still not stated

Re-raises R12 of the previous review (no repair report marks it settled).

**Location.** The pull request's description. Its hand-written *Merge order* names an order only against #1220. The generated `merge-order` block says: "No order is fixed against a pull request listed under 'Also changed by'".

**Witness.** `overlaps.md` reads: "#1791 and #1797 conflict in … `TauCetiRoadmap/GeometricTopology/README.md`". #1791's copy of this README is the 1174-line text from before #903. Its line 885 hands Radó's theorem to PlanarTopology, which this roadmap may never cite.

**Repair.** Add to the description's *Merge order* paragraph: "#1791 also changes GeometricTopology; it is rebased onto this revision once this lands, keeping Radó's theorem in Layer 11.2.1."

## Verified sound

### Gate, build, dependency check, `#check` audit, probe

- **Gate.** The worker's gate is all `0`, `OK`. My re-run gives every check `0` except `outside-folder=3`: the three files of `RepresentationTheory/LieHighestWeight/`, which the brief names as this pull request's own. The brief's diff outside the two folders is empty.
- **Dependency check** at this head: `depcheck: 235 roadmaps, 2297 edges, 0 problem(s)`. On the scratch copy with R01 and R02 applied: `2293 edges, 0 problem(s)`.
- **Build.** `lake env lean` on `Suggested.lean` gives 34 theorems and 34 warnings, all `declaration uses sorry`, with no error.
- **`#check` audit.** I put `#check @name` for all 34 declarations in one scratch file. Every elaborated type matches its README statement. The file has no `variable` block, so no binder can be lost. I changed nothing.
- **One-tactic probe.** I replaced every `sorry` by `first | rfl | trivial | decide | infer_instance | (simp; done) | sorry`, and all 34 still fall back to `sorry`.
  - `thurston_euler_class_inequality` and `virtual_haken_conjecture` are corollaries of the new general forms. The pin has no lemma that closed hyperbolic manifolds are `IsSphereBoundsBall` or aspherical; I searched Tau Ceti. So neither is a one-step consequence, unlike the deleted `cerf_theorem`.
- **README and Lean agree.** All 34 names occur backticked in the README. The removed names `cerf_theorem`, `yazdi_theorem` and `nonempty_diffeomorph_sphere_of_simplyConnectedSpace` occur nowhere.

### Previous review (r83, at 0716443)

| Id | Passage at this head | Status |
|---|---|---|
| R01 | No FourManifolds supplier edge. Scope lines 278–281: "this roadmap states nothing on that manifold"; `E₈` only as Checks (lines 10609–10615, 10866–10868) | repaired |
| R02 | dependency check: no UPWARD line | repaired |
| R03 | Scope lines 312–318; 5.4.2 lines 7755–7760; 4.8.3 lines 6114–6117 | repaired; the same edit created R01 |
| R04 | 11.2 lines 10538–10543 ("isomorphic subdivisions"); Check lines 10597–10604; 11.3 Check "their complexes have isomorphic subdivisions" | repaired |
| R05 | `Suggested.lean` lines 424–431 and 451–459; README 10.5 lines 10276–10282 and 10319–10323; docstring lines 92–96 | repaired |
| R06 | `Suggested.lean` lines 288–293; 7.4 lines 8979–8986; Check lines 9009–9013 | repaired; hypothesis form is R04 |
| R07 | `cerf_theorem` deleted; 3.4 lines 2436–2437; docstring lines 65–67; Summary no longer lists Cerf | repaired |
| R08 | *From Mathlib* lines 496–502 cite `NonemptyDiffeomorphSphere`; 8.6 lines 9644–9651 defer to Poincare3D target 15.2 | repaired by citation; leftovers are R02 |
| R09 | lines 2657, 2696–2697, 2714, 11098–11099 and `Suggested.lean` line 146 read Proposition 16.10, p. 187 and pp. 3–4; line 8392 reads Livingston §9.5 | repaired |
| R10 | References lines 11038–11043 now name `3Mfds.pdf` | repaired (below) |
| R11 | 4.10.5 (lines 6532–6602) states Schubert's normal form with its route and adds a palindrome Check | repaired |
| R12 | description unchanged on #1791 | not repaired: R06 |

R10 detail:

- I fetched `3Mfds.pdf` into the cache, without a manifest entry. Its numbering matches every README citation:
  - Lemma 1.11 at its line 681;
  - Propositions 1.12, 1.13 and 1.14 at lines 707, 811 and 837;
  - Lemmas 1.16–1.18 at lines 884, 915 and 928;
  - Proposition 3.7 at line 2205; Theorem 3.8 at line 2219, whose remark cites Proposition 1.13;
  - Theorem 2.3 on p. 37 and Theorem 1.9 on p. 18.
- The Moise clause now cites Scharlemann §7: `scharlemann2002` lines 953–957.
- The package manifest's `hatcher-3m` still records the shorter `3M.pdf`, not `3Mfds.pdf`. The worker may want to add that URL; it is not a README change.

### Seeded sample (15 targets)

| Target | Source check | Mathematics |
|---|---|---|
| 2.1 | Brown 1962 not cached; pinned `IsLocallyFlat.comp` (`LocallyFlat/Basic.lean:721`) has the compatibility hypothesis the route derives | Checks hold except *Half-line* (R03) |
| 2.2 | `brown1960` (cache `51ec0a58`) Theorem 5 at lines 101–113 with Theorems 2 and 4 supports the statement; the boundary-parametrization clause follows by coning a homeomorphism of `Sⁿ⁻¹` | holds |
| 3.1 | Hirsch uncertified (settled) | holds (table) |
| 4.2 | Lickorish and Birman not readable (settled or not cached) | holds (table) |
| 4.2.2 | no outside source | holds; Jones values computed by script |
| 4.6.4 | Manolescu SIAM Review survey not fetched | holds (table) |
| 4.6.5 | `fyhlmo1985` line 240 (p. 244) gives the composition formula exactly | holds |
| 4.8 | Turaev, Armond–Lowrance, Morton, Franks–Williams, Schubert not cached | holds (table) |
| 4.8.1 | `kalfagianni2016` Theorem 3.2 (lines 232–244) agrees under `n = r + 1`, `t = A⁻⁴` | holds |
| 4.8.2 | none cited | holds (table) |
| 4.10.2 | Knot Atlas only | holds (table) |
| 4.11 | Jones `jonesakl.pdf` §7.5 not cached | holds (table) |
| 7.2 | all checked against `thurston-gt3m`, `loeh2006` (by line) and `zastrow1998`, below | holds |
| 7.3 | `thurston-gt3m` Lemma 6.5.4 (line 3685), §3.1 (line 775); Prasad, Ratcliffe not readable | R05 |
| 11.1 | `hatcher-at` Proposition A.1 (line 22534), Theorem 2.35 (line 6051) | holds |

7.2 locators checked:

- `thurston-gt3m`:
  - Lemma 5.9.1 (line 2772), Proposition 5.9.2 (line 2788), Corollaries 5.9.3 and 5.9.5 (lines 2805 and 2859);
  - Proposition 6.1.4 (line 3269), Corollary 6.1.7 (line 3314), Definition 6.1.8 (line 3369), Theorem 6.2 (line 3372);
  - the §6.3 opening, on every dimension (lines 3453–3456), and Lemmas 6.3.1–6.3.2 (lines 3457 and 3463);
  - §3.2, a manifold with geodesic boundary (line 805).
- `loeh2006`:
  - Theorem 1.2 (line 39), Theorem 3.3 (line 271), Theorem 3.5 (line 322), Remark 3.6 (line 332);
  - Definitions 3.7–3.9 (lines 377–394), Lemmas 3.10–3.11 (lines 413 and 435), Theorem 4.1 (line 476);
  - Definitions 5.1, 5.2 and 5.6 (lines 588, 608 and 652), Propositions 5.3 and 5.5 (lines 613 and 635);
  - Theorems 5.7 and 5.9 (lines 661 and 681), §5.4 (line 673), Corollary 6.2 (line 712);
  - Monod's Theorem 7.4.5 and Lemma 7.2.6 as cited there (lines 347 and 363).
- `zastrow1998` Theorem 3.4 (line 576).

Further locators checked:

- `agol2013` Theorems 9.1 and 9.2 (lines 27–30); Kirby's Problems 3.50–51 (line 32).
- `yazdi2016`: inequalities (1) and (2) (lines 51–60), Theorem 1.2 (line 100), the `C^{∞,0}` setting (line 103), the Main Theorem (lines 111–114), Definition 1.1 (lines 81–83).
- `manolescu2016` Theorem 1.1 (line 15), Section 1 on Casson (line 104), non-orientable 5-dimensional examples (line 257).
- Manolescu's JAMS paper (arXiv 1303.2354v4, fetched into the cache only): Corollary 1.3 (line 72), with orientable 5-manifolds triangulable right after it (line 79), as 11.4 states.
- `hatcher-at` Proposition 3.29 (line 10370); `livingston2005` Theorem 2.2 (line 130) and §9.5 (lines 815–819); `smale1959` Theorems A, B and 4 (lines 8, 15, 124).

### Adversarial table (values computed by hand, by pure-Python scripts, or read at the pin)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 *Half-line* | `[0, ∞) → ℝ`, `F' = ℝ⁰`, `ℝᵏ` | `ℝ⁰`: `U ⊆ [0, ∞)` against `U ∋ 0` open; `ℝᵏ`: `dim W = k + 1 ≥ 2` against `1` | false | R03 |
| 2.1 Checks | trefoil cone; `t − sin t`; Möbius core | `x ↦ (12), y ↦ (123)` gives `x² = y³ = 1`, onto `S₃`; derivative `1 − cos t` vanishes only at `0`, still injective; cutting along the core leaves one band | hold | none |
| 2.2 Brown | horned and round spheres | horned not bicollared; Brown Theorem 5 gives two cells | holds | none |
| 3.1 *C¹ only* | `f_k = θ + k⁻² sin kθ`, `k ≥ 2` | `f_k' = 1 + k⁻¹ cos kθ ≥ 1/2`; `C¹` distance `1/k → 0`; `sup |f_k''| = 1` | holds | none |
| 3.1 non-compact | `x ↦ x + b(x − k)`, `|b'| < 1` | derivative `> 0`; support leaves every compact set | holds | none |
| 4.2 planarity | one crossing, pairs `0–2`, `1–3`; connected `n` crossings | face permutation is one 4-cycle, `V − E + F = 1 − 2 + 1 = 0`; `F − n = 2 ⟺ F = n + 2` | holds | none |
| 4.2.2 | `β`, `γ`, `Mβ` | `a⁻¹ba = bab⁻¹` gives `Mβ = γ`; exponent sums `−8, 8, 8`; permutations 3-cycles; `V(γ) = t³ + t⁶ − t⁷ + t⁸ − t⁹ + t¹⁰ − t¹¹`, `V(β) = V(γ; t⁻¹)` | holds | none |
| 4.6.4 diagonals | `l − m`; trefoil `−2l² − l⁴ + l²m²`; unlink; `4₁` | `0`; `−2s²`, mirror `1 − 2s⁻² − s⁻⁴`; `−1 − s⁻²` twice; Jones check on `4₁` with `l = it⁻¹` | holds | none |
| 4.6.5 | composition formula; adjacent sector | `(1 − μ²)N(ST)` equals the right side term by term; `B² = −l⁻¹mB − l⁻²I`, determinant `l⁻²(1 − μ²)`; `h_x h_y = h_z` | holds | none |
| 4.8 MFW | `T(3,4) = (σ₁σ₂)⁴` | `P(1, z) = 1 + 5z² + 5z⁴ + z⁶ = ∇(8₁₉)`; `P(2, −3/2) = 4433 − 5456 + 1024 = 1`; `V = t³ + t⁵ − t⁸`, span 5 | holds | none |
| 4.8 split unlinks | 2 and 3 components | spans `1 = 0 + 2 − 1`, `2 = 0 + 3 − 1` | holds | none |
| 4.8.1 | trefoil; `F_r(1)` | degrees `5, −7`, breadth `12`; `F_r(1) = (−1)^r(r + 1)` by Chebyshev parity; `4d₋ = −2c₋r² + 2r(w − s_A)` against Kalfagianni | holds | none |
| 4.8.2 | `L₄`, reversed, `L₋₄` | `V(i)` with `t^{1/2} = e^{iπ/4}`: `+√2`, `−√2` (factor `t⁻⁶`), `+√2`: Arf `1, 0, 1` | holds | none |
| 4.10.2 | `a = (1234)`, `b = (1243)`; `V₆`, `V₉` | `w = (132)`, `aw² = w²b = (1324)`, `a²b = (14)`; both `det(tV − Vᵀ) = −2t² + 5t − 2` | holds | none |
| 4.11 | swap; `T(p,1)`; Whitehead link | `U₀ = I`, `U₁ = P₊ − P₋`; quotient `1`; determinant `16` prime to 3, so 3 colourings | holds | none |
| 5.4.2 | `S(17, 4)` | orbit `{2, 15, 9, 8} ∌ 4`; `2n² ∈ {2, 9}` for `mn ∈ {8, 9}`; `|±17 − 2rs| = 1` forces `|rs| ∈ {8, 9}` | holds | none |
| 7.2 | cusp; torus `ω`; wrapped loops; smearing | `∫_h^∞ A_E z⁻³ dz = A/2`; `∫ dω = ¼ sin(π/2) = ¼`; `Σ i⁻² = π²/6`, `Σ i⁻¹ = ∞`; total variation `vol(M)`, integral `v(σ) vol(M)` | holds | none |
| 7.3 HDS bullet | Theorems 5.8.2 and 6.5.6 | hyperbolic near `(∞, …, ∞)`; `v(M₂) < v(M₁)` | locator, owner | R05 |
| 7.4 Checks | `1, 1` filling; Whitehead chirality | blow-down coefficient `1 − 0² = 1` on a trefoil or figure-eight; `σ₁²σ₂⁻¹σ₁σ₂⁻¹`: 2 components, `V = −t^{−3/2} + t^{−1/2} − 2t^{1/2} + t^{3/2} − 2t^{5/2} + t^{7/2} ≠ V(t⁻¹)` | holds | none |
| `agol_virtually_haken_of_aspherical` | `S³`, `ℝP³`, `S² × S¹`, `T³` | `π₃ ≅ ℤ`, `π₃ ≅ ℤ`, `π₂ ≅ ℤ` excluded; `T³` aspherical and Haken; repaired form elaborates | holds | R04 |
| `thurston_…_of_isSphereBoundsBall` | `S³`; `T³` linear; `Σ₂ × S¹`; `S² × S¹` | no taut foliation (Novikov), vacuous; `e = 0` bounded; `|−2| ≤ 2`; tubed torus `|⟨e, [T]⟩| = 2 > 0`, hypothesis excluded | holds | none |
| `thurston_euler_class_inequality` | hyperbolic `M` | needs "hyperbolic ⇒ `IsSphereBoundsBall`", absent at the pin | not padding | none |
| `yazdi_infinite_family` | `k = 0`; `EulerClassNormOne` | empty family gives the pinned proposition; bounded plus a sharp `S` with `χ(S) < 0` iff `x*(e) = 1`; real parity lifts to `2b̃ ∈ 2H²(M; ℤ)` | holds | none |
| `markov_theorem` | `σ₀ ∈ B₂` and `1 ∈ B₁`; trivial `B₂` | one stabilization; unlink against unknot (`not_markovEquiv_one_of_ne`) | holds | none |
| Property P/R, `gordon_luecke_theorem` | `S³_{p/q}` of a knot | `H₁ = ℤ/p`; only `s = 0` can give `S¹ × S²` | holds | none |
| `mostow_rigidity` | genus two | `6g − 6 = 6` parameters, all area `4π`; `3 ≤ finrank` needed | holds | none |
| Poincaré (topological) | `S² × S¹`; Poincaré sphere | `π₁ = ℤ`; `|π₁| = 120` | holds | R02 (prose) |
| Moise / Hauptvermutung | `h`, `φ ∘ h`, `φ(tu) = t³u` | same complex `K`; no common subdivision | holds | none |
| Manolescu (both forms) | `n = 5`; components | non-orientable examples (Corollary 1.3, line 79); finitely many components | holds | none |
| 10.4 *Why `χ₋`* | sphere and genus-two additions | `χ` changes by `±2` and is even, so `min |χ| = 0` | holds | none |
| Milnor conjecture (4.8.3) | `T(2, 5)` | `u = g₄ = 2 = 1·4/2`; owner CombinatorialHeegaardFloer line 284 | ownership | R01 |
| 11.1 fan | edge `{0, i}` at `1/i` | `ℓ¹` distance `2/i → 0`; closed in the weak topology | holds | none |

### Library declarations opened at the pins

Tau Ceti `2fd255d`:

- `Geometry/Manifold/Foliation/EulerClass.lean:133` (`IsEulerClass`), `:218` (`EulerClassBounded`), `:231` (`EulerClassNormOne`), `:330` (`ThurstonEulerClassInequality`), `:387` (`YazdiEulerClassOneTheorem`);
- `Geometry/Manifold/Irreducible.lean:42` (`IsSphereBoundsBall`), `VirtuallyHaken.lean:63`, `Haken.lean:204`;
- `Geometry/Manifold/Riemannian/Hyperbolic.lean:70` (`IsHyperbolic`);
- `Geometry/Manifold/LocallyFlat/Basic.lean:173`, `:375`, `:390`, `:721`;
- `AlgebraicTopology/EilenbergMacLane/Basic.lean:59` (`IsAspherical`).

Mathlib `1b1ccf4`: `Geometry/Manifold/PoincareConjecture.lean:41`, which agrees with the README's description at lines 496–502.

### Cross-roadmap citations and ownership

- On main:
  - Poincare3D: Layer 13 `poincare_3d_smooth`; target 15.2 `poincare_3d_smooth_homotopyEquiv`; Layer 1.1 (its README line 183); its supplier table, line 61.
  - CombinatorialHeegaardFloer Lane G, items 7 and 10 (lines 284 and 302), and Lane K (line 326).
  - MorseNovikov, based cellular torsion (its lines 1–16).
- Open: FourManifolds at its head, line 175. It owns the dimension-four annulus theorem, and no GeometricTopology layer consumes it, as this README says.
- Ownership sweep over open pull requests and main (`roadmaps grep`): Yazdi, `EulerClass*`, virtual Haken, Kawamura, lens-space classification, Rasmussen, Lee and Piccirillo. Only this roadmap owns them, and #1791's old copy of it repeats them. The Milnor conjecture is the exception (R01).
- `citations.md`: no citation or Lean name unresolved.
- `overlaps.md`: no id dropped or required only by an open revision; #1791 is R06.

## Not verifiable

- **Kirby's problem list** (`kirby1997`): the cached text is empty, because Ghostscript could not render the PostScript. Problem numbers 1.16, 1.19, 1.36, 1.81, 3.45, 4.34 and 4.126 are unchecked against it; 3.50–51 are confirmed through `agol2013` line 32.
- **Settled uncertified texts**, cited by locator only:
  - Lickorish 1997 (Proposition 16.10, pp. 3–4, Chapter 5); Moise (Theorems 35.3 and 36.2); Rourke–Sanderson (Chapters 2, 3, 7);
  - Ratcliffe (Theorem 11.8.5; Chapters 4, 8, 12); Hirsch; Thurston 1986 (Theorems 1, 2; Sections 2, 3); Gabai 1983 (Corollary 6.18);
  - Farb–Margalit; Monod (Theorem 7.4.5 and Lemma 7.2.6 are seen only through `loeh2006`); Haagerup–Munkholm; Kauffman 1987.
- **Not fetched in this review:**
  - Brown 1962; Freedman–Quinn (§9.3, Theorem 9.3A; Theorem 11.7B); Birman; Burde–Zieschang; Schubert 1954;
  - Turaev 1987; Armond–Lowrance; Morton 1986; Franks–Williams; Kanenobu–Murakami; Kawamura 1998;
  - Mostow 1968; Prasad 1973; Cerf; Hatcher's Smale paper; Munkres; Bing 1959; Scott 1983; Morgan–Tian;
  - Thurston's *Three-Dimensional Geometry and Topology*; Gabai–Yazdi; Jones (`jonesakl.pdf`); Feller; Brittenham–Hermiller; Baader; Menasco;
  - the SIAM Review survey `10.1137/25M1806703`; Conway's signature survey; Perko; Kondo; Kauffman–Lambropoulou; Dasbach–Lin.
- `3Mfds.pdf` and arXiv 1303.2354v4 were read from the sources cache. This review wrote no manifest entry for them.

## Source issues

- **Error** in livingston2005 at §3.1, printed p. 7 (line 230): the source says the averaged `σ_ω` maps onto `2ℤ` for every `ω ≠ 1`; it should say evenness holds only where `Δ(ω) ≠ 0` (the trefoil at `e^{iπ/3}` averages to `−1`); affects a stated result.
- **Gap** in yazdi2016 at §1, p. 2 (lines 55–56): the source says `S` can be replaced by an incompressible `S′` in its class with `|χ(S′)| ≤ |χ(S)|`; it should use `χ₋` and discard spheres bounding balls (compressing a torus gives a sphere, `2 > 0`); affects the proof.
