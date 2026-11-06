# Review of GeometricTopology (pull request #1797 at 9b5d2c8)

**Verdict:** needs changes

:robot: AI review of the folder `TauCetiRoadmap/GeometricTopology/` at this head, incremental over the previous review (at 4154e2e). The folder changed by 135 lines, all in `README.md`: the repairs of the four findings of the previous review (the `*Needs:*` cycles, the Thurston-norm attainment bullet, the owner of the Kirby–Siebenmann theorem, the eight stale Tau Ceti paths). All four are repaired. Three small defects remain, none blocking: a Check added by the attainment repair says more than is true, Layer 10's Dependencies paragraph does not match its own `*Needs:*` lines after the build paragraph was rewritten, and the slice-genus statements moved into 6.1 carry no locator. The gate passes, the dependency check reports no problem, `Suggested.lean` is unchanged and its twelve statements still elaborate to the README's types with no one-tactic proof.

## R01 (P3) — The `S² × S¹` Check says the norm is attained only by spheres

**Location:** `README.md:2237–2238` (10.3, last Check): "On `S² × S¹` the class `[S² × pt]` has norm `0` and is attained only by spheres: a representative with `χ₋ = 0` and no sphere component is a union of tori, and no torus in `S² × S¹` is incompressible". **Claim:** every representative of `[S² × pt]` attaining `x = 0` is a union of spheres. **Witness:** add a tube to `S² × pt` along an arc in its complement: the result is an embedded torus `T` with `[T] = [S² × pt]` (a tube does not change the homology class) and `χ₋(T) = max(0, 0) = 0 = x([S² × pt])`, so a torus attains the norm. What the sentence's own justification proves is the weaker and correct statement: no *incompressible* representative without a sphere component attains it, since the tubed torus is compressible along the tube's meridian disc. **Repair:** "has norm `0`, and no incompressible representative without a sphere component attains it: a representative with `χ₋ = 0` and no sphere component is a union of tori, and no torus in `S² × S¹` is incompressible, since …". Tested: the tubed sphere is compressible, so it is not a counterexample to the amended sentence, and the sphere `S² × pt` is an incompressible representative (π₁-injectivity is vacuous for a sphere) whose only component is a sphere bounding no ball, as the rest of the Check says.

## R02 (P3) — Layer 10's Dependencies paragraph omits Layer 8

**Location:** `README.md:2302–2305` (Layer 10, Dependencies): "DifferentialGeometry Layer 4 and the native `TauCeti.Foliation`; Layer 2 …; AlgebraicTopology …; Layer 7 … and Layer 5 …". **Claim:** these are the layers Layer 10 is built on. **Witness:** 10.3's `*Needs:*` line (`README.md:2245–2246`) ends "8.3 (incompressible surfaces)" and 10.4's names "8.2 (irreducibility)"; the rewritten build paragraph (`README.md:406–407`) itself says "Layer 10 needs the native foliations, Layer 2's surfaces and Layer 8's incompressible surfaces". The Dependencies paragraph, which the shape rule makes the layer's dependency list, names Layers 2, 5 and 7 only. **Repair:** add "Layer 8 (irreducibility, for 10.4; incompressible surfaces, for 10.3)" to the Dependencies paragraph. Tested: with that edge the layer graph induced by the `*Needs:*` lines and the Dependencies paragraphs coincide (Layer 10 → {2, 5, 7, 8}) and remain acyclic; the order 1, 2, 3, 11, 4, 6, 5, 7, 8, 9, 10, 12 realises both.

## R03 (P3) — The slice-genus invariance and subadditivity in 6.1 have no locator

