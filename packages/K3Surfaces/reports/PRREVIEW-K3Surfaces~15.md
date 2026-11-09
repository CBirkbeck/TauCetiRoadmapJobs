# Review of K3Surfaces (pull request #1285 at d6bce64)
**Verdict:** needs changes

This is a full review of head `d6bce64e5d69c9280820f3194f592c7ea8d5c3ef`; the folder changed by 192 lines since `2ddcd6b`. The previous blocking finding, the two pins, is repaired. One new blocking finding: §1.1 now owns a general complex-geometry statement that ComplexKahlerGeometry's open revision also owns. There are two P3 findings: a re-encoding in the gluing headline, and the carried Part II (U) ownership.

## R01 (P2) — §1.1 owns the exact Picard segment on every complex manifold, which ComplexKahlerGeometry's open revision also owns

**Location:**
- `TauCetiRoadmap/K3Surfaces/README.md:407–419`: "For every complex manifold M, let Pic_hol(M) be the group of isomorphism classes of K4's holomorphic line bundles … prove the exact segment `H¹(M,O_M) → Pic_hol(M) → H²(M,ℤ) → H²(M,O_M)`".
- `:412–414`: "This section owns its K3 applications only: the exact segment below". The Scope says the same at `:17–19`.

**Claim:**
- The group and the segment are stated on an arbitrary complex manifold, and the §1.1 Checks are not K3 surfaces: ℙ¹, a point, the empty manifold, two copies of ℙ¹ and an elliptic curve (`:431–446`). So §1.1 owns a general theorem, while its own Scope says it owns only K3 applications.
- The open revision of ComplexKahlerGeometry adds a target K4.P. K4.P owns the same group and the same segment on every complex manifold, and names K3Surfaces 1.1 as its consumer.
- Each roadmap therefore treats the other as the user of its object. Once both merge, the object has two owners.
- Main's ComplexKahlerGeometry (at `e9fd8e4`) contains neither "Pic_hol" nor this segment, so nothing in this folder can cite it there yet.

**Witness:** ComplexKahlerGeometry at its open head `96d5e07`, `TauCetiRoadmap/ComplexKahlerGeometry/README.md`:
- `:760`: "Define Pic_hol(M) as holomorphic isomorphism classes of K4's rank-one locally free 𝒪-modules";
- `:776–778`: the segment `H¹(M,ℤ)→H¹(M,𝒪)→Pic_hol(M)→H²(M,ℤ)→H²(M,𝒪)`;
- `:843–848`: "K4.P owns, on every complex manifold, … the group `Pic_hol(M)` … K3Surfaces 1.1 … use the group `Pic_hol(M)`".

**Exact repair (in this folder):**
1. In §1.1, replace the general definition and the general segment by the K3 application, which is what `:456` already uses: for a compact complex surface X with H¹(X,O_X)=0, the first Chern class from the holomorphic line-bundle classes of X to H²(X,ℤ) is injective, with image the kernel of H²(X,ℤ)→H²(X,O_X). Prove it from C5.4's frame-torsor bijection and the native long exact sequence of C5.4's exponential sequence on X.
2. In Scope (`:13–19`) and at `:412–414`, say that the group of holomorphic line-bundle classes and the exact segment on an arbitrary complex manifold are not owned here.
3. Checks:
   - Keep the Picard-rank-one K3 (`:442–443`) and the elliptic curve (`:444–446`); the elliptic curve is the negative control for H¹(O)=0.
   - Delete the ℙ¹, point/empty-manifold, two-copies-of-ℙ¹ and logarithm-cocycle Checks (`:431–441`). They test C5.4's general statement, which C5.4 already checks: ComplexComparisonPartII `README.md:4043–4055`, O(±1) on ℙ¹ and the elliptic curve.

Alternative: cite ComplexKahlerGeometry K4.P for the group and the segment, and name that revision in the description's merge-order paragraph, since it is an id only an open revision defines.

**Tested on the instance:** after the repair, §1.1's statement assumes H¹(O)=0 and allows H²(O)=ℂ (the K3 case). K4.P states only the general segment and a conditional isomorphism under H¹(𝒪)=H²(𝒪)=0 (ComplexKahlerGeometry `README.md:781`), which does not cover a K3. So each statement has one owner. §3.1's use of C5.4 on total spaces (`:569`) cites C5.4 directly and is unaffected.

