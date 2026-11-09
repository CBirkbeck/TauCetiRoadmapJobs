# Review of K3Surfaces (pull request #1285 at a23ff3a)
**Verdict:** accepted

Incremental re-review of the 69 lines changed since `e565cd5` (the head the previous review read). The three findings of that review are repaired at this head and the repairs introduce no new problem: the M(2) discriminant surjectivity is now a stated headline on native carriers, the extension criterion cites the Huybrechts lemma and proposition that state it, and both Layer titles agree with the README. Gate, dependency check and elaboration pass. No finding remains.

## Previous findings

- R01 — repaired: `Suggested.lean:122–127` states `discriminantOrthogonalHom_surjective_of_isometry_scale_two` for every nondegenerate even `S` with `e : S.Isometry ((2 : ℤ) • hyperbolicPlane.orthogonalSum (-typeE₈RootLattice))`; the docstring (`:18–20`), `README.md:216–218` and §7.1 (`:940–945`, `:966–968`) name it. The author inlined the lattice instead of adding `enriquesLattice`, which keeps the file to the definitions a headline needs.
- R02 — repaired: `README.md:883–885` and `:894–895` cite "Huybrechts draft §14.2.2, Lemma 14.2.5 and Proposition 14.2.6, pp.291–292" for the extension criterion, with Gritsenko–Hulek §2, p.4 now described as applying it to Enriques markings; the docstring at `Suggested.lean:97–98` cites the same.
- R03 — repaired: `Suggested.lean:46` reads "Layer 0: Algebraic surfaces and the early differential theorem" and `:90` "Layer 7: Integral involutions and free quotients", verbatim the headings at `README.md:221` and `:861`.

## Verified sound

**Gate, folder, pins, dependency check**
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/K3Surfaces'` prints nothing; `changes.md` lists no file outside the folder. The folder holds `README.md` (1243 lines), `Suggested.lean` (130) and `metadata.toml`.
- Gate rerun with `--base origin/main`: every scanner reports 0, then `OK`, exit 0. The worker's gate on this head reports `build=0` as well.
- `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, unchanged since the previous review.
- Dependency check (`--movable`):

```text
depcheck: 236 roadmaps, 2281 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.

**Elaboration, signatures, padding**
- `lake env lean` on `Suggested.lean` at the head: exactly five `declaration uses sorry` warnings (`:61`, `:72`, `:82`, `:102`, `:122`) and nothing else.
- A scratch copy with `#check @` for all six declarations: the four Layer 0 signatures and the gluing theorem are unchanged from the previous review. The new theorem elaborates to `∀ {V} [AddCommGroup V] [Module ℚ V] (S : IntegralLattice V) [S.IsNondegenerate] (hS : S.IsEven) (e : S.Isometry (2 • hyperbolicPlane.orthogonalSum (-typeE₈RootLattice))), Function.Surjective ⇑(discriminantOrthogonalHom S hS)`, which is the README statement at `:940–945` ("every nondegenerate even lattice S given with an integral isometry onto the rescaling by 2 of the orthogonal sum of `hyperbolicPlane` and the negation of `typeE₈RootLattice`"). No binder is lost; the worker's signature file agrees.
- One-tactic probe on the new theorem (`simp`, `rfl`, `infer_instance`, `trivial`, `exact Function.surjective_id`, `intro x; exact ⟨1, …⟩`): none closes it; the goal `1 = x` for `x` in the orthogonal group stays open. Not padding. The other four were probed in the previous review and are untouched.
- The three new imports (`IntegralLattice.Examples`, `IntegralLattice.RootLattice.TypeE.Basic`, `IntegralLattice.Discriminant.OrthogonalGroup`) exist at the pin (gate `imports=0`) and are the modules of the three carriers used.

