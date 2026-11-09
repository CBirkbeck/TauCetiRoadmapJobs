# Review of K3Surfaces (pull request #1285 at e565cd5)
**Verdict:** needs changes

The head is the one the previous review read; the folder has not changed. The previous review's one finding (the Part II re-proving (U) at p=2) is now repaired on the Part II's side. This independent pass finds three new defects. The theorem that §7.1 is built to reach, surjectivity O(S)→O(q_S) for S≅U(2)⊕E₈(−2), can be stated at the pins and is missing from the acceptance test (P2). The extension criterion's locator does not state the criterion (P3). Two Layer section titles in `Suggested.lean` differ from the README (P3).

## R01 (P2) — §7.1's discriminant surjectivity is statable at the pins but absent from Suggested.lean

**Location:**
- `TauCetiRoadmap/K3Surfaces/README.md:44–47`: "IntegralLattices supplies no surjectivity of an integral orthogonal group onto the orthogonal group of its discriminant form; §7.1 owns the one case used here".
- `README.md:923–927`: "Prove that O(S)→O(q_S), that is `TauCeti.IntegralLattice.Isometry.discriminantOrthogonalHom` for S, is surjective".
- `Suggested.lean:85–106` states only the gluing criterion for Layer 7, and the docstring (`:8–33`) neither states nor names this theorem.

**Claim:**
- This roadmap is the only owner of the surjectivity. IntegralLattices on main hands Nikulin's general surjectivity to `IntegralLatticesPartII` (`IntegralLattices/README.md:122`), a roadmap that exists nowhere.
- Layer 7 is built to reach it: it needs the characteristic-two transvection generation theorem and the root-class count, and §7.3 needs it to identify the marking group with O⁺(T).
- It is deeper than `gluing_isometry_extension_iff`, which is stated.
- Every carrier exists at the pins: `hyperbolicPlane` (Examples.lean:88), `typeE₈RootLattice` (RootLattice/TypeE/Basic.lean:676), lattice negation and `•` scaling (Scaling.lean:76, :263), `orthogonalSum`, and `discriminantOrthogonalHom : Isometry L L →* FiniteQuadraticModule.orthogonalGroup (L.discriminantQuadraticModule hL)` (Discriminant/OrthogonalGroup.lean:249).
- A statable headline that is absent is P2.

**Witness:** the statement below, appended to a scratch copy of `Suggested.lean`, elaborates. The output has exactly five `declaration uses sorry` warnings and no others. The one-tactic probe (`simp`, `rfl`, `infer_instance`, `trivial`) leaves it open. ⟨12⟩ (`README.md:981–983`) shows the isometry hypothesis is needed.

**Exact repair:**
- Add `import TauCeti.LinearAlgebra.IntegralLattice.Examples`, `import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeE.Basic` and `import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.OrthogonalGroup`.
- Under Layer 7, after `gluing_isometry_extension_iff`, add the definition and theorem below.
- In the module docstring, list it among the stated headlines.
- In `README.md`, name `enriquesLattice` and the theorem in §7.1's "Discriminant surjectivity" paragraph (`:923`) or its API bullet (`:953`), and add the theorem to the acceptance statements at `:210–213`.
- Tested: the file elaborates with only the five `sorry` warnings.

```lean
/-- The Enriques lattice `M = U ⊕ E₈(−1)`, even unimodular of signature `(1, 9)`. -/
noncomputable def enriquesLattice : IntegralLattice ((Fin 2 → ℚ) × (Fin 8 → ℚ)) :=
  IntegralLattice.hyperbolicPlane.orthogonalSum (-IntegralLattice.typeE₈RootLattice)

/-- For an even lattice `S` isometric to `M(2) = U(2) ⊕ E₈(−2)`, every isometry of the
discriminant quadratic form of `S` is induced by an integral isometry of `S`
(Gritsenko–Hulek, §2, p.3). -/
theorem discriminantOrthogonalHom_surjective_of_isometry_scale_two
    {V : Type*} [AddCommGroup V] [Module ℚ V] (S : IntegralLattice V) [S.IsNondegenerate]
    (hS : S.IsEven) (e : S.Isometry ((2 : ℤ) • enriquesLattice)) :
    Function.Surjective (IntegralLattice.Isometry.discriminantOrthogonalHom S hS) := by
  sorry
```