## R02 (P3) — The gluing headline re-encodes Tau Ceti's glued lattice instead of naming it

**Location:**
- `TauCetiRoadmap/K3Surfaces/Suggested.lean:103–107`: `(L : IntegralLattice (V × W)) (hform : L.form = (S.orthogonalSum T).form) (hcarrier : L.carrier = … (γ.toAddEquiv.toAddMonoidHom.graph.comap (S.discriminantGroupOrthogonalSumEquiv T).toAddMonoidHom) …)`.
- The same encoding in prose at `README.md:154–162` and `:855–859`.

**Claim:**
- The subgroup in `hcarrier` is word for word the body of the pinned `TauCeti.IntegralLattice.discriminantGraph`.
- Together, `hform` and `hcarrier` say exactly that `L` is `S.glueAlongDiscriminant T hS hT γ`. The README itself says this at `:159–162`.
- So the headline restates a pinned construction instead of naming it. A consumer also has to re-derive the two hypotheses: §7.1 obtains Λ from `TauCeti.IntegralLattice.exists_eq_glueAlongDiscriminant`, whose conclusion is the equation `N = L.glueAlongDiscriminant M hL hM f`.

**Witness:**
- Tau Ceti `2fd255d9`, `TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Graph.lean`:
  - `:49–50` defines `discriminantGraph := e.toAddEquiv.toAddMonoidHom.graph.comap (L.discriminantGroupOrthogonalSumEquiv M).toAddMonoidHom`;
  - `:94` defines `glueAlongDiscriminant`;
  - `:343` is the conclusion of `exists_eq_glueAlongDiscriminant`.
- In a scratch file, `L = S.glueAlongDiscriminant T hS hT γ` follows from `hform` and `hcarrier` by `IntegralLattice.ext` with `rw [hcarrier, IntegralLattice.glueAlongDiscriminant, IntegralLattice.ofIsotropicSubgroup_carrier]; rfl` and `rw [hform, IntegralLattice.glueAlongDiscriminant_form]`.

**Exact repair:**
1. Replace the two lattice imports (`Discriminant.Operations`, `Overlattice.Basic`) by `import TauCeti.LinearAlgebra.IntegralLattice.Overlattice.Graph`.
2. Restate the theorem on the native lattice:

```lean
theorem gluing_isometry_extension_iff
    {V W : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    (S : IntegralLattice V) (T : IntegralLattice W)
    [S.IsNondegenerate] [T.IsNondegenerate] (hS : S.IsEven) (hT : T.IsEven)
    (γ : FiniteQuadraticModule.Isometry (S.discriminantQuadraticModule hS)
      (T.discriminantQuadraticModule hT).neg)
    (g : S.Isometry S) (h : T.Isometry T) :
    (∃! F : (S.glueAlongDiscriminant T hS hT γ).Isometry (S.glueAlongDiscriminant T hS hT γ),
        ∀ v w, F (v, w) = (g v, h w)) ↔
      ∀ a, γ (g.discriminantGroupEquiv a) = h.discriminantGroupEquiv (γ a) := by
  sorry
```

3. Adjust its docstring, and say at `README.md:154–162` and `:855–859` that the criterion is stated on `TauCeti.IntegralLattice.glueAlongDiscriminant`.

**Tested:** a copy of `Suggested.lean` with these two changes elaborates at the pins with exactly four `declaration uses sorry` warnings and nothing else.

## R03 (P3) — The Part II still owns and re-proves (U) at p=2, and the description still states no order

