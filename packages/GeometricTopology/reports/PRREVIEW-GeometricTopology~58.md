# Review of GeometricTopology (pull request #1797 at ac5a1c0)

**Verdict:** accepted

:robot: AI review of the folder `TauCetiRoadmap/GeometricTopology/` at this head, incremental over the previous review (at 9b5d2c8). The folder changed by 35 lines, all in `README.md`: the repairs of the three findings of the previous review (the `S² × S¹` attainment Check, Layer 10's Dependencies paragraph, the Livingston locator for the slice-genus invariance) and the matching References bullet. All three are repaired and none of the repairs introduces a new problem. No finding remains. The gate passes, the dependency check reports no problem, `Suggested.lean` is unchanged and its twelve statements elaborate to the README's types with no one-tactic proof.

## Previous findings (pull request #1797 at 9b5d2c8, review r57)

- R01 — repaired: `README.md:2237–2245` now reads "has norm `0`, and no incompressible representative without a sphere component attains it: … Compressible tori do attain it: tubing `S² × pt` to itself … gives a torus `T` with `[T] = [S² × pt]` and `χ₋(T) = 0`, compressible along the meridian disc of the tube".
- R02 — repaired: `README.md:2308–2309` (Layer 10, Dependencies) now lists "Layer 8 (incompressible surfaces, for the attainment statement of 10.3; irreducibility, for the norm form of Thurston's inequality in 10.4)".
- R03 — repaired: `README.md:1544–1545` reads "Prove that the slice genera of 4.4 are concordance invariants (Livingston, Section 9.5)"; the References bullet (`README.md:2704–2705`) now cites Livingston's Sections 2, 3.1 and 9.5, the three sections the README uses.

## Verified sound

**Scope of this head.** `git diff --stat 9b5d2c8..HEAD -- TauCetiRoadmap/GeometricTopology`: `README.md` only, 20 insertions and 15 deletions; `Suggested.lean` and `metadata.toml` unchanged. The prescribed filtered three-dot diff against `origin/main` outside the pull request's five folders is empty. The manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, unchanged since the previous review.

**Gate.** The worker's gate at ac5a1c0: every check `0`, `OK`. My own run of the gate with `--build` and `--order`: `depcheck=0`, `build=0`, every text scanner `0`; its only nonzero count is `outside-folder=23`, and the files it lists are the pull request's other roadmap folders (`AlgebraicTopology`, `ReductiveGroups`, `QuadraticFormInvariants`, `RepresentationTheory/LieHighestWeight`), which this brief names as the pull request's own and which have reviews of their own; the worker's gate, run with those folders excluded, reports `outside-folder=0`. My dependency check, the exact requested command:

```text
depcheck: 240 roadmaps, 2356 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The worker's `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

**The `*Needs:*` graph, mechanically.** A script over the README collected, for each of the 46 `### k.n` sections, the section numbers of its `*Needs:*` paragraph (references preceded by a roadmap name, or by Theorem, Section, Stage, Chapter, Proposition or Layer with a roadmap name, excluded), and for each layer the layers named in its Dependencies paragraph:

- 85 section-level edges, 0 cycles; the only edges to a later-numbered section are 5.4 → 6.1, 8.2 → 11.2 and 9.1 → 11.2, each named in the build paragraph (`README.md:395–407`).
- Layer edges induced by the section edges: 2 → 1; 3 → 1; 4 → 1, 2; 5 → 1, 4, 6; 6 → 1, 2, 4; 7 → 4, 5; 8 → 1, 2, 7, 11; 9 → 1, 3, 7, 11; 10 → 2, 5, 7, 8; 11 → 1; 12 → 1, 11: acyclic, realised by 1, 2, 3, 11, 4, 6, 5, 7, 8, 9, 10, 12.
- Layer 10's Dependencies paragraph now names Layers 2, 5, 7 and 8 (and DifferentialGeometry Layer 4, a supplier), exactly the induced set; no `*Needs:*` line of Layer 8 names a section of Layer 10, so the added edge creates no cycle. The other Dependencies paragraphs are unchanged from the previous review.

**The changed passages.** 10.3's amended Check (`README.md:2237–2245`): computed in rows A47–A48 below; the Check now claims exactly what its justification proves, and its tubed-torus witness is the surface that refuted the previous wording. Layer 10's Dependencies (`README.md:2306–2310`): 10.3's `*Needs:*` (`README.md:2247–2250`) ends "8.3 (incompressible surfaces)" and 10.4's (`README.md:2286–2288`) names "8.2 (irreducibility)", which is what the paragraph now says. 6.1's locator (`README.md:1544–1545`): `livingston2005` lines 815–817 (Section 9.5) say the 4-ball genus is a concordance invariant bounded above by the 3-sphere genus; the survey's standing category is smooth (`livingston2005` lines 32–34) and its Section 6 covers the topological theory, so the locator supports the smooth statement directly and the topological one by the same track-and-cap sketch the README gives. The subadditivity `g_s(K # K') ≤ g_s(K) + g_s(K')` is not in Section 9.5 and the README does not place the locator on it: its justification is the boundary-connected-sum sketch, which is complete (the boundary connected sum of two slice surfaces of genera `g, g'` along an arc is a connected surface of genus `g + g'` with boundary `K # K'`). The native names the sketch relies on exist at the pin: `TauCeti.SmoothEmbedding.Concordance.refl`, `symm`, `trans` (`Geometry/Manifold/SmoothEmbedding/Concordance.lean:232, 243` and the header at line 40), `Concordant` (line 117), `SmoothAmbientIsotopic.concordant` (line 621). The References bullet: the README cites Livingston at Section 2 (`README.md:1542–1543`), Section 3.1 (`README.md:1588, 1594, 1628`) and Section 9.5 (`README.md:1545`), the three sections the bullet lists.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/GeometricTopology/Suggested.lean` from the pull-request worktree: exit 0, twelve warnings, all `declaration uses sorry`, no other warning. A copy in my scratch directory with each `sorry` replaced by `first | rfl | simp | infer_instance | decide | exact trivial` and `#check @name` for the twelve declarations appended, elaborated once the same way: all twelve probes fail (errors at the probe's lines 70, 78, 84, 94, 100, 107, 115, 121, 130, 137, 145, 155, one per statement), so nothing is padding; the twelve `#check` types are those of the previous report (annulus `∀ n`; Smale, Watanabe, Freedman, Mostow, virtual Haken, JSJ, geometrization as the native `Prop`s; Markov `MarkovEquiv ⟨n, w.toBraid⟩ ⟨m, v.toBraid⟩ ↔ w.closure.ReidemeisterEquiv v.closure`; Agol fibering on a compact connected smooth `3`-manifold with `IsHyperbolic`; Poincaré `Nonempty (M ≃ₘ⟮𝓡 3, 𝓡 3⟯ sphere 0 1)`; Manolescu `∀ n, 5 ≤ n → ∃ M …, IsClosedConnectedManifold n M ∧ ¬ IsTriangulable M`) and agree with the README. The worker's `signatures.md` entries `in`, `here`, `is` are its scanner reading the docstring, not declarations. No section binder is lost. No Lean process was left running.

**Seeded sample.** Of the fifteen sampled targets (1.3, 1.4, 3.1, 3.2, 4.3, 7.1, 7.2, 7.3, 7.4, 8.1, 8.2, 8.4, 9.2, 10.3, 11.4), one falls in the changed passages, 10.3, and is checked above and in rows A47–A48; its unchanged locators stand (Yazdi, Section 1: `yazdi2016` lines 20–32 define `χ₋`, the norm as a minimum over representatives, the seminorm property and the dual norms; Thurston 1986 is settled uncertified). The other fourteen are untouched by this diff: 1.4, 3.1, 3.2, 4.3, 7.1, 7.3, 8.1, 8.2, 8.4 and 9.2 are byte-identical to the head the r55 review read (4fe7620), and 1.3, 7.2, 7.4 and 11.4 changed only in the r56–r57 repairs that the r57 review checked (a pin path in 1.3 and 11.4, the moved comparison bullet in 7.2, the native `IsIncompressible` in 7.4); their rows in the r54–r57 sample tables stand and were not reopened.

**Ownership.** `Suggested.lean` is unchanged, so no new declaration; no open `Suggested.lean` the brief lists declares a `TauCetiRoadmap.GeometricTopology.*` name (unchanged from the previous rounds). Ownership against open pull requests whose files the brief does not give was not checked.

**Adversarial table.** Rows A1–A46 are carried from the previous reports for the statements the diff leaves untouched, with their values (A39 and A40 are the rows whose findings this head repairs); A47–A51 are this round's computations on the changed statements.

| # | Statement or object | Instances tried | Values on each side | Result / change |
|---|---|---|---|---|
| A1 (r55) | Connected-sum orientation (1.4) | `n = 1`, `S¹`; `ℂP²` | boundary orientations `−e₁(∂D)`, `+e₂(∂D)`; forms `⟨1⟩ ⊕ ⟨1⟩` (sig `2`) vs `⟨1⟩ ⊕ ⟨−1⟩` (sig `0`) | sound |
| A2 (r55) | PL local flatness by dimension (2.2) | `m = 2, 3, 4, 5` | link pairs `(S¹,S⁰)`, `(S²,S¹)`, `(S³,S²)` standard; `(S⁴,S³)` open | sound |
| A3 (r55) | Reidemeister with relabelling (4.3) | `(U, T)` vs `(T, U)` | `Δ = 1` vs `t − 1 + t⁻¹` on component `0`; isotopic after `relabel swap` | sound |
| A4 (r55) | `jonesTrace = δ · bracket` (4.5) | one strand; `σ₀³` | `δ` vs `δ·1`; `δ(a⁻⁴ + a⁻¹² − a⁻¹⁶)` both sides | sound |
| A5 (r55) | Framing change `(p − kq)/q` (5.2) | `k = 6` | `−6` vs `+6` for the wrong sign | sound |
| A6 (r55) | Lens dictionary (5.3) | `p/q = 2/1, 5/2, 1/n, 0, ∞` | `L(2,1) = ℝP³`, `H₁ = ℤ/2`; `S³`, `S¹ × S²`, `S³` | sound |
| A7 (r55) | Lens classification (5.3) | `(5,1),(5,2)`; `(7,1),(7,6)`; `(5,2),(5,3)` | distinct; same; same | sound |
| A8 (r55) | `Diff⁺` via degree (3.1) | `S¹` reflection; `S¹ ⊔ S¹` swap | degree `−1`; no degree | sound |
| A9 (r55) | Weeks `H₁` (7.3) | slopes `(5,1),(5,2)` | coker `diag(5,5) = (ℤ/5)²` | sound |
| A10 (r55) | Norm attained without spheres (10.3) | `S² × S¹`, `a = [S² × pt]` | `x(a) = 0`; no incompressible torus (`ℤ² → ℤ`) | repaired at 9b5d2c8 (A38) |
| A11 (r55) | Seminorm vs norm (10.3) | `S² × S¹`; `Σ₂ × S¹` | `x = 0` on a nonzero class; `x([Σ₂]) = 2` | sound |
| A12 (r55) | `*Needs:*` graph | every edge | 4.4 ↔ 6.1; 7.2 ↔ 8.1; Layer 5 → 8 → 7 → 5 | repaired at 9b5d2c8 (A40) |
| A13 (r55) | Aspherical form of Agol (7.4) | closed aspherical | agol2013 line 27 | sound |
| A14 (r55) | Parity of Euler classes (10.2, 10.4) | `TS²`; Hopf | `2g`; `±g` not a plane field | sound |
| A15 (r55) | Poincaré route (8.4) | `S³`; `L(p,q)`; Poincaré sphere | `π₁ = 1`; `ℤ/p`; order `120` | sound |
| A16 (r55) | Heegaard genus vs rank (9.2) | `S³`, `L(p,q)`, `T³`, Poincaré sphere | `0=0`, `1=1`, `3=3`, `2=2` | sound |
| A17 (r55) | Manolescu universe (11.2) | compact `X` on an uncountable vertex type | finitely many open simplices meet `X`; relabel to `Fin k` | sound |
| A18 (r55) | Sphere volumes (7.1) | `n = 1, 2, 3` | `2π`, `4π`, `2π²` | sound |
| A19 (r55) | Unlink and Hopf Jones values (4.5) | `c = 2`; positive Hopf | `−(t^{1/2} + t^{−1/2})`; `−t^{1/2} − t^{5/2}` | sound |
| A20 (r55) | Property P, R, Gordon–Luecke (5.4) | unknot; trefoil `+1`, `0` | `S³_U(1) = S³` excluded; order `120`; torus bundle | sound |
| A21 (r55) | Kirby–Siebenmann deferral (Scope) | owners on main and open heads | none; FourManifolds asks GeometricTopology | repaired at 9b5d2c8 (A42) |
| A22 (r55) | Kirby 4.126 as `Diff(D⁴, ∂)` | kirby1997 7507–7512 | (C) iff `Diff(D⁴, ∂D⁴)` contractible | sound |
| A23 (r55) | Dunce hat (11.4) | edges after identification | no free face; contractible | sound |
| A24 (r55) | Neat Check (2.1) | `[0,1] → [0,1] × S¹` | `f⁻¹(∂M) = {0,1} = ∂N` | sound |
| A25 (r55) | `E₈` manifold (12.3) | form | signature `8`; not triangulable | sound |
| A26 (r55) | Cone on a polygon (2.2) | trefoil; unknot | `⟨x,y ∣ x² = y³⟩ ↠ S₃` vs `ℤ` | sound |
| A27 (r55) | Torus triangulation bound (12.1) | `V − E + F = 0`, `3F = 2E` | `V ≥ 7`; `9`-vertex grid | sound |
| A28 (r55) | `IsClosedConnectedManifold` (11.2) | pin | five conjuncts at `Manifold/Basic.lean:57` | sound |
| A29 (r55) | Signature function of `T` (6.2) | `θ = π`; `≈ 53°`; `π/3 ± ε` | `−2`; `0`; `0`, `−2` | sound |
| A30 (r55) | Concordance group (6.1) | `T # −T`; `T # T`; `E` | slice; `σ = −4`; order `2` | sound |
| A31 (r55) | Prime decomposition (8.2) | `S¹ × S²`; `L(2,1) # L(3,1)` | prime, not irreducible; `C₂ * C₃` | sound |
| A32 (r55) | Geometric structures (8.1) | `E³/ℤ³`; `E³/{±I}`; `S² × S¹` | `T³`; cone on `ℝP²` excluded; not spherical | sound |
| A33 (r55) | Statable headlines | 12 stated; 8 named not statable | each missing carrier absent at the pin | sound |
| A34 (r56) | Markov statement at the pin | `n = m = 0`; `σ₀` on `2` strands vs empty word | both sides reflexive; `markovEquiv_sigma_last_one_one` (pin 346); Reidemeister-I kink | consistent |
| A35 (r56) | Markov, negative control | trivial words on `m + 1 ≠ n + 1` strands | left false (`not_markovEquiv_one_of_ne`, 354); right false (component count) | consistent |
| A36 (r56) | Manolescu at the pin | `n = 5`; `n = 4` | `IsTriangulable.{0}` unchanged at `Triangulable/Basic.lean:38`; `n = 4` claims nothing | consistent |
| A37 (r57) | Slice-genus invariance and subadditivity (6.1) | `T`, `−T`, `T # −T`; `E # E`; `K` vs `K # (slice)` | `g_s(T) = 1`, `g_s(−T) = 1`, `g_s(T # −T) = 0 ≤ 2`; `g_s(E # E) = 0 ≤ 2`; `K # S` concordant to `K` so equal `g_s` | consistent; locator added at this head (A49) |
| A38 (r57) | Attainment bullet, amended (10.3) | `Σ₂ × S¹`, `a = [Σ₂ × pt]`; `S² × S¹`, `a = [S² × pt]`; `a = 0` | `x = 2`, attained by `Σ₂ × pt`, π₁-injective, no spheres; `x = 0`, attained by `S² × pt`, bounds no ball, π₁-injective vacuously; the empty surface | consistent with both forms |
| A39 (r57) | `S² × S¹` Check, "attained only by spheres" | the tubed sphere `T` | `[T] = [S² × pt]`, `χ₋(T) = 0 = x(a)`; `T` compressible | literal claim false; repaired at this head (A47) |
| A40 (r57) | `*Needs:*` graph after the r57 repair | all sections, 12 Dependencies paragraphs | 0 cycles; forward edges 5.4 → 6.1, 8.2 → 11.2, 9.1 → 11.2; Layer 10 induced {2, 5, 7, 8} vs Dependencies {2, 5, 7} | repaired at this head (A48) |
| A41 (r57) | Comparison `IsHyperbolic ↔ HasGeometricStructure hyperbolic` | 7.2 and 8.1 | stated once, in 8.1, whose `*Needs:*` names 7.2 | consistent |
| A42 (r57) | Kirby–Siebenmann owner (Scope) | FourManifolds at its open head; merge order | gap slug at FourManifolds `README.md:209` with supplier GeometricTopology; Part II named as the owner | consistent |
| A43 (r57) | 7.4's fibre is incompressible via the native predicate | genus `≥ 1` fibre; `S²` fibre | `π₁(F) → π₁(M)` injective by the fibration sequence; `S²` fibre excluded by "genus at least one" | consistent |
| A44 (r57) | 5.4 `*Needs:*` after the repair | Akbulut–Kirby; Property P's two routes | concordance from 6.1, Layer 6 before 5; both routes named | consistent |
| A45 (r57) | 4.4 after the move | `g_s(K) = g_s(mirror K)`, `g_s(K.reverse)` | reflection of `D⁴` and orientation reversal keep the genus | consistent |
| A46 (r57) | Eight replaced paths | each path at pin 2fd255d9 | all exist | consistent |
| A47 | `S² × S¹` Check, amended wording (10.3) | tubed sphere `T`: `S = S² × pt` minus two discs `D₁, D₂ ⊆ S`, plus an annulus `A ⊆ S² × (0, ε)` with `∂A = ∂D₁ ⊔ ∂D₂`, both ends on the same side | `χ(T) = χ(S²) − 2 + χ(A) = 2 − 2 + 0 = 0`, so `T` is an orientable genus-one surface and `χ₋(T) = max(0, 0) = 0 = x(a)`; `S ∪ T` bounds `D₁ × [0, ε] ∪ D₂ × [0, ε]` joined through the solid tube, so `[T] = [S] = a ≠ 0`; the meridian disc `D` of the tube has `∂D` the core circle of `A`, nonseparating on `T`, and `D ∩ T = ∂D`, so `T` compresses along `D`; incompressible representatives with `χ₋ = 0` and no sphere component are unions of tori with `π₁(T_i) = ℤ² → ℤ` never injective, so none | the three clauses of the Check are each true; the Check now claims exactly what it proves; no change |
| A48 | Layer 10 Dependencies versus its `*Needs:*` lines | 10.1–10.4's `*Needs:*`; every `*Needs:*` of Layer 8 | induced layer set of Layer 10 = {2, 5, 7, 8}; the paragraph names {2, 5, 7, 8} and DifferentialGeometry Layer 4; Layer 8's induced set = {1, 2, 7, 11}, no Layer 10 section; the full graph has 85 edges, 0 cycles, order 1, 2, 3, 11, 4, 6, 5, 7, 8, 9, 10, 12 | consistent; R02 repaired |
| A49 | Livingston, Section 9.5 as the locator of the slice-genus invariance (6.1) | `livingston2005` lines 815–817; lines 32–34 (standing category); `g_s^{top}` | 9.5 states that `g₄(K)` is a concordance invariant bounded by the 3-sphere genus; the survey's standing category is smooth and Section 6 covers the topological theory; the topological statement follows by the README's own track-and-cap sketch, and the locator is placed on "concordance invariants", not on the subadditivity | the locator supports the statement; R03 repaired |
| A50 | Subadditivity of `g_s` without a locator (6.1) | `K = K' = U`; `K = T`, `K' = −T`; `K = K' = T` | `g_s(U # U) = 0 ≤ 0 + 0`; `g_s(T # −T) = 0 ≤ 1 + 1`; `g_s(T # T) ≥ |σ|/2 = 2 = 1 + 1`, so equality holds and the bound is sharp there | consistent with the sketch (boundary connected sum of a genus-`g` and a genus-`g'` slice surface has genus `g + g'`); no change |
| A51 | References bullet for Livingston | the README's citations of Livingston | Section 2 (`README.md:1542`), Section 3.1 (`README.md:1588, 1594, 1628`), Section 9.5 (`README.md:1545`); the bullet lists Sections 2, 3.1 and 9.5 | consistent |

**Headline inventory.** Unchanged since the previous review: twelve headlines stated (annulus, Smale, Watanabe, Markov, Freedman, Mostow, both Agol theorems, JSJ, geometrization, Poincaré, Manolescu); Property P and R, the minimal volume theorem, Cerf, Reidemeister, the Alexander agreement, Li, Thurston's inequality and Yazdi, Kneser–Milnor named in the docstring as not statable with the missing carrier. The diff adds no carrier and `Suggested.lean` is unchanged, so no headline became statable or absent.

## Not verifiable

- Thurston, *A norm for the homology of 3-manifolds* (`thurston1986`, settled uncertified): the attainment bullet's "Section 2: compressions do not increase `χ₋`, and a sphere bounding a ball is discarded" is carried as the README states it; the amended Check is checked above by instance (A47), not against the text.
- Lickorish, *An Introduction to Knot Theory*, Chapter 8 (in copyright): not readable here; the subadditivity of `g_s` in 6.1 stands on its own sketch (A50) and cites no locator.
- The other locators of the changed passages are unchanged from the previous heads and were not reopened; the previous reports' lists of in-copyright or paywalled sources stand.

## Source issues

- none