The isometry `e` carries the hypothesis; with the concrete lattice `(2 : ℤ) • enriquesLattice` itself, `[IsNondegenerate]` would be a concrete-instance assumption and trip the linter. The O(T) and O⁺(T) consequences follow by g↦id_U⊕g and stay README targets.

## R02 (P3) — The extension criterion is cited to a passage that only applies it

**Location:**
- `README.md:877–878`: "Gritsenko–Hulek v2, §2, p.4 for extension".
- `README.md:886–887`: "extensions respect composition and inversion (Gritsenko–Hulek v2, §2, pp.3–4)".
- `Suggested.lean:95`: "(Gritsenko–Hulek, §2, p.4; Huybrechts, §14.0.3(vii), p.284 for the K3 model)".

**Claim:**
- The cited page extends one Enriques marking to the K3 cover, attributing the step to Nikulin's Corollary 1.5.2 together with the surjectivity O(N)→O(D_N). It states no criterion for a pair (g,h), and neither direction of the iff.
- The criterion in both directions is in the same certified Huybrechts draft. Lemma 14.2.5 says an isometry of Λ preserving a primitive Λ₁ induces equal discriminant actions on Λ₁ and Λ₂ = Λ₁^⊥. Proposition 14.2.6 gives the converse: it extends g₁ exactly when ḡ₁ is in the image of O(Λ₂), and its proof shows that x₁+x₂ ↦ g₁x₁+g₂x₂ preserves Λ when the discriminant actions agree.
- The glued lattice is exactly this situation: by `exists_eq_glueAlongDiscriminant` and `mem_glueAlongDiscriminant_left_iff` (Graph.lean:337, :158), S and T are mutually orthogonal primitive sublattices of an even unimodular lattice.

**Witness:** gritsenko-hulek-enriques-moduli lines 122–126 (p.4) contain only the marking-extension sentence. huybrechts-k3 lines 11176–11196 (§14.2.2, pp.291–292) contain Lemma 2.5 and Proposition 2.6 of Chapter 14 with the converse argument.

**Exact repair:**
- At `README.md:878` replace "Gritsenko–Hulek v2, §2, p.4 for extension" by "Huybrechts draft §14.2.2, Lemma 14.2.5 and Proposition 14.2.6, pp.291–292, for extension; Gritsenko–Hulek v2, §2, p.4 applies it".
- At `:887` cite the same Huybrechts locator.
- In the docstring at `Suggested.lean:95` replace "Gritsenko–Hulek, §2, p.4" by "Huybrechts, Lemma 14.2.5 and Proposition 14.2.6, pp.291–292".

Checked on ⟨4⟩⊕⟨−4⟩ (below): the pairs with matching signs extend, as Proposition 14.2.6 predicts.

## R03 (P3) — Two Layer section titles in Suggested.lean differ from the README

**Location:**
- `Suggested.lean:41`, "Layer 0: Algebraic surfaces and differential vanishing", against `README.md:215`, "Layer 0: Algebraic surfaces and the early differential theorem".
- `Suggested.lean:85`, "Layer 7: Integral involutions and gluing", against `README.md:855`, "Layer 7: Integral involutions and free quotients".

**Claim:** the Lean form requires `/-! ## Layer k: <title> -/` section comments in README order, with README and Lean agreeing. The order is right but two titles are paraphrases.

**Witness:** the four quoted heading lines.

**Exact repair:** copy the two README layer titles verbatim into `Suggested.lean:41` and `:85`. The Layer 7 section is edited under R01 anyway.