Carried from the previous review's R02 at the same severity.

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:1148–1152`: "at p=2 it uses §0.2's unirationality reduction (U) … This roadmap owns (U) for every prime p, so the p=2 case is a citation of §0.2, not a second proof."

**Claim:**
- This folder owns (U) for every prime. That matches the merge order: K3Surfaces is at line 135, K3SurfacesAndSymplecticBoundedness at line 315. The Lean headline also has `hp : p.Prime`.
- The Part II has a new head (`012a76e`), but it still owns the p=2 case and proves it again. So the README's description of that consumer is false of the consumer's head.
- The pull-request description is unchanged: it has no merge-order paragraph about the Part II, and it still says "its ten prospective proof targets remain admitted" although `Suggested.lean` states four theorems.
- This stays P3 rather than P2: this roadmap is the earlier owner and its README already states the right ownership. The second owner is in the other pull request, so the only change on this side is to the description.

**Witness:** K3SurfacesAndSymplecticBoundedness at `012a76e`, `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md`:
- `:10`: "Section 2.1a owns only the infinite-height kernel statement and the characteristic-2 case of the reduction";
- `:76`: "§2.1a extends that reduction to p=2";
- `:409`: "At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1."

**Exact repair:** nothing changes in the folder. The description's merge-order paragraph should state:
- that K3SurfacesAndSymplecticBoundedness rebases after this pull request;
- that it replaces its p=2 proof (`:10`, `:76`, `:409`, `:413`) by a citation of "K3Surfaces §0.2 (U)", `unirational_of_nontrivial_vectorField`.

The same edit should replace "ten prospective proof targets" by the four theorems. The repair is verified when the Part II's §2.1a no longer contains a proof of the reduction.

## Previous findings

- **R01 (P1), the folder needed two different Tau Ceti commits: repaired.**
  - `lake-manifest.json` now pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the pins of `origin/main` at `e9fd8e4`.
  - `Suggested.lean:2` imports `TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic`, and `README.md:93–95` names the directory.
  - `discriminantOrthogonalHom`, `discriminantKernel` and `ker_discriminantOrthogonalHom` resolve at `Discriminant/OrthogonalGroup.lean:249`, `:120` and `:278`.
  - The file elaborates at these pins.
- **R02 (P3), the Part II re-proves (U) at p=2: not repaired.**
  - `README.md:1148–1152` was rewritten, but the Part II's head still owns and proves the p=2 case, and the description is unchanged.
  - Carried as R03.

## Verified sound

**Gate, folder and dependency check**
- Outside the folder, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/K3Surfaces'` prints nothing. The folder holds `README.md` (1208 lines), `Suggested.lean` (113 lines) and `metadata.toml`.
- Gate rerun with `--base origin/main`: every scanner prints 0, it ends "OK", exit 0. The worker's gate also reports `build=0`.
- Dependency check (`--movable`):

```text
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line. Merge-order lines: JacobianChallenge 1, IndexTheory 10, SmoothBundlesConnections 12, ComplexComparisonPartII 39, EtaleCohomologyFoundations 42, NeronModels 66–67, FourManifolds 134, K3Surfaces 135; the consumer K3SurfacesAndSymplecticBoundedness is at 315.
- PCurvature is a new roadmap folder in an open pull request and is named in the description. No forbidden supplier is cited.
- A scan for process words, pull-request numbers and LaTeX finds none; the only hits are the false positive "positive-current".

**Elaboration, signatures and padding (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`)**
- `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at `:56`, `:67`, `:77` and `:97`.
- A scratch file printed `#check @` for all five declarations. Each elaborated type matches its README statement:
  - `IsAlgebraicK3` keeps `[Field k] [IsAlgClosed k] [X.Over (Spec ↧k)]`;
  - the vanishing theorem keeps `[CharP k p]` and `2 < p`;
  - (U) keeps `Nat.Prime p` and `[CharP k p]`;
  - (i) has no characteristic binder;
  - the gluing theorem keeps both `IsNondegenerate`, `hS`, `hT`, the `FiniteQuadraticModule.Isometry` γ into `.neg`, `hform` and `hcarrier`.
  - No binder is lost; the worker's elaborated-signature file agrees.
- **One-tactic probe:** each `sorry` was replaced by `first | simp | rfl | infer_instance | trivial | (constructor <;> infer_instance) | exact ⟨fun _ _ => Subsingleton.elim _ _⟩ | sorry`. All four theorems still use `sorry`, so none is padding.
- **Headlines:**
  - Stated: K0.A vanishing, (U), ρ=22 for unirational K3 surfaces, and the gluing criterion.
  - Named as not statable in the docstring (`:18–32`): Kählerness, the Hodge diamond, the Picard segment, Ricci-flat metrics, simple connectivity, the cup lattice, the deformation theorems, local and global Torelli, twistor lines, period surjectivity, monodromy, the cone and polarized images, the free involutions, the fixed loci and the period loci. Each lacks analytic carriers at the pins.
  - Treated as supporting results, not headlines: §7.1's discriminant surjectivity, the characteristic-two transvection generation, and H²(T_X)=0.