**Location:** `README.md:1544–1550` (6.1): "Prove that the slice genera of 4.4 are concordance invariants, … and that `g_s` is subadditive under connected sum, `g_s(K # K') ≤ g_s(K) + g_s(K')` (the boundary connected sum …)". **Claim:** two theorems, each with a proof sketch and no source. **Witness:** the sentence is new at this head (moved from 4.4, where it had no locator either); the paragraph's locators (Livingston, Section 2; Lickorish, Chapter 8) sit two sentences earlier and cover the group structure. Livingston's survey states the invariance: `livingston2005` lines 815–817 (Section 9.5) say the 4-ball genus is a concordance invariant bounded above by the 3-sphere genus. **Repair:** after "for topologically concordant ones" add "(Livingston, Section 9.5)"; the subadditivity keeps its sketch (the boundary connected sum of slice surfaces), which is its justification, or cites Lickorish, Chapter 8 if that chapter states it (not readable here). Tested: Livingston 9.5 is in the smooth and topological settings alike, so the one locator covers both invariance statements.

## Previous findings (pull request #1797 at 4154e2e, review r56)

- R01 — repaired: 4.4 now ends "The invariance of `g_s` and `g_s^{top}` under concordance and the subadditivity … are stated in 6.1" and its `*Needs:*` no longer names 6.1; 7.2 lost its comparison bullet and the `8.1` item; 5.4's `*Needs:*` ends "Mathlib `FundamentalGroup`, `Diffeomorph`"; the section graph is acyclic (below).
- R02 — repaired: `README.md:2221–2224` reads "For irreducible `M`, `x(a)` is attained by an incompressible surface with no sphere components; in general … none of whose sphere components bounds a ball"; the added Check overstates one clause (R01 above).
- R03 — repaired: `README.md:89–92` reads "stated in a GeometricTopology Part II that consumes Layers 11 and 12, which is where FourManifolds' contract `gap:tangent-microbundle-stable-classifier` is addressed"; the slug is FourManifolds' at its open head (`README.md:209` there).
- R04 — repaired: all eight paths replaced (`NormalSpace/` files, `PLGroupoid/Basic.lean`, `Orientation/Basic.lean`, `Markov/Basic.lean`, `Jones/Basic.lean`, `MappingTorus/Basic.lean`, `Cylinder/Basic.lean` twice, `Triangulable/Basic.lean`), each present at the pin.

## Verified sound

**Scope of this head.** `git diff --stat 4154e2e..HEAD -- TauCetiRoadmap/GeometricTopology`: `README.md` only, 80 insertions and 55 deletions; `Suggested.lean` and `metadata.toml` unchanged. The prescribed filtered three-dot diff against `origin/main` outside the pull request's five folders is empty (the `ReductiveGroups` files the change list names are the pull request's own folder). The manifest pins Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; `git rev-parse HEAD` in `.lake/packages/TauCeti` agrees.

**Gate.** The worker's gate at 9b5d2c8: every check `0`, `OK`. My dependency check, the exact requested command:

```text
depcheck: 241 roadmaps, 2360 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line (GeometricTopology is on main and not in `ORDER.txt`). The worker's `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

**The `*Needs:*` graph, mechanically.** A script over the README collected, for each of the 55 `### k.n` sections, the section numbers and own-layer references of its `*Needs:*` paragraph (references preceded by Theorem, Problem, Section, Chapter, Stage or another roadmap's name excluded; two flagged as other-roadmap refs, "DifferentialGeometry 5.5" in 1.2 and "DifferentialGeometry 12.4" in 7.1, dropped), and for each layer the layers named in its Dependencies paragraph:

- 89 section-level edges, 0 cycles; the only edges to a later-numbered section are 5.4 → 6.1, 8.2 → 11.2 and 9.1 → 11.2, each named in the build paragraph (`README.md:395–405`), and 7.4 → 8.3 is gone (7.4 names the native `TauCeti.IsIncompressible` instead).
- Layer edges induced by the section edges: 2 → 1; 3 → 1; 4 → 1, 2; 5 → 1, 4, 6; 6 → 1, 2, 4; 7 → 4, 5; 8 → 1, 2, 7, 11; 9 → 1, 3, 7, 11; 10 → 2, 5, 7, 8; 11 → 1; 12 → 1, 11: acyclic, realised by 1, 2, 3, 11, 4, 6, 5, 7, 8, 9, 10, 12.
- The Dependencies paragraphs agree with these edges for every layer except Layer 10 (R02): Layer 4 says "Layer 6 is not a dependency", Layer 5 says "The Poincaré conjecture (8.4) is … not a dependency", Layer 8 adds Layer 11, Layer 9 lists 1, 3, 7, 11. The build paragraph's "Layer 9 needs Layers 1 and 3 besides" omits Layer 7 (Li's theorem, 9.2), which the Dependencies paragraph lists; every order the paragraph implies has Layer 7 before Layer 9, so this is not a defect.