## Previous findings

- **R01 (P3) of the previous review — the Part II re-proved (U) at p=2, and the description stated no order: repaired on the Part II side.**
  - K3SurfacesAndSymplecticBoundedness moved from `012a76e` to `cee718f`.
  - Its `README.md:9` now says K0.A owns (U) "in every positive characteristic, 2 included".
  - `:78` says it consumes (U) and "restates neither its statement nor its proof".
  - `:415` applies (U) at p=2 through §1.3 instead of proving it.
  - `:421`'s *Needs:* cites "K3Surfaces §0.2 (K0.A: its vanishing theorem at p>2, the reduction (U) at p=2, and sub-target (i))".
  - This matches `README.md:1165–1170` here, so nothing is carried.
  - One remark for the description, which is not part of the folder: it still says "its ten prospective proof targets remain admitted". `Suggested.lean` states four theorems, five after R01.

## Verified sound

**Gate, folder, pins, dependency check**
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/K3Surfaces'` prints nothing. The folder holds `README.md` (1226 lines), `Suggested.lean` (108) and `metadata.toml` (1).
- Gate rerun with `--base origin/main`: every scanner reports 0, then "OK", exit 0. The worker's gate on this head also reports `build=0`.
- `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the same as `origin/main` at `9ce83111`.
- Dependency check (`--movable`):

```text
depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line. Merge-order lines:
  - suppliers: JacobianChallenge 1, IndexTheory 10, SmoothBundlesConnections 12, AlgebraicModuliForArithmeticGeometry 34, ComplexComparisonPartII 39, EtaleCohomologyFoundations 42, NeronModels 66–67, FourManifolds 134;
  - this roadmap: K3Surfaces 135;
  - later roadmaps: K3SurfacesAndSymplecticBoundedness 315, EnriquesSurfacesAndIntegralNonexistence 323, EllipticKTheory 380.