**Library declarations opened at the pins (46)**
- All 39 library names that the README backticks and `Suggested.lean` does not already use elaborate under `#check @` at the pins. The remaining library names are used by `Suggested.lean`, which elaborates.
- **Tau Ceti, opened:**
  - `Overlattice/Graph.lean`: `:49` (`discriminantGraph`), `:61` (Lagrangian), `:94` (`glueAlongDiscriminant`), `:102` (`_form`), `:112` (even), `:116` (unimodular), `:158` and `:175` (the coordinate spaces meet the glued lattice exactly in the factors), `:337–343` (`exists_eq_glueAlongDiscriminant`, with hypotheses form, containment, even, unimodular, left, right);
  - `Overlattice/Naturality.lean:195` and `:452` (`ofIsotropicSubgroups`, which needs `map … H = H'`);
  - `Overlattice/Isotropic.lean:413` and `:420`;
  - `Overlattice/Basic.lean:131`;
  - `Discriminant/OrthogonalGroup.lean:120`, `:249` and `:278`, with no surjectivity theorem anywhere in Tau Ceti;
  - `Discriminant/Operations.lean:143` and `:334`;
  - `Discriminant/Quadratic.lean:122` and `:184`;
  - `Discriminant/Group.lean:165`;
  - `Scaling.lean:76` and `Dual/Scaling.lean:71`;
  - `FiniteBilinearModule/Quadratic.lean:459` (`neg`);
  - `QuadraticForm/OrthogonalGroup/Basic.lean:977`;
  - `CartanDieudonne/Basic.lean:673` and `CartanDieudonne/SpecialOrthogonal.lean:43, 82, 111`: all carry `[NeZero (2 : K)]`, so neither applies over 𝔽₂, as the README says;
  - `Modules/Differentials/Basic.lean:101`, `Cohomology/Basic.lean:61`, `LineBundle/Class.lean:50`, `Sheaf/ExteriorPower/Basic.lean:66`.
- **Mathlib, opened:**
  - `ZariskisMainTheorem.lean:406`, which matches Stacks 02UP (stacks-02UP line 6305);
  - `Birational/RationalMap.lean:377`, `Birational/Birational.lean:234`, `Morphisms/Smooth.lean:127`, `AffineSpace.lean:49`.

**Cross-roadmap citations resolved (34 ids)**
- **Main at `e9fd8e4`:** no supplier README changed since `35884a8`, the main the previous review read; the only README change is Completed/ConformalMapping, not a supplier. The ids were still re-resolved:
  - SchemeAndStackFoundations 0.3 (`:551`), 1.17 (`:2624`), 1.23 (`:3021`), 2.2 (`:3309`), 2.3 (`:3330`), 2.6 (`:3437`), 2.11 (`:3656`), 2.20 (`:4275`), 3.4 (`:4789`), 4.9 (`:5448`), 4.11 (`:5528`), 4.13 (`:5643`), 5.9 (`:7129`) and 5.10 (`:7175`), with no Enriques ruledness theorem anywhere in it;
  - EtaleCohomologyFoundations 0.9 (`:1120`), F.0.4 (`:248`), F.2.5 (`:613`), F.5 (`:1179`), F.6 (`:1200`) and F.7 (`:1239`);
  - GlobalQuadraticForms 5.5 (`:665`); ModularCurves 2B (`:1243`, the norm functor at its item 1);
  - MorseNovikov N5–N7, which `:176` maps to Layers 5–7: the local index at 5.2, the Lefschetz formula for a closed connected S at `:1131`, Poincaré–Hopf at 7.1;
  - SmoothBundlesConnections B1.5 (`:498`); CharacteristicClasses C1–C7; JacobianChallenge A–D; StableReduction Layers 4–6; AlgebraicCurves Layers 9, 10 and 12; GeometricTopology Layer 1; Completed/HopfRinow Layer 1; DifferentialGeometry Layers 0–3, 5, 8, 9 and 12.1 (`:915`); AlgebraicTopology Stages 1 and 5–7; ComplexKahlerGeometry K4 (`:444–468`).