**Library declarations opened at Tau Ceti `2fd255d9`**
- `Examples.lean:60–61, 88–90`: `hyperbolicPlane : IntegralLattice (Fin 2 → ℚ)` is `ofGramMatrix` of the matrix with 0 on the diagonal and 1 off it; `:104–105` gives Gram `!![0, 1; 1, 0]`. This is the README's "Gram matrix (0,1;1,0) on ℚ²" (`:134`).
- `RootLattice/TypeE/Basic.lean:676–677`: `typeE₈RootLattice : IntegralLattice (Fin 8 → ℚ)` is `ofGramMatrix` of `CartanMatrix.E 8`; `:758` `isPosDef_typeE₈RootLattice`, `:791` `isUnimodular_typeE₈RootLattice`. This is the README's "positive definite Gram lattice of the E₈ Cartan matrix on ℚ⁸" (`:135–136`).
- `Scaling.lean:263–271`: `-L = (-1 : ℤ) • L` (`neg_def`), carrier unchanged (`neg_carrier`); `:106–118` `n • L = scale n L` with form `n • L.form` and the same carrier. So `(2 : ℤ) • (U ⊕ (−E₈))` is U(2) ⊕ E₈(−2) with the README's sign conventions (`:63–64`: U has matrix (0,1;1,0), E₈ is positive definite). The README's "the negation −L is the rescaling by −1" (`:132`) is `neg_def`.
- `Orthogonal/Sum.lean:94`: `orthogonalSum : IntegralLattice (V × W)`; `Isometry/Basic.lean:77–80`: an `Isometry` is a rational isometry equivalence carrying the carrier onto the carrier, so `e` forces `S` to have rank 10 and the stated form.
- `Discriminant/OrthogonalGroup.lean:249–256`: `discriminantOrthogonalHom (L) [L.IsNondegenerate] (hL : L.IsEven) : Isometry L L →* FiniteQuadraticModule.orthogonalGroup (L.discriminantQuadraticModule hL)`. `Discriminant/Quadratic.lean:184–190`: the discriminant quadratic map is the descended half-norm, the README's convention at `:65` (q(x)=B(x,x)/2 mod ℤ), under which the route's "q_S to Q/2" at `:947` is right (q_S(x/2) = 2·B(x,x)/4 ÷ 2 = B(x,x)/4 mod ℤ).

**Sources (the changed locators; the rest of the seeded sample is unchanged since the previous review and was not reopened)**
- huybrechts-k3 lines 11155 (page 291 marker), 11163–11168 (§14.2.2, the induced map O(Λ)→O(A_Λ)), 11176–11184 (the primitive sublattice situation and Lemma 2.5: an isometry preserving Λ₁ induces equal discriminant actions on Λ₁ and Λ₂), 11185–11196 (Proposition 2.6 across the page-292 marker at 11193: g₁ extends iff ḡ₁ lies in the image of O(Λ₂), with the proof that x₁+x₂ ↦ g₁x₁+x₂ preserves Λ when the class in A_{Λ₁}⊕A_{Λ₂} is preserved). The cited chapter, numbers and pages match the README and docstring.
- gritsenko-hulek-enriques-moduli lines 83–96 (p.3: M := U(2)⊕E₈(−2) is the invariant lattice, N = U⊕U(2)⊕E₈(−2) its complement; the README's S and T), 107–114 (D_M ≅ 𝔽₂¹⁰, O(D_M) ≅ O⁺(𝔽₂¹⁰) of order 2²¹·3⁵·5²·7·17·31, surjectivity of π_M and π_N by Nikulin's Theorem 3.6.3), 122–126 (p.4: the marking extension, now cited as an application). Matches `README.md:936–939` and the docstring at `Suggested.lean:118`.
- char2-orthogonal-involutions lines 183–188 (§3, p.6: orthogonal transvections generate the orthogonal group unless V = H⊥H over 𝔽₂), cited at `Suggested.lean:119–121` and `README.md:954–956`. Matches.

**Cross-roadmap citations touching the changed passages**
- The changed passages cite no new roadmap section. IntegralLattices §§0G, 1E–1F and 5J, cited at `README.md:1008`, resolve on main `623f5d6`: `IntegralLattices/README.md:438` (row with `hyperbolicPlane` and `typeE₈RootLattice`, labels 0G, 1K), `:443` (1E, 1F), `:455` (the labels 0A–0G, 1A–1F name native rows), `:3039` (5J), `:1520` (6A). The overlap leads saying only #617/#1411/#1797 define them are false, as in the previous review.
- Consumers at their heads are unchanged: EnriquesSurfaces `e852f4d` cites K7.A at `README.md:644–646` and §7.3 at `:648`; K3SurfacesAndSymplecticBoundedness `cee718f` and EnriquesSurfacesAndIntegralNonexistence `c7e72bb` cite no name the change renames. The change drops no id and renames nothing; `gluing_isometry_extension_iff` keeps its statement.
- No other `Suggested.lean` at the sibling heads declares a `TauCetiRoadmap.K3Surfaces.*` name or a surjectivity O(M(2))→O(q). Ownership is as in the previous review: IntegralLattices on main hands general surjectivity to a Part II that does not exist, so this roadmap owns the one case it uses.