- PCurvature (#1747, by another author) is a new roadmap folder in an open pull request, named in the description's Depends-on list.
- No forbidden supplier (HomotopySpheres, QuaternionicModularForms, …) is cited.
- A scan for process words, pull-request numbers, LaTeX delimiters and `lemma` finds only source locators ("Lemma 1", "Lemma 37.44.2", "Lemma 3.11", "Lemma 7.3.5") and "positive-current".

**Elaboration, signatures, padding**
- `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at `:56`, `:67`, `:77` and `:96`.
- A scratch copy with `#check @` for all five declarations matches each README statement:
  - `IsAlgebraicK3` keeps `[Field k] [IsAlgClosed k] [X.Over (Spec ↧k)]`;
  - the vanishing theorem keeps `[CharP k p]` and `2 < p`;
  - (U) keeps `Nat.Prime p` and `[CharP k p]`;
  - (i) has no characteristic binder;
  - the gluing theorem keeps both `IsNondegenerate` instances, `hS`, `hT` and γ into `.neg`.
  - No binder is lost; the worker's signature file agrees.
- One-tactic probe: each `sorry` was replaced by `first | simp | rfl | infer_instance | trivial | (constructor <;> infer_instance) | exact ⟨fun _ _ => Subsingleton.elim _ _⟩ | (constructor <;> intro h <;> simp_all) | exact ⟨⟨⟩, ⟨⟩⟩ | sorry`. All four still report `sorry`, so none is padding.
- All 52 backticked library names in the README were `#check`ed in one scratch file at the pins, and every one resolves.

**Library declarations opened (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`)**
- `#print`: `Scheme.Modules.Cohomology M i := ((SheafOfModules.toSheaf _).obj M).H i`, abelian-sheaf cohomology. `LineBundleClass X := Skeleton (InvertibleSheaf X)`.
- Mathlib `Geometrically/Integral.lean:40–45`: `GeometricallyIntegral f` is `geometrically IsIntegral f`, so the empty scheme fails it, as the §0.1 Check says.
- Graph.lean:
  - `:49–50` `discriminantGraph` is the comap of the graph of γ;
  - `:94–98` `glueAlongDiscriminant` is `ofIsotropicSubgroup` of it;
  - `:123–131` `mem_glueAlongDiscriminant_iff` says (x,y) lies in the carrier iff γ[x]=[y], which drives both directions of the criterion;
  - `:337–343` `exists_eq_glueAlongDiscriminant` has hypotheses form, containment, even, unimodular, left, right;
  - the file has no extension criterion (28 declarations listed), as `README.md:165` says.
- `Naturality.lean:452–457` `ofIsotropicSubgroups`, the route's restriction step.
- `Scaling.lean:76–107` `scale` keeps the carrier and multiplies the form, with `n • L = scale n L`. `:263–271` negation is `(−1) • L`.
- `Dual/Scaling.lean:71–73` `dualCarrier_smul`: the dual carrier of `n • L` is `n⁻¹` times that of `L`, so the dual of M(2) is ½M.
- `QuadraticForm/OrthogonalGroup/Basic.lean:977–983` `reflectionOrthogonal` is `reflection Q v`.
- `CartanDieudonne/Basic.lean:673–679` assumes `[NeZero (2 : K)]`, so it does not apply over 𝔽₂, as `README.md:122–125` says.
- `Discriminant/OrthogonalGroup.lean:249–256` (`discriminantOrthogonalHom`), `Examples.lean:60–61, 88–90` (U has Gram (0,1;1,0)), `TypeE/Basic.lean:676–678, 750`.
- No holomorphic line-bundle class group, Kähler or Ricci carrier exists at either pin. The hits for "holomorphic" with "line" are determinant lines and Floer almost-complex files. So the docstring's unstatable list holds, apart from R01.

**Cross-roadmap citations resolved this round**
- Main `9ce83111`: since `f7dd719a` no supplier folder changed; the new folders on main are DeRhamCohomologyAndDuality, RiemannianGeometry/Surfaces and others, none cited. Re-resolved:
  - SchemeAndStackFoundations: 0.3 `:551`, 1.17 `:2624`, 1.23 `:3021`, 2.2 `:3309`, 2.3 `:3330`, 2.6 `:3437`, 2.11 `:3656`, 2.20 `:4275`, 3.4 `:4789`, 4.9 `:5448` (with Stein factorisation and Zariski connectedness at `:5472–5475`), 4.11 `:5528`, 4.13 `:5643`, 5.9 `:7129`, 5.10 `:7175`.
  - EtaleCohomologyFoundations: F.0.4 `:248`, F.2.5 `:613`, 0.9 `:1120`, F.5 `:1179`, F.6 `:1200` (Gauss–Bonnet `:1219`), F.7 `:1239`.
  - GlobalQuadraticForms 5.5 `:665`; ModularCurves 2B `:1243`.
  - MorseNovikov: N5–N7 are Layers 5–7 (`:176`), with local index §5.2 `:835`, Lefschetz `:1131`, `:1216` and Poincaré–Hopf `:1285`, `:1355`.
  - SmoothBundlesConnections B1.5 `:498`; CharacteristicClasses C1 `:212`, C3 `:1000`, C7 `:1817`.
  - JacobianChallenge A–D `:111–218`; StableReduction Layers 4–6 `:529–576`; AlgebraicCurves Layers 9/10/12 `:1099`, `:1193`, `:1468`; GeometricTopology Layer 1 `:177`; Completed/HopfRinow Layer 1 `:264`.
  - DifferentialGeometry Layers 0–3, 5, 8, 9 `:268–862` and 12.1 `:915`; AlgebraicTopology Stages 1, 5, 6, 7 `:289–1573`.
  - ComplexKahlerGeometry K1–K7 `:96–1405`, K5a/K5b `:33–51`; main CKG has no Picard or exponential-sequence target.
  - IntegralLattices: labels 0G and 1E–1F name native rows (`:438`, `:443`, `:455`); 5F `:1899`, 5G `:1915`, 5J `:1974`, 6A `:2019`.
- Open heads:
  - ComplexComparisonPartII at `c7c7c50` (moved): C-1.1 `:996`–C0.7 `:1500`, C1.9 `:1966` with analyticPicardGroup at `:2101`, C2 `:2221`, C4.1–C4.4 `:2667–2730`, C5.4 `:3706`. C5.4 states the frame-torsor bijection, the sequence `u ↦ exp(2πiu)` and δ[L] equal to the integral Chern class at `:3998–4008`. It writes the frame convention as "g_αβ changes β-coordinates to α-coordinates" (`:4009`), which is e_β=g_αβ e_α, the README's e_j=e_i g_ij. Its consumer list names K3Surfaces §1.1 at `:5297`.
  - AlgebraicModuliForArithmeticGeometry at `4f0ad34`: 1.1–1.3 `:305–601`, 7.3 `:9296`, 7.8 `:9767`, 8.1–8.3 `:9867–9943`.
  - NeronModels at `4c22d44`: 5.3e `:3539`, Ogg in every residue characteristic at `:3549`. NeronModelsPartII at `9027cc3`: §6.1 `:9814–9892` contains Castelnuovo–Zariski at `:9846`.
  - PCurvature at `13eb63f`: 0.1–0.3 `:146–200`.
  - IndexTheory at `6d85f5d`: I6 `:1238`, I7.1–I7.3 `:1344–1392`, I8 `:1575`; its `:1671` lists K3Surfaces as consumer of exactly these.
  - FourManifolds at `46ee76a`: Layer 7 `:2868` with the quartic comparisons at `:2870` and `:2895`.

**Overlaps and ownership (checked against the sibling heads this brief gives)**
- The 11 overlap leads ("only #617/#1411/#1797 define IntegralLattices §§0G, 1B, 1E, 5J, 6A") are false: all resolve on main, above. No open pull request changes this roadmap or drops an id it cites.
- ComplexKahlerGeometry #1234 at `5577d7d` (`:51–53`, `:773–777`) and ComplexComparisonPartII C5.4 (`:3998`, `:5297`) both claim the exponential segment and both list K3Surfaces §1.1 as consumer. This folder cites C5.4: it is earlier in the order (39), and main's CKG has no such target. This folder owns neither object (`README.md:18–24`), so the double claim lies between #1234 and #848.
- Surface resolution: §0.2's adapter is built from StableReduction Layer 4 (main). EllipticKTheory (#1489, order 380) states `excellentSurfaceResolution` (`:1906`), and the Part II asks SchemeAndStackFoundations for finite-quotient resolutions (`gap:surface-quotient-resolutions`, `:106`). K3Surfaces is the earliest of these owners, so it cites none of them; settling the later two is for those pull requests.
- EnriquesSurfaces at `e852f4d` consumes the K7.A criterion (`:658`) and §7.3 (`:648`). Its Reye mod-two headline (Suggested `:81–95`) concerns the T246 Coxeter group, a different object from O(M(2))→O(q). No other `Suggested.lean` declares a `TauCetiRoadmap.K3Surfaces.*` name, nor an Enriques lattice in Tau Ceti.
- `gap:enriques-ruledness` (`README.md:191–200`) is precise and minimal. `roadmaps grep` for ruledness and Kodaira dimension −∞ finds no owner on main or at any open head.

**Sources: the seeded sample of 13 targets.** Each locator was opened in the cached text. Printed page equals PDF page, except Rudakov–Šafarevič 1976 (+1204) and Shen (+246).

| Target | Locators (source id line), result |
| --- | --- |
| 0.1 | huybrechts-k3 135–148 (Def 1.1, Rem 1.2, p.7), 226–229 (Ex 1.1.3(iv), p.9), 335–352 (Prop 1.2.4, Rem 1.2.5, p.12), 373–375 (Noether, p.13). Match. |
| 0.2 | martin 126–140 (Thm D, Cor 1.1, pp.3–4; Cor 1.1 covers every characteristic, 142–144), 1713–1718 (p.40), 1544–1551 (Ex 5.12, p.36); rudakov-shafarevich-inseparable 75–84 (Lemma 1 and Corollary, p.1206), 440–441 (Thm 5, p.1216), 481–492 (Cors 1–2, p.1217); huybrechts-k3 6797–6818 (Prop 9.4.6, p.180, every p>0, π*ω_Y≃L^−(p−1)), 14076–14090 (Prop 17.2.7, pp.367–368), 7879–7887 (Prop 11.1.3, p.208), 5646–5655 (Rem 8.2.13, p.151), 1103–1105 (Prop 2.3.10, p.32); liedtke 718–730, 755–758, 770–774, 934 (pp.20–25); gounelas-liedtke 253–258 (Prop 2.2(2), p.6); stacks-02UP 6305–6307. Match. |
| 1.1 | huybrechts-k3 452–466 (§1.3.2, (3.1), p.15, H¹(O)=0 used), 420–437 (Prop 1.3.2, Ex 1.3.3, p.14), 496–501 and 515–517 ((3.2), fn 9, p.16), 4899–4900 (§7.3.2); dolgachev 231–237 (p.6), 272–286 (pp.7–8). Match. |
| 2.1 | huybrechts-k3 4903–4909 (Thm 7.3.6, p.131), 6904–6906 (Thm 9.4.11, p.183), 525–541 (Prop 1.3.5, p.17). Match. |
| 3.1 | huybrechts-k3 3955–3958 (Cor 6.2.7, p.107), 3980–3985 (§6.2.4, p.108). Match. |
| 4.1 | huybrechts-k3 3649–3653 (p.99), 3705–3723 (Prop 6.1.5, Rem 6.1.6, p.101), 3960–3963 (Prop 6.2.8), 4001–4004 (§6.2.5), 4954–4987 (Rem 7.3.8, Prop 7.3.9, p.133). Match. |
| 5.1 | huybrechts-k3 4940–4941 (Prop 7.3.7, p.132). Match. |
| 5.2 | huybrechts-hyperkahler-torelli 375–376 (Prop 3.10, p.10), 417–420 (Lem 3.11, p.11); huybrechts-k3 4826–4829, 4884–4889 (p.131). Match. |
| 6.1 | huybrechts-k3 4780–4781 (Prop 7.2.2, p.129), 5049–5050 (Cor 7.5.1), 5066–5069 (Thm 7.5.3, p.135), 5082–5085, 5167–5168 (O⁺=Mon, p.138); huybrechts-hyperkahler-torelli 527–529 (Prop 4.7, p.14). Match. |
| 6.2 | huybrechts-k3 6152–6155 (Thm 8.5.2, p.163), 4232–4236 (Rem 6.3.7, p.114), 4258 (§6.4). Match. |
| 7.1 | huybrechts-k3 10894–10898 (§14.0.3(vii), p.284); gritsenko-hulek 107–114 (p.3: D≅𝔽₂¹⁰, order, surjectivity by Nikulin 3.6.3), 122–126 (p.4: R02); char2-orthogonal-involutions 107 (nonsingular), 186–188 (§3, p.6, with the H⊥H exception). Match except R02. |
| 7.2 | shen 442–468 (Assumption 2.1, Def 2.2, (2.7)–(2.8), pp.256–257); artebani-sarti-taki 497–503 (Thm 3.1, p.10); huybrechts-k3 12702–12705 (§15.4.3(ii), p.330, char ≠2). Match. |
| 7.3 | gritsenko-hulek 181–188 (Thm 2.1, Rem 2.2, p.5), 283–287 ((8), Namikawa Prop 6.2, §3, p.8); dolgachev 607–612 (§5, p.15). Match. |

**Adversarial table**

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `IsAlgebraicK3` | Fermat quartic char 3; abelian surface; ℙ²; empty; thickening | Quartic: ∂ᵢ=4xᵢ³=xᵢ³, common zero only 0; ω=O(0); h¹=0, so it passes. Abelian: h¹(O)=2, fails. ℙ²: ∧²Ω=O(−3), fails. Empty: fibre not integral, fails. Thickening: not smooth. | Sound |
| §0.1 numerics, contraction | K3 against torus; σ=dx∧dy; 2σ in char 2, 3 | χ=1−0+1=2 and c₂=24, against 0 and 0 for the torus. ∂x↦dy, ∂y↦−dx. In 𝔽₃, ½=2 and 2·2=1; in char 2, 2σ=0. | Sound |
| `algebraicK3_differential_vanishing` | binder; p=2; probe | `CharP k p` with 2<p forces an odd prime. p=2 is true (gounelas-liedtke 258; martin 140) and is consumed by the Part II at `:415`. Probe leaves `sorry`. | Sound |
| Restricted structure | x∂ₓ; Hochschild; t²∂ₜ; t∂ₜ+cu∂ᵤ; ∂ₓ² over ℚ; fixed vectors | nᵖ≡n; correction x∂ₓ; n(n+1)⋯(n+p−1)≡0; (cᵖD−cD^[p])/(cᵖ−c)=t∂ₜ; 2 against Leibniz 0. Jacobian of xᵢᵖ−ΣNᵢⱼxⱼ is −N, invertible: étale, pⁿ points. | Sound |
| (U) `unirational_of_nontrivial_vectorField` | sign of canonical formula; p=2; abelian surface; probe | ℙ¹ with F=T: K_X=π*K_Y+(p−1)c₁(F) gives −2=−2p+2(p−1), matching π*ω_Y≃L^−(p−1) (huybrechts 6818). At p=2 the exponent is 1 and O(−nΔ) has no sections. Abelian: c₂=0, b₁=4, so the K3 hypothesis is needed. Probe leaves `sorry`. | Sound |
| Case (b) | negative definiteness; trees; Euler | K·E_j≥0 forces b_i≤0. E_i²=−2. (E_i+E_j)²=−4+2E_iE_j<0 gives E_iE_j≤1. An m-cycle: −2m+2m=0. A tree of n curves: 2n−(n−1)=n+1. 24+Σn_r≤12·2 gives Σn_r=0. | Sound |
| (i) `finrank_lineBundleClass_eq_twentyTwo_of_unirational` | Fermat char 3; b₂; char 0; ℙ², ℙ¹×ℙ¹; junk | ρ=22 (huybrechts 14090). 24=1−0+b₂−0+1 gives b₂=22. Char 0: vacuous, since σ would pull back to a 2-form on a blow-up of ℙ². Controls: ranks 1 and 2 equal b₂. Gram determinant D≠0 embeds the group in (1/D)ℤ^r, so `finrank` is not a junk value. | Sound |
| Step 3 numerics | Martin Ex 5.12, k=1, 2 | 9+3=12, 3+9=12, 81+3=84, 27+9=36. 24−3=21 and 24−9=15 are not powers of 3. | Sound |
| §1.1 | ℙ²; Enriques; rank-one K3; E×E | c₁(O(±1))·ℓ=±1. H²(S,ℤ)=ℤ¹⁰⊕ℤ/2, with K_S of order 2 and real image 0. Rank-one image inside rank 22. ker c₁=H¹(O)/H¹(ℤ), a complex torus of dimension 2. | Sound |
| §2.1 | Λ; σ=ω_J+iω_K; iσ | det=(−1)³=−1; rank 22; τ=(0−48)/3=−16=3−19. σ²=2−2=0, (σ,σ̄)=4. iσ gives (−ω_K,ω_J), det 1. | Sound |
| §§3.1–4.1 | ε²=0; h²=4, 2; B=±I₂; c=3+4i; ranks 0, 1 | h¹(T)=20; 20−1=19; (2h)²=8. B(z,z)=0 and B(z,z̄)=±2. 25·2=50. Rank 0 and rank-1 (1): no z. | Sound |
| §§5–6 | κ²=2; (I+J)/√2; ±φ; s_δ | Squares 2 and 8; (−κ,κ)=−2. ((I+J)/√2)²=−1. Orientation sign (−1)³. (x+δ)²=2+2−2=2 against (x−δ)²=−2. χ(O(δ))=1. | Sound |
| §7.1 model | ranks, signatures, discriminants | 10 and 12; (1,9) and (2,10); \|A\|=2¹⁰ each. (e,e)·(f,−f)=0; a diagonal root has square −4. | Sound |
| `gluing_isometry_extension_iff` | ⟨4⟩⊕⟨−4⟩ by script; ⟨2⟩⊕⟨−2⟩; ⟨2⟩⊕⟨2⟩; rank 0; probe | q(e/4)=1/8=−q_T(f/4). Signs (1,1) and (−1,−1): extends and commutes. (−1,1) and (1,−1): neither. ((e+f)/2)²=0 and det −4/4=−1. For ⟨2⟩⊕⟨2⟩, ¼+¼=½≠0. Rank 0: both sides true. Probe leaves `sorry`. | Sound; R02 (locator) |
| Discriminant surjectivity (R01) | E₈ mod 2 and 𝔽₂ orthogonal groups by script; ⟨12⟩ | 240 roots give 120 classes; 2160 norm-4 vectors give 135 classes, disjoint. 1·136+3·120=496=2⁹−2⁴. Representative squares −2. O⁺(4,2): 6 transvections generate 36 of 72. O⁺(6,2): 28 generate all 40320. \|O⁺(10,2)\|=46998591897600=2²¹·3⁵·5²·7·17·31. ⟨12⟩: O(q)={1,5,7,11}, against {1,11} from O(⟨12⟩). The new statement elaborates; probe leaves `sorry`. | True and statable; R01 |
| §7.2 | id, reflection, antipodal on S²; double sextic; rotation; AST; δ | 2=χ(S²); 0=χ(S¹); 0 and empty. g=10, χ=−18=2+(1−21). det(1−R_{2π/3})=3. (1,1,1) gives g=10, k=0. (10,10,0) gives formula genus 1 but an empty locus. ⟨2⟩⊕⟨−2⟩⁹ has q=¼, so δ=1. | Sound |
| §7.3 | e−f; e′−f′ in U(2); e−2f; C−jC | −2 with div 1; −4 with div 2; −4 with div 1. (C−jC)²=−4, and (C−jC,t)=2(C,t) gives div 2. | Sound |

## Not verifiable

- **Rudakov–Shafarevich 1983, p.1502** (the pencil step of sub-target (iv)): uncertified in the manifest. Martin quotes it (martin-infinitesimal-automorphisms lines 142–144 and 1714).
- **Nikulin 1983, Theorem 4.2.2:** uncertified. The fixed-locus statement is certified through artebani-sarti-taki lines 497–503.
- **Grove, Theorem 14.16** behind char2-orthogonal-involutions line 188: not cached and not cited by the README.
- **Gap registration:** the board package has no readable `design/plan.json`, so the slug `enriques-ruledness` could not be matched.

## Source issues

- **Misprint** in gritsenko-hulek-enriques-moduli at §2, p.4: the source writes "signture" for the signature (2,10) of N; it should read "signature"; affects nothing.
- **Misprint** in char2-orthogonal-involutions at §3, p.6: the source writes that V is not "of the from" H⊥H; it should read "of the form"; affects nothing.