- **IntegralLattices on main:**
  - The labels 0A–0G and 1A–1F are named at `:455`. 1B is at `:441`, 1E–1F at `:443`, 5F at `:1899`, 5G at `:1915`, 5J at `:1974` and 6A at `:2019`.
  - `:122` hands Nikulin's surjectivity theorems to `IntegralLatticesPartII`, which exists neither on main, nor in an open pull request, nor in the merge order. So the move of the one needed case down into §7.1 is correct, recorded here as a move.
- **Open heads:**
  - ComplexComparisonPartII at `fcf31bc`: C−1.1 (`:993`), C0.1–C0.7 (`:1232–1494`), C1.9 (`:1960`), C2.1–C2.2 (`:2225`, `:2250`), C4.1–C4.4 (`:2661–2724`). C5.4 (`:3700`) states, at `:3992–4002`, the frame-torsor bijection with its tensor, dual and pullback laws, the exponential sequence and δ[L]=c₁. This resolves the move away from the former ComplexKahlerGeometry contract; ComplexComparisonPartII lists K3Surfaces §1.1 as its consumer (`:5290`).
  - IndexTheory at `6d85f5d`: I6 (`:1238`), I7.1–I7.3 (`:1344`, `:1371`, `:1392`), I8 (`:1575`).
  - Unchanged heads: PCurvature §§0.1–0.3 (`:147`, `:176`, `:201`); FourManifolds F7 (Layer 7, `:2869`); NeronModels §5.3e (`:3540`); NeronModelsPartII §6.1 (Castelnuovo–Zariski at `:9847`); AlgebraicModuli 1.1–1.3, 7.3, 7.8 and 8.1–8.3 (`:306–9944`); EnriquesSurfaces at `e852f4d` (consumes K0–K6, K7.A–B and §7.3, `:11`, `:42`, `:687`).

**Overlaps and ownership**
- The overlap tool's leads saying "only #617/#1411/#1797 defines IntegralLattices §0G/§1B/§1E/§5J/§6A" are false: all resolve on main, as above.
- No open pull request changes this roadmap or drops an id it cites.
- Characteristic-two generation by orthogonal transvections: `roadmaps grep` and a search of the pins find no other owner. Completed/OrthogonalSpinGroups has only the transvections of its own setting. So §7.1 owns it.
- `gap:enriques-ruledness` is precise and minimal: no roadmap on main, SchemeAndStackFoundations' open revision, or any other open head states the theorem. The Part II consumes the same contract (`:84`).
- No other `Suggested.lean` declares a `TauCetiRoadmap.K3Surfaces.*` name.
- ComplexKahlerGeometry's open revisions: R01 concerns head `96d5e07`; the other revision has no Pic_hol.

**Sources: the seeded sample of 13 targets.** Every locator was opened in the cached text. Printed pages equal PDF pages, except Rudakov–Šafarevič 1976, where printed = PDF + 1204, and Shen, where printed = PDF + 246.