**Adversarial table** (rows for untouched statements carry forward from the previous review, r17)

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `IsAlgebraicK3` | as r17 | Fermat quartic char 3 passes; abelian surface h¹=2 fails; ℙ² ∧²Ω=O(−3) fails; empty fails geometric integrality | Sound (r17) |
| `algebraicK3_differential_vanishing` | as r17 | `CharP k p`, 2<p; p=2 true elsewhere and consumed by the Part II | Sound (r17) |
| `unirational_of_nontrivial_vectorField` | as r17 | −2=−2p+2(p−1) on ℙ¹; abelian surface c₂=0 needs the K3 hypothesis | Sound (r17) |
| `finrank_lineBundleClass_eq_twentyTwo_of_unirational` | as r17 | b₂=22 from 24=2+b₂; Gram determinant ≠0 so `finrank` is not junk | Sound (r17) |
| `gluing_isometry_extension_iff` (statement unchanged, locator changed) | ⟨4⟩⊕⟨−4⟩, ⟨2⟩⊕⟨2⟩, rank 0 (r17); Proposition 14.2.6 on the same instance | (1,1), (−1,−1) extend and commute; (−1,1), (1,−1) neither. For ⟨4⟩⊕⟨−4⟩ the glued lattice is even unimodular (det −16/16=−1, ((e+f)/2)²=0), S and T primitive and mutually orthogonal, so Lemma 14.2.5/Proposition 14.2.6 apply and predict exactly the sign-matched pairs | Sound; locator now states the criterion |
| `discriminantOrthogonalHom_surjective_of_isometry_scale_two` (new) | M(2) itself; ⟨12⟩; M (n=1); dimension of V; root-class count; group order | A_{M(2)} = ½M/M ≅ M/2M, order 2¹⁰·1 = 1024 (`discriminant_smul`); q_S(x/2) = B(x,x)/4 mod ℤ = Q(x̄)/2. Plus type: singular nonzero vectors (2⁵−1)(2⁴+1)=527, nonsingular 1023−527=496. Root classes: e−f (1) + e+f+y with y²=−4 (135) + y, e+y, f+y for y a root (3·120) = 496, every Q=1 class is a root class. Order 2·2²⁰·31·3·15·63·255 = 2²¹·3⁵·5²·7·17·31 (GH line 112). ⟨12⟩: O(q)={1,5,7,11} (u²≡1 mod 24) against {1,11} from O(⟨12⟩)={±1}: the isometry hypothesis is needed. S=M (unimodular): A trivial, surjective, no counterexample. `e` is a linear equivalence V ≃ ℚ²×ℚ⁸, so rank 10 is forced and no junk dimension enters. `[S.IsNondegenerate]` and `hS` are the arguments `discriminantOrthogonalHom` requires. Probe leaves `sorry` | Sound; stated as repair of R01 |
| M = U ⊕ E₈(−1) carriers (`README.md:133–136`) | Gram of U; sign of E₈; negation | `!![0,1;1,0]` at Examples.lean:105; `isPosDef_typeE₈RootLattice`; `-L = (-1)•L` keeps the carrier. (e,e)=0, (e,f)=1, (y,y)<0 for y≠0 in −E₈: signature (1,9), unimodular (det −1·1) | Sound |
| §7.1 remaining targets, §§7.2–7.3, Layers 1–6 | as r17 | unchanged text | Sound (r17) |

**Remarks on text outside the change (no change requested)**
- The pull-request description still says "its ten prospective proof targets remain admitted"; `Suggested.lean` now states five theorems. The description is not part of the folder.

## Not verifiable

- **Rudakov–Shafarevich 1983** and **Nikulin 1983, Theorem 3.6.3**: uncertified in the manifest, cited by locator; the surjectivity consequence is certified through gritsenko-hulek-enriques-moduli lines 113–114.
- **Grove, Theorem 14.16** behind char2-orthogonal-involutions line 188: not cached and not cited by the README.
- **Gap registration:** the board package has no readable `design/plan.json`, so the slug `enriques-ruledness` could not be matched (as in the previous review).

## Source issues

- none