**The changed passages.** Scope (`README.md:86–92`): the Part II deferral; `gap:tangent-microbundle-stable-classifier` is declared at FourManifolds' open head (`README.md:209`, "What GeometricTopology must provide"), FourManifolds is line 125 of the merge order and not on main, so the slug resolves where the brief lets me read it. Supplier contracts (`README.md:218–366`): the eight replaced paths exist at the pin; of the 105 distinct `.lean` paths the README cites, 103 exist as suffixes under the pinned Tau Ceti, and the other two are a Mathlib path and `Suggested.lean` itself. `TauCeti.IsIncompressible` (7.4's new item, `README.md:1833`) is `AlgebraicTopology/FundamentalGroup/Incompressible.lean:42` at the pin, `IsEmbedding f ∧ ∀ s, Function.Injective (FundamentalGroup.map f s)`, as the contracts (`README.md:340–341`) and 8.3 (`README.md:1929`) describe it; for the fibre of genus at least one of a fibration of a closed `3`-manifold, π₁-injectivity follows from the long exact sequence (`π₂(S¹) = 0`), so 7.4's use is consistent. 7.2: the comparison `HasGeometricStructure M hyperbolic ↔ IsHyperbolic M` is now stated once, in 8.1 (`README.md:1863`), whose `*Needs:*` names 7.2. 4.4 after the move: its remaining statements (finiteness of `g`, `g_s^{top} ≤ g_s ≤ g`, the symmetry under reversal and mirror) need only 4.3, 2.1 and the native slice declarations, as its `*Needs:*` now says. 6.1: the track-and-cap sketch is the standard argument; the stacked annulus-plus-surface has the genus of the surface. 6.3's bullet "on knots it is the relation of 6.1" is right: a link concordance between knots is one annulus in `S³ × [0, 1]`, 6.1's track. 5.4 (sampled): the Akbulut–Kirby statement "knots with diffeomorphic `0`-surgeries are concordant" is the one statement of 5.4 that needs the concordance relation, and Layer 6 now precedes Layer 5; Property P, Property R, Gordon–Luecke and Mathieu are statable without 8.4, which the text keeps as a named route. 11.4 (sampled): only the path changed; `collapsible_orderedCylinder_top` is at `Collapse/Cylinder/Basic.lean:76` at the pin. 1.3: only the path phrase changed; the `NormalSpace/` directory has `Basic.lean` and twelve siblings.