| Target | Locators opened (source id line) and result |
| --- | --- |
| 0.1 | huybrechts-k3: Def 1.1 and Rem 1.2 p.7 (135, 147); Ex 1.1.3(iv) p.9 (226); Prop 1.2.4 and Rem 1.2.5 p.12 (335, 349); Noether formula §1.2.4 p.13 (373). All match. |
| 0.2 | martin-infinitesimal-automorphisms: Thm D p.3 (126–128); Cor 1.1 p.4 (140); proof p.40, quoting RS83 p.1502 (1713–1716); Ex 5.12 p.36 (1544). rudakov-shafarevich-inseparable: Lemma 1 and Corollary p.1206 (75, 83); Thm 5 p.1216 (440–441); Cor 1 p.1217 (481); the ρ step (489). huybrechts-k3: Prop 9.4.6 p.180 (6797–6798, every p>0); Prop 17.2.7 pp.367–368 (14076, 14090, any characteristic); Prop 11.1.3 p.208 (7879, 7886); Rem 8.2.13 p.151 (5646, 5653); Prop 2.3.10 p.32 (1103). liedtke-surfaces: Thm 4.2 and §4.3 p.20 (718, 726); Thms 4.4 and 4.6 p.21 (755, 770); Thm 6.1 p.25 (934). gounelas-liedtke-symmetric-differentials: Prop 2.2(2) p.6 (253–258, every p>0). stacks-02UP: Lemma 37.44.2 (6305–6307). All match. |
| 1.1 | huybrechts-k3: Prop 1.3.2 p.14 (420); Ex 1.3.3 p.14 (432); exponential sequence §1.3.2 p.15 (452); (3.2) p.16 (498); footnote 9 p.16 (515). All match. |
| 2.1 | huybrechts-k3: Thm 7.3.6 p.131 (4903); Thm 9.4.11 p.183 (6904); Prop 1.3.5 and Rem 1.3.6 p.17 (525, 546). All match. |
| 3.1 | huybrechts-k3: Cor 6.2.7 p.107 (3955); §6.2.4 p.108 (3980). Match. |
| 4.1 | huybrechts-k3: §6.1.1 p.99 (3649); Prop 6.1.5 and Rem 6.1.6 p.101 (3705, 3718); Prop 6.2.8 p.107 (3960); §6.2.5 p.108 (4001); Rem 7.3.8 to Prop 7.3.9 p.133 (4954–4987). All match. |
| 5.1 | huybrechts-k3: Prop 7.3.7 p.132 (4940). Match. |
| 5.2 | huybrechts-hyperkahler-torelli: Prop 3.10 p.10 (375); Lem 3.11 p.11 (417). huybrechts-k3: Prop 7.3.4 and Lem 7.3.5 p.131 (4884–4889); generic twistor line p.130 (4826). All match. |
| 6.1 | huybrechts-k3: Prop 7.2.2 p.129 (4780); Cor 7.5.1 p.135 (5049); Thm 7.5.3 p.135 (5066); §7.5.3 p.136 (5082); §7.5.5 p.138 (5169). huybrechts-hyperkahler-torelli: Prop 4.7 p.14 (527). All match. |
| 6.2 | huybrechts-k3: Thm 8.5.2 p.163 (6152); Rem 6.3.7 p.114 (4232); §6.4 p.115 (4258). All match. |
| 7.1 | huybrechts-k3: §14.0.3(vii) p.284 (10894). gritsenko-hulek-enriques-moduli: p.3 (109–114: D_M≅D_N≅𝔽₂¹⁰, the order of O⁺(𝔽₂¹⁰), surjectivity by Nikulin 3.6.3); p.4 (122–126: extension by Nikulin 1.5.2). char2-orthogonal-involutions: "nonsingular" means s=0 (107); generation by orthogonal transvections except H⊥H over 𝔽₂ (186–188). All match. |
| 7.2 | shen-fried-survey: Assumption 2.1 and (2.7)–(2.8) pp.256–257 (442, 450, 460, 468). artebani-sarti-taki: Thm 3.1 p.10 (497–503). huybrechts-k3: §15.4.3(ii) p.330 (12702). All match. |
| 7.3 | gritsenko-hulek-enriques-moduli: Thm 2.1 and Rem 2.2 p.5 (181, 185); Namikawa Prop 6.2 and (8) p.8 (283, 286). dolgachev-enriques-introduction: §5 p.15 (607). All match. |

**Adversarial table**

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `IsAlgebraicK3` (§0.1) | Fermat quartic in char 3; abelian surface; non-classical Enriques surface in char 2; ℙ²; empty scheme | Quartic: ∂ᵢ=4xᵢ³=xᵢ³, common zero only 0, ω=O(4−4)=O, h¹(O)=0, so it passes. Abelian: ω=O but h¹(O)=2, fails. Non-classical Enriques: ω≅O but h¹(O)=1, fails. ℙ²: ∧²Ω=O(−3)≇O, fails. Empty: not integral, fails. | Sound |
| §0.1 numerics and contraction | K3 against torus; σ=dx∧dy; 2σ in char 2 and 3 | χ(O)=1−0+1=2 and c₂=12·2−0=24; torus 0 and 0. ι_∂x σ=dy, ι_∂y σ=−dx. Char 3: 2·2=1. Char 2: 2σ=0. | Sound |
| `algebraicK3_differential_vanishing` | binder; p=2; probe | `[CharP k p]` with 2<p forces an odd prime. p=2 is excluded although the vanishing holds there (gounelas-liedtke-symmetric-differentials line 258). The probe leaves `sorry`. | Sound |
| Restricted structure (§0.2) | x∂ₓ; t²∂ₜ on ℙ¹; D=t∂ₜ+c·u∂ᵤ; ∂ₓ² over ℚ | (x∂)ᵖxⁿ=nᵖxⁿ≡nxⁿ, against xᵖ∂ for the coefficientwise model. (t²∂)ᵖtⁿ=n(n+1)⋯(n+p−1)tⁿ⁺ᵖ≡0. (cᵖD−cD^[p])/(cᵖ−c)=t∂ₜ. ∂ₓ²(x·x)=2, against the Leibniz value 0. | Sound |
| (U) `unirational_of_nontrivial_vectorField` | p=2; `Nontrivial`; truth; probe | `hp : p.Prime` admits 2. Nontrivial on a Hom group means a nonzero map exists. huybrechts-k3 line 6798 covers every p>0. T_X≅Ω¹ and line 258 of G–L make the hypothesis empty, so (U) is used contrapositively. The probe leaves `sorry`. | Sound |
| (i) `finrank_lineBundleClass_eq_twentyTwo_of_unirational` | Fermat quartic char 3; char 0; ℙ², ℙ¹×ℙ¹; junk value | ρ=22 (huybrechts-k3 line 14090), and 24=1−0+b₂−0+1 gives b₂=22. Char 0: σ would pull back to a nonzero 2-form on a blow-up of ℙ², where h²,⁰=0, so the statement is vacuous. Controls: ranks 1 and 2 = b₂. `finrank` is 0 off finite free, and "=22" excludes that. | Sound |
| §0.2 case (b) and step 3 | Euler count; Martin Ex 5.12 at k=1, 2 | e(Ỹ)=e(Y)−s+Σ(n_r+1)=24+Σn_r against 12χ(O_Ỹ)≤24 forces Σn_r=0. 3^{2k}+3 = 12, 84; 3^{2k−1}+9 = 12, 36; 24 would need 3^m=21 or 15. | Sound |
| §1.1 exact segment | logs ¼,¼,±½; O(±1) on ℙ¹; quantifier against ComplexKahlerGeometry `96d5e07` | δu=¼−½+¼=0 and ¼+½+¼=1, with units i, i, −1 both times. 1+(−1)=0 for O(1)⊗O(−1). The statement ranges over every complex manifold M, and K4.P `:776–778` states the same segment. | R01 |
| §1.1 positive cone | diag(1,−1), κ=(1,0); L⊗L | (κ,κ)=1, (−κ,κ)=−1, (1,1)²=0. c₁ becomes 2h, with square 8d. | Sound |
| §2.1 | Λ; V↦2V; σ=ω_J+iω_K | det=(−1)³=−1, rank 22, τ=(0−48)/3=−16=3−19. c=½. σ²=2−2=0, (σ,σ̄)=4. | Sound |
| §3.1 | ε²=0; h²=4 and 2; 2h | Tangent dimension 20; 20−1=19 for both degrees; (2h)²=8. | Sound |
| §4.1 | B=±I₂, z=(1,i); c=3+4i; ranks 0 and 1 | B(z,z)=1+i²=0, B(z,z̄)=±2. \|c\|²=25 gives 50. Rank 0: no nonzero z; rank 1 with form (1): z²=0 forces z=0. | Sound |
| §§5.1–5.2 | κ²=2; orthonormal a,b,c; (I+J)/√2 | Squares 2 and 8; (−κ,κ)=−2. z=a+ib: z²=1−1=0, B(z,z̄)=2. ((I+J)/√2)²=(−1−1+0)/2=−1. | Sound |
| §§6.1–6.2 | ±φ; root reflection; Riemann–Roch at δ | Orientations differ by (−1)³=−1. s_δ(δ)=−δ. With (x,δ)=1 and x²=2: 2+2−2=2, where the minus-sign formula gives −2. χ(O(δ))=2−1=1. | Sound |
| §7.1 model | ranks, signatures, discriminants, pairings | S: 10, (1,9). T=U⊕S: 12, (2,10). \|A_S\|=\|A_T\|=2¹⁰, so \|A_Λ\|=2²⁰/(2¹⁰)²=1. (e,e)·(f,−f)=0; (e,e)·(f,f)=2. | Sound |
| `gluing_isometry_extension_iff` | ⟨2⟩⊕⟨−2⟩; ⟨4⟩⊕⟨−4⟩ with (g,h)=(±1,±1); ⟨2⟩⊕⟨2⟩; U⊕U; rank 0 | ⟨2⟩⊕⟨−2⟩: ((e+f)/2)²=0, det=−4/4=−1, both sides true for g=−id. ⟨4⟩⊕⟨−4⟩: q_S(e/4)=⅛, q_T(f/4)=−⅛. A script over the carrier {a≡b mod 4} gives, for (−1,1) and (1,−1), commutation false and extension false; for (1,1) and (−1,−1), both true. ⟨2⟩⊕⟨2⟩: ¼+¼=½≠0, so no anti-isometry. U⊕U and rank 0: trivial groups, both sides true. The probe leaves `sorry`. | Sound; R02 (form only) |
| §7.1 classes with Q=1 | E₈ enumerated by script | 240 roots give 120 classes; 2160 norm-4 vectors give 135; 1+120+135=256. 1·136+3·120=496=2⁹−2⁴. (e−f)²=−2, (e+f+y)²=2−4=−2, (e+y)²=−2. | Sound |
| §7.1 order, generation, controls | \|O⁺(10,2)\|; anisotropic plane, H and H⊥H over 𝔽₂; ⟨12⟩; U(2) | 2·2²⁰·31·3·15·63·255=46998591897600=2²¹·3⁵·5²·7·17·31 (gritsenko-hulek line 112). Anisotropic plane: all three vectors have Q=1, O≅S₃ is generated by 3 transvections. H: O has order 2, generated by one. H⊥H: the exception. ⟨12⟩: u²≡1 mod 24 for u=1,5,7,11, while O(⟨12⟩) reaches 1 and 11. U(2): O(q)={id, ē↔f̄}, reached by s_{e−f}. | Sound |
| §7.1 O⁺(T) step | −id_U⊕id_S | Trivial on A_T=A_S because A_U=0; on ⟨u₊,s₊⟩ the determinant is −1, so it exchanges the components. | Sound |
| §7.2 fixed locus | id and equator reflection of S²; antipodal map; double sextic; AST (1,1), (10,8), (10,10), (11,11) | 2=χ(S²); 1−1=0=χ(S¹); antipodal 0, empty. Branch genus 10, χ=−18=2+(1−21). AST: (1,1) gives g=10, k=0, −18=2+1−21; (10,8) gives χ=0; for (10,10) the formula gives g=1 but the locus is empty; (11,11) gives χ=2=2+11−11. | Sound |
| §7.2 isometry class of S | (10,10,0) against ⟨2⟩⊕⟨−2⟩⁹ | a=r gives S=2S*, and S(½) is even unimodular of signature (1,9), so U⊕E₈(−1). Control: q(e/2)=¼ gives δ=1, and the halved form ⟨1⟩⊕⟨−1⟩⁹ is odd. | Sound |
| §7.3 loci and marking group | e−f; e′−f′; e−2f; C−jC; restriction to O⁺(T) | Square and divisibility: −2 and 1; −4 and 2; −4 and 1. (C−jC)²=−4 and (C−jC,x)=2(C,x) on T. For h∈O⁺(T), ḡ=γ⁻¹h̄γ∈O(q_S) is lifted by §7.1. | Sound |
| Downstream consumers | K3SurfacesAndSymplecticBoundedness at `012a76e` | `:409` proves (U) at p=2 again, against README `:1151–1152`. | R03 |

## Not verifiable

- **Rudakov–Shafarevich 1983, p.1502** (the pencil step of sub-target (iv)): uncertified in the manifest. Martin's proof quotes it (martin-infinitesimal-automorphisms line 1714).
- **Nikulin 1983, Theorem 4.2.2:** uncertified. The statement is certified through artebani-sarti-taki lines 497–503.
- **Grove, Theorem 14.16:** behind the Hunnell–Hutchens–Schwartz sentence. Not cached, and not cited by the README.
- **Gap registration:** the board package has no `design/plan.json`, so I could not confirm that `gap:enriques-ruledness` is registered where the intake reads it.

## Source issues

- **Misprint** in char2-orthogonal-involutions at §3, p.6: the source writes that V is not "of the from" H⊥H; it should read "of the form"; affects nothing.
- **Misprint** in gritsenko-hulek-enriques-moduli at §2, p.4: the source calls N an even lattice of "signture" (2,10); it should read "signature"; affects nothing.