**Elaboration.** A copy of `Suggested.lean` with each `sorry` replaced by `first | rfl | simp | infer_instance | decide | exact trivial` and `#check @name` for the twelve declarations appended, elaborated once with `lake env lean` from the pull-request worktree: all twelve probes fail (errors at the probe's lines 70, 78, 84, 93, 100, 107, 115, 121, 130, 137, 145, 154, one per statement), so nothing is padding; the twelve `#check` types are those of the previous report (annulus `∀ n`; Smale, Watanabe, Freedman, Mostow, virtual Haken, JSJ, geometrization as the native `Prop`s; Markov `MarkovEquiv ⟨n, w.toBraid⟩ ⟨m, v.toBraid⟩ ↔ w.closure.ReidemeisterEquiv v.closure`; Agol fibering on a compact connected smooth `3`-manifold with `IsHyperbolic`; Poincaré `Nonempty (M ≃ₘ⟮𝓡 3, 𝓡 3⟯ sphere 0 1)`; Manolescu `∀ n, 5 ≤ n → ∃ M …, IsClosedConnectedManifold n M ∧ ¬ IsTriangulable M`) and agree with the README. The worker's `signatures.md` entries `in`, `here`, `is` are its scanner reading the docstring, not declarations. No section binder is lost. No Lean process was left running.

**Seeded sample.** Of the fifteen sampled targets (1.1, 1.2, 1.5, 2.2, 2.4, 3.3, 4.1, 4.2, 4.3, 5.4, 6.2, 6.3, 8.4, 10.2, 11.4), three fall in the changed passages and are checked above (5.4, 6.3, 11.4); the other twelve are byte-identical to the heads the earlier full reviews read, and their rows in the r55 sample table stand (cached-text lines for Hatcher, Kirby, Yazdi, Piccirillo, Manolescu, Watanabe, Li, Gabai–Meyerhoff–Milley, Agol, Kronheimer–Mrowka, Scharlemann, Livingston).

**Ownership.** `Suggested.lean` is unchanged, so no new declaration; no open `Suggested.lean` the brief lists declares a `TauCetiRoadmap.GeometricTopology.*` name (unchanged from the previous round). Ownership against open pull requests whose files the brief does not give was not checked.

**Adversarial table.** Rows A1–A36 are carried from the previous reports for the statements the diff leaves untouched, with their values (A10, A12 and A21 are the rows whose findings this head repairs); A37–A46 are this round's computations on the changed statements.

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
| A10 (r55) | Norm attained without spheres (10.3) | `S² × S¹`, `a = [S² × pt]` | `x(a) = 0`; no incompressible torus (`ℤ² → ℤ`) | repaired at this head (A38) |
| A11 (r55) | Seminorm vs norm (10.3) | `S² × S¹`; `Σ₂ × S¹` | `x = 0` on a nonzero class; `x([Σ₂]) = 2` | sound |
| A12 (r55) | `*Needs:*` graph | every edge | 4.4 ↔ 6.1; 7.2 ↔ 8.1; Layer 5 → 8 → 7 → 5 | repaired at this head (A39) |
| A13 (r55) | Aspherical form of Agol (7.4) | closed aspherical | agol2013 line 27 | sound |
| A14 (r55) | Parity of Euler classes (10.2, 10.4) | `TS²`; Hopf | `2g`; `±g` not a plane field | sound |
| A15 (r55) | Poincaré route (8.4) | `S³`; `L(p,q)`; Poincaré sphere | `π₁ = 1`; `ℤ/p`; order `120` | sound |
| A16 (r55) | Heegaard genus vs rank (9.2) | `S³`, `L(p,q)`, `T³`, Poincaré sphere | `0=0`, `1=1`, `3=3`, `2=2` | sound |
| A17 (r55) | Manolescu universe (11.2) | compact `X` on an uncountable vertex type | finitely many open simplices meet `X`; relabel to `Fin k` | sound |
| A18 (r55) | Sphere volumes (7.1) | `n = 1, 2, 3` | `2π`, `4π`, `2π²` | sound |
| A19 (r55) | Unlink and Hopf Jones values (4.5) | `c = 2`; positive Hopf | `−(t^{1/2} + t^{−1/2})`; `−t^{1/2} − t^{5/2}` | sound |
| A20 (r55) | Property P, R, Gordon–Luecke (5.4) | unknot; trefoil `+1`, `0` | `S³_U(1) = S³` excluded; order `120`; torus bundle | sound |
| A21 (r55) | Kirby–Siebenmann deferral (Scope) | owners on main and open heads | none; FourManifolds asks GeometricTopology | repaired at this head (A42) |
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
| A37 | Slice-genus invariance and subadditivity (6.1, new) | `T`, `−T`, `T # −T`; `E # E`; `K` vs `K # (slice)` | `g_s(T) = 1` (`σ = −2` gives `≥ 1`, the genus-one Seifert surface `≤ 1`), `g_s(−T) = 1`, `g_s(T # −T) = 0 ≤ 2`; `g_s(E # E) = 0 ≤ 2` since `−E = E`; `K # S` concordant to `K` so equal `g_s` | consistent; the bullet's `0 < 2` witness is right and shows `g_s` is no homomorphism; locator missing (R03) |
| A38 | Attainment bullet, amended (10.3) | `Σ₂ × S¹` (irreducible), `a = [Σ₂ × pt]`; `S² × S¹`, `a = [S² × pt]`; `a = 0` | `x = 2`, attained by `Σ₂ × pt`, π₁-injective (`π₁(Σ₂) → π₁(Σ₂) × ℤ`), no spheres; `x = 0`, attained by `S² × pt`, which bounds no ball, π₁-injective vacuously; the empty surface | consistent with both forms |
| A39 | `S² × S¹` Check, "attained only by spheres" | the tubed sphere `T` | `[T] = [S² × pt]`, `χ₋(T) = 0 = x(a)`; `T` compressible along the tube's meridian | literal claim false, intended claim true (R01) |
| A40 | `*Needs:*` graph after the repair | all 55 sections, 12 Dependencies paragraphs | 89 edges, 0 cycles; forward edges 5.4 → 6.1, 8.2 → 11.2, 9.1 → 11.2; Layer 10 induced {2, 5, 7, 8} vs Dependencies {2, 5, 7} | R01 of r56 repaired; R02 above |
| A41 | Comparison `IsHyperbolic ↔ HasGeometricStructure hyperbolic` | 7.2 and 8.1 | stated once, `README.md:1863` (8.1), 8.1 `*Needs:*` 7.2; 7.2 `*Needs:*` has no 8.x | consistent |
| A42 | Kirby–Siebenmann owner (Scope) | FourManifolds at its open head; merge order | gap slug at `README.md:209` of FourManifolds with supplier GeometricTopology; FourManifolds line 125 of the order; Part II named as the owner | consistent (a Part II placed before FourManifolds when it exists) |
| A43 | 7.4's fibre is incompressible via the native predicate | genus `≥ 1` fibre `F` of `M → S¹`; `S²` fibre | `π₁(F) → π₁(M)` injective by the fibration sequence (`π₂(S¹) = 0`), embedding by construction; `S²` fibre gives `S² × S¹` or its twisted form, excluded by "genus at least one" | consistent with `Incompressible.lean:42` |
| A44 | 5.4 `*Needs:*` after the repair | Akbulut–Kirby; Property P's two routes | concordance consumed from 6.1, Layer 6 before 5; both routes named, neither a `*Needs:*` item | consistent |
| A45 | 4.4 after the move | `g_s(K) = g_s(mirror K)`, `g_s(K.reverse)` | reflection of `D⁴` and reversal of the surface's orientation keep the genus; no concordance needed | consistent with the trimmed `*Needs:*` |
| A46 | Eight replaced paths | each path at pin 2fd255d9 | all exist; `NormalSpace/` has `Basic.lean` and twelve siblings; the declarations at the lines of the r56 report | R04 of r56 repaired |

**Headline inventory.** Unchanged since the previous review: twelve headlines stated (annulus, Smale, Watanabe, Markov, Freedman, Mostow, both Agol theorems, JSJ, geometrization, Poincaré, Manolescu); Property P and R, the minimal volume theorem, Cerf, Reidemeister, the Alexander agreement, Li, Thurston's inequality and Yazdi, Kneser–Milnor named in the docstring as not statable with the missing carrier. The diff adds no carrier and `Suggested.lean` is unchanged, so no headline became statable or absent.

## Not verifiable

- Thurston, *A norm for the homology of 3-manifolds* (`thurston1986`, settled uncertified): the amended bullet's "Section 2: compressions do not increase `χ₋`, and a sphere bounding a ball is discarded" is carried as the README states it; the argument is the standard one and is checked above by instance (A38), not against the text.
- Lickorish, *An Introduction to Knot Theory*, Chapter 8 (in copyright): the suggested locator for the subadditivity of `g_s` in R03 could not be confirmed; the proof sketch in 6.1 stands on its own.
- The other locators of the changed passages are unchanged from the previous heads and were not reopened; the previous report's list of in-copyright or paywalled sources stands.

## Source issues

- none
