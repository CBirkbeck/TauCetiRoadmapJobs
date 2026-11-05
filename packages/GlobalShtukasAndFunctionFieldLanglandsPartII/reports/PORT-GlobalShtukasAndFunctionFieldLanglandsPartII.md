# PORT-GlobalShtukasAndFunctionFieldLanglandsPartII

Branch `roadmap/global-shtukas-and-function-field-langlands-part-ii`, created from main at `3b51055`. Head commit `1858508` ("GlobalShtukasAndFunctionFieldLanglandsPartII: roadmap (README, Suggested.lean, metadata)"). The diff against `origin/main` touches only `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/` (README.md 1454 lines, Suggested.lean 58 lines, metadata.toml 1 line).

## Build, gate, dependency check

Build (`lake build TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglandsPartII.Suggested`), final run:

```text
✔ [8954/8954] Built TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglandsPartII.Suggested (5.7s)
Build completed successfully (8954 jobs).
```

Warnings: 0. The file declares nothing, so there is no `sorry`. A first build with a bare `import Mathlib` warned that Mathlib is designed for the module system; the file now opens with `module` then `import Mathlib`, as `TauCetiRoadmap/DiagrammaticCoherence/Suggested.lean` on main does, and the warning is gone.

Gate summary line:

```text
gate GlobalShtukasAndFunctionFieldLanglandsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`gate --depcheck … --movable`), complete output:

```text
depcheck: 241 roadmaps, 2313 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Citation resolver on the final README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."

## Draft pull request body

This roadmap continues GlobalShtukasAndFunctionFieldLanglands past V. Lafforgue's semisimple global parameters and the Genestier–Lafforgue local parametrization, to the arithmetic Frobenius weights of parameters of reductive groups over global function fields. It builds geometric local parameters and their pure Weil–Deligne completions, weights of lisse sheaves on curves with propagation of geometricity from a single boundary place, rationality and real parts of Lafforgue's Satake classes, the equal-characteristic Fargues–Scholze parameters with Li-Huerta's uniformization of global shtukas by local shtukas, and the all-prime Kloosterman anchor with its Bessel companion. These feed the Gan–Harris–Sawin purity of discrete series, the Ciubotaru–Harris generic Ramanujan theorem in its central-compact sector, temperedness of elliptic parameters, the discrete-spectrum parametrization interfaces of Xue and Lafforgue–Zhu, and the propagation of complementary series with elimination of extraneous real Satake points through ramified weight arrays. The local spherical unitary dual, its separators and temperedness tests, the Aubert involution and the extraneous-point lists are imported from SmoothRepresentationsOfLocalGroupsPartII. Arthur's global decomposition is kept as a conjectural interface, distinct from the weight theorems that are proved. The headline theorems all need L-parameters of reductive groups, automorphic representations over function fields, lisse sheaves on curves or shtuka stacks, none of which exists at the pins, so `Suggested.lean` declares nothing and its docstring says what each headline lacks.

## Dependencies that are still pull requests

GlobalShtukasAndFunctionFieldLanglands, FunctionFieldArithmetic, SmoothRepresentationsOfLocalGroups, SmoothRepresentationsOfLocalGroupsPartII, ArithmeticGaloisRepresentations, DeligneWeightsAndPurity, PadicDifferentialEquationsAndRigidCohomology, LanglandsParameterStacks, HeckeStacksAndLocalShtukas, MotivesAndAlgebraicCycles, FormalConnectionsOpers, DiamondEtaleCohomology, DiamondSixOperations. On main: ReductiveGroups, ReductiveGroupsPartII, NilpotentOrbits, AffineLieAlgebras, RepresentationTheory (LieHighestWeight), SchemeAndStackFoundations, EtaleCohomologyFoundations. All are earlier than this roadmap (position 346) in `merge-order/ORDER.txt`. KloostermanSheavesAndBesselIsocrystals is named only in Scope as the owner of material this roadmap does not use (see Unresolved).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` declared nothing. Its docstring was rewritten. It now lists ten headline families, each with its README section and the carriers it lacks at the pins. It notes that Tau Ceti's local Weil group `TauCeti.ClassFieldTheory.WeilGroup` exists at the pin but is not enough. The bullets for the local spherical separator theorem and the extraneous-point classification were removed, because those are now SmoothRepresentationsOfLocalGroupsPartII's theorems, not this roadmap's headlines. The weight-recognition statement of §8.0 is a supporting lemma, not a headline. Property A remains named as an auxiliary array statement that is statable on `Finsupp` but is not a headline. Binder audit: there is no declaration, so the `#check @name` comparison is vacuous for this roadmap's names. I ran the same mechanical check on every library declaration the README names, through a temporary build of the module with `#check` lines and three extra Tau Ceti imports, and then reverted the file. All of them elaborate at the pins: `Finsupp.mapDomain`, `Finsupp.sum`, `Finset.sum_comm`, `Finset.sum_eq_single`, `IsNonarchimedeanLocalField`, `Representation`, `AlgebraicGeometry.Scheme`, `TauCeti.ClassFieldTheory.WeilGroup`, `TauCeti.ClassFieldTheory.weilDegree`, `TauCeti.ClassFieldTheory.isOpenEmbedding_inertiaToWeil`, `TauCeti.ClassFieldTheory.weilDegree_eq_ofAdd_one_iff`, `TauCeti.IsSmoothDiscrete` and `HeckeRing.GL2.Newform.satakeParameters`. `weilDegree_eq_ofAdd_one_iff` pins the arithmetic normalization that the README's Tau Ceti contract states. Pins: Mathlib `f6090c7`, Tau Ceti `358314d`.

## Supplier replacements and duplication removals

- **SmoothRepresentationsOfLocalGroupsPartII is now a supplier.** It is an open new-roadmap pull request at position 276, earlier than this roadmap's 346. The package treated it as a later consumer and stated its material here. Read at its head (`b197d70`), its Layers SRU.5–SRU.7 own: real Satake parameters (§5.1); the tempered and generic spherical criteria and principal-series irreducibility (§§5.3–5.5); the generic unitary region, its classification and the characteristic-independent Hecke comparison (§§5.7–5.12, 5.27); half-integral points, the fundamental separators, the local generic temperedness test and the noncentral G₂ witness (§§5.23–5.26); nonsplit transfer, the nonsplit test and the PSU(2n+1) residual (§§6.1–6.4); and the Aubert involution, Kazhdan–Lusztig parameters, strata, complementary series, centralizer reduction, the extraneous lists and the E₈ 4A₁ exclusion (§§7.1–7.13).
  - Deleted from §5.1: the local theorem paragraph (unitarity and genericity definitions, graded-Hecke identification, the split and nonsplit separator theorems, the PSU(2n+1) residual), the irreducibility, Hermitian-deformation and affine/graded-comparison paragraph, two local API bullets and the classification citations.
  - Kept in §5.1, as this roadmap's own targets: the global test family T(G) with its L-group finite induction and Weil-restriction induction, and the reduction from an unramified semisimple group to its absolutely simple adjoint factors. That reduction covers products and Weil restriction, the f_j-th power matching of Satake classes and integer weights relative to q_F against q_(L_j); SmoothRepresentationsOfLocalGroupsPartII has none of it.
  - Deleted from §8.0: the definition and properties of D_G and AZ, Kazhdan–Lusztig triples, strata and centralizer reduction, the classical r_j/ε_j formula, the seven exceptional points and the 4A₁ exclusion. The Checks that only tested those imported objects were dropped; the same Checks appear in SmoothRepresentationsOfLocalGroupsPartII §7.1. These are the GL₂ D_G computation, the torus sign and the noncentral G₂ stratum.
  - Kept in §8.0, now titled "Weight recognition of real Satake classes": the weight multiplicity function n_(ν,τ) and the recognition theorem (Ciubotaru–Harris Proposition 10.2), which SmoothRepresentationsOfLocalGroupsPartII does not state, and the one-line target L_F(AZ(π)) = L_F(π) for this roadmap's L_F.
  - §§2.3, 5.4, 5.5, 6.2, 8.1, 8.2, 8.5, 8.6 and the Layer 5/8 dependency lists cite the imported sections. A new supplier contract "From TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII" records exactly what is consumed. The references barbasch-spherical, barbasch-moy-unitarity, barbasch-moy-whittaker, barbasch-ciubotaru-E, ciubotaru-F4, ciubotaru-E6, tadic-gl and aubert-duality were removed: nothing here cites them any more, and SmoothRepresentationsOfLocalGroupsPartII carries them.
  - Its section numbers are written `SmoothRepresentationsOfLocalGroupsPartII §5.24` (its headings are `5.24` inside "Layer SRU.5"), always with the roadmap name and, at first use, the target id. The resolver accepts this form and rejected `§SRU.5.24`.
- **PadicDifferentialEquationsAndRigidCohomology §RD.6.97, item 3**, now proves André's theorem: a solvable differential module with algebraic-number coefficients, meromorphic at infinity and analytic on the exterior annulus, has largest p-adic break at most its largest formal slope. That is the declared gap `formal-to-differential-maximal-slope`. The gap paragraph was deleted; §4.0, its Needs line and the contract cite RD.6.97 instead (RD.1.16 dropped, RD.6.94–RD.6.97 added). RD.4.58–RD.4.59 (de Rham–rigid specialization and the forget-supports square, Xu–Zhu §2.2) were added to the contract as the general input under the still-open `rigid-middle-extension-specialization` gap. Fifteen gaps remain, unchanged in wording.
- **Tau Ceti contract**: added `TauCeti.ClassFieldTheory.WeilGroup` and `weilDegree` (TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean, Topology.lean) as the native W_F for every `IsNonarchimedeanLocalField`, which includes k((t)). The contract records that the degree is arithmetic, so the README's geometric degree is its negative.
- **Stale labels**: coefficient change in SmoothRepresentationsOfLocalGroups is §SR.0.4 (*coefficient-change*), not §SR.0.2; this is fixed in Scope, the contract, §3.5, §3.7 and the Layer 3 dependencies. The sentence "§SR.5.2 owns only the Zelevinsky involution" was wrong (the involution is §SR.5.3) and is gone with the Aubert material. All other cited labels were checked against the supplier at its current head or on main:
  - GlobalShtukasAndFunctionFieldLanglands: 1.4, 1.9–1.14, 2.1–2.5, 2.9–2.10, 3.6, 3.10, 3.12, 4.8, 4.12, 5.3–5.10, 6.1–6.2, 7.6–7.9.
  - FunctionFieldArithmetic: 5.8, 6.1–6.6.
  - SmoothRepresentationsOfLocalGroups: SR.0.2, SR.0.4, SR.1.3–SR.1.5, SR.2.2–SR.2.3, SR.3.1–SR.3.4, SR.4.1–SR.4.2, SR.5.2.
  - ArithmeticGaloisRepresentations: 2.6, 3.1–3.4.
  - DeligneWeightsAndPurity: 0.1–0.19, 5.2–5.12, 7.8–7.9, 8.5, 8.17–8.18.
  - LanglandsParameterStacks: 0.1–0.4, 1.13–1.15, 2.5, 2.15, 3.2–3.6, 3.9.
  - HeckeStacksAndLocalShtukas: HS0.1–HS0.4, HS1, HS2.9, HS3.1–HS3.4, HS4.1, HS4.7.
  - MotivesAndAlgebraicCycles: 6.3.
  - FormalConnectionsOpers: F4, F5, F8.4.
  - DiamondEtaleCohomology: Layer C0.
  - DiamondSixOperations: S1.2, S1.5, S2.1–S2.4.
  - AffineLieAlgebras: A7, A8.
  - NilpotentOrbits: N0–N2, with items 1, 2 and 4 of N2.
  - ReductiveGroups: 10A, 10B.
  - ReductiveGroupsPartII: RG2.3–RG2.5, RG2.5.1, RG2.5.2.
  - LieHighestWeight: Layers 0 and 6.
  - SchemeAndStackFoundations: Layers 1–2.
  - EtaleCohomologyFoundations: F.0–F.4.
  - PadicDifferentialEquationsAndRigidCohomology: every RD label cited.
- **Direction of supply**: the old Downstream consumers section named SmoothRepresentationsOfLocalGroupsPartII and LieHighestWeightPartII as consumers, and Scope said KloostermanSheavesAndBesselIsocrystals builds on §4.0. All three are earlier in the merge order, so those claims pointed upward. They were removed. Downstream consumers now lists the exported results. No roadmap later in the order cites this one; only the parent and SmoothRepresentationsOfLocalGroupsPartII name it, both as the consumer.
- **Duplication sweep** by object, over main and the 456 open roadmap pull requests through `roadmaps grep`. Search terms: Ciubotaru, Li-Huerta, Gan–Harris–Sawin, Lafforgue–Zhu, Xue, Beuzart-Plessis, Property A, extraneous, Kloosterman, Bessel, Frenkel–Gross, Heinloth–Ngô–Yun, Sawin–Templier.
  - SmoothRepresentationsOfLocalGroupsPartII and PadicDifferentialEquationsAndRigidCohomology overlap, as above.
  - CharacterSumsOverFiniteFields and CongruenceSpectralGap concern scalar Kloosterman sums.
  - GanGrossPrasadUnitaryGroups and AutomorphicFormsOnReductiveGroups cite Xue and Beuzart-Plessis for other theorems.
  - The parent's §§6.2 and 7.9 do not state this roadmap's results.
  - No other overlap.
- Ownership against open pull requests was checked: the brief gave their heads, and the sweep above used them.

## Review notes applied

The accepted review (`REV-PKG-…~4`) had four P3 notes:

- F01: the zhu-fg locators "§§3.4–4.2, Propositions 14–15 and Lemma 16, pp. 17–19, zhu-fg line 748, 789, 838" were added to the localization block and to References.
- F02: `varpi(0)` is now `ϖ(0)`.
- F03: the xz References entry now reads §§4.3.4–4.3.6, pp. 47–49.
- F04 is superseded. It asked Scope to say that KB.1–KB.4 import §4.0, on the basis that KB came after this roadmap (259 against 243). The current order lists KB at 345, before this roadmap at 346, so that sentence would claim an upward consumer. Scope now only says that the Newton polygons, monodromy classification, functoriality and classical and hypergeometric realizations of Bessel F-isocrystals belong to KloostermanSheavesAndBesselIsocrystals (Layers KB.5–KB.11) and are not used here.

The red-team round 2 repairs were already in the package (§5.1 generic hypothesis, LanglandsParameterStacks labels, primary classification locators) and are preserved or carried over to SmoothRepresentationsOfLocalGroupsPartII.

## Fixes a mathematician would flag

1. The classical extraneous formula in §8.0 put the residual shift along "the terminal fundamental coweight ω_j" of the orthogonal multiplicity factor. For a factor so(4) (r_j = 4) that coweight is ¼(ε₁±ε₂). Its standard pairings are ±¼ and ±¾, so the point is not geometric and not extraneous. The correct direction is ε_⌊r/2⌋; for Sp₈ and the orbit (2,2,2,2) this gives (0,½,½,1), with standard profile n(2)=1 against 0 at the central point. The formula is now SmoothRepresentationsOfLocalGroupsPartII §7.10, which has this correction, and §8.5 states the direction.
2. The §8.0 API now restricts Σ_i n_(ν,τ)(i) = dim τ and the convolution law to geometric ν. A new negative-control Check shows why: at ν=(¼,−¼) in dual SL₂ the standard pairings are ±½, so n is the zero function although dim = 2.
3. In §5.1 the combined reduction ("half-integrality for every member of T(G) forces ν=0") is now stated for adjoint G, and for general G only through the spherical-isogeny-transfer contract, as §5.4 already uses it.
4. The recognition statement now names its setting: G unramified, hence quasi-split, with W_rel = W^Fr acting on (t̂_ℝ)^Fr. The proof route says why W-conjugacy of Fr-fixed real parts is W^Fr-conjugacy (the Fr-fixed dominant chamber is a fundamental domain).
5. The Tau Ceti Weil group claim was checked at the pin. The topology is the Weil topology: Hausdorff, a group topology, with inertia open. Local compactness is not an instance at the pin, so the README does not claim it.
6. New Checks:
   - §5.1: PGL₂×PGL₂ with 1⊗π₂ is unitary but not generic, so a genericity test on one factor would leave the real part (½,−½).
   - §5.1: PSU₃, whose separator would be the spin representation of Spin₃, which does not occur in any representation of SL₃.
   - §8.0: the D₄ very-even pair ν=½(1,1,1,1) and ν′=½(1,1,1,−1). They have equal vector profiles (4 at ±1) but half-spin profiles 1,6,1 at 2,0,−2 and 4,4 at ±1. This shows recognition needs every representation.

## Adversarial pass

Weights are 2 log_q|λ| for geometric Frobenius. Scripts are in the job's scratch directory (`bin/profiles.py`, `bin/propA.py`, both run with `python3 -I`).

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Conventions (Tate, degree, N) | q=4 Tate line and inverse; degree-two place; r=diag(1,4), Ne₁=e₀ | 1/4 ↦ −2, 4 ↦ 2; 2 at q=4 and 4 at q=16 both weight 1.0; rNr⁻¹e₁ = q⁻¹e₀, so N maps weight 2 to 0 | pass |
| Tau Ceti `weilDegree` normalization | `weilDegree_eq_ofAdd_one_iff` at the pin | degree 1 ⇔ arithmetic Frobenius lift, so geometric Frobenius has degree −1 | contract states the sign |
| 0.1 geometric parameter | G_m at q=4: values 2, 3, e^i; q=5: (3+4i)/5; GL₂ diag(2,3) | weights 1, 1.585…, transcendental, |·|=1.0, {1, 1.585…} | pass; non-examples fail |
| 0.2 realization independence | S₃ standard rep, inertia C₃, q=5 and q=4; SL₂ adjoint | Frobenius eigenvalues 1, −1, weights 0, 0; at q=5 Frobenius inverts C₃ (5≡2 mod 3), at q=4 4≡1; adjoint q, 1, q⁻¹ | pass |
| 0.3 pure WD | Sp(2) diag(1,q); same with N=0; Salem unit value | weights 0, 2 joined by N: pure of weight 1; N=0 not pure; real conjugate 1.7220838057, unit-circle pair modulus 1.0 | pass |
| 0.4 uniqueness | GL₂ diag(2,½) and diag(1,16) at q=4 | ratio 4=q: N can join, weights ±1; ratio 16=q²: N=0 forced, adjoint 16 unbounded, no completion | pass |
| 1.1 twist classes | 𝔽₂ with ℓ=7: 1+i, 1+2i; 3 over 𝔽₄ | |1+i|²=2, weight 1; |1+2i|²=5, log₂5=2.32 ∉ ℤ; both 7-adic units (7 inert in ℤ[i]); 3: 1.585 | pass |
| 1.2 boundary propagation | Kl_n; constant 3 on G_m/𝔽₄ | one graded piece of weight n−1; 3 fails at every place | pass; anchor needed |
| 1.3 irreducible purity | SL₂, χ⊕χ⁻¹, χ(Frob)=2, q=4; diag(2,½) | weights ±1 in a Borel; the stabilizer of the weight filtration is the lower Borel | pass; irreducibility needed |
| 1.4 local purity | PGL₂ cuspidal with Steinberg at z | Sp(2) twisted: weights −1, 1, N≠0 | pass |
| 2.1 occurrence | multiplicity L², ε²=0; G_m, ξ=3^deg, ℓ=5 | generalized block dim 2, ordinary eigenspace dim 1; 3^d≠1 on Ξ | pass |
| 2.2 rationality | PGL₂, a_w=5, q=4 | α+α⁻¹=5/2 gives α=2, algebraic | pass |
| 2.3 real part | Res_(L/F)PGL₂, w inert; PGL₂ trivial | swap eigenvalues 1,1,−1,−1, ν=0; ν=½α̂, weights ±1 | pass |
| 3.0 local excursion | G=1, (a,b) = (1,1), (2,1), (0,b); G_m value a | ab = 1, 2, 0; φ(Frob)=a, 2 ≠ ½ | pass |
| 3.1 uniformization | GL₁, d=1, deg v = 1 and 2; 𝔽₁₆, α⁴+α+1=0; s=3, κ=2, r=2 | degrees 1 and 2; α⁴ = α+1 ≠ α, α¹⁶ = α, (α+1)⁴ = α (computed); bounds 3→5→7 | pass |
| 3.2 Li-Huerta | unramified rank two, q=4 | pair (2,½), trace 5/2 | pass |
| 3.3 normal image | relative Frobenius of SL₂; SL₂→PGL₂ | α ↦ pα, not a root, so excluded; μ₂ central, admitted | pass |
| 3.4 geometric representations | norm-one torus; value 3 at q=4 | swap eigenvalues ±1, weight 0; 1.585 | pass |
| 3.5 conjugates | 1±2i at q=5; √5 ↦ −√5 | |·|=√5, weight 1; pairs (±√5, ±1/√5), weights ±1 | pass |
| 3.6 tori | unramified quadratic, q_F=4: χ(ϖ_E)=4, 2; E=F(t^(1/p)) | weight 2log₁₆4 = 1.0; √2 has weight 0.5 relative to 4; unipotent part of dimension p−1 | pass |
| 3.7 stability | principal series with value 2, q=4 | constituents 1 and St, pair (2,½) | pass |
| 3.8 central characters | GL_n St_n; μ_p ⊂ SL_p | trivial; μ_p(F)=1, not a torus | pass |
| 4.0 invariant parameter | A₁, p=5, λ=−π; A₂ | c=π², candidate 2π² differs by π²; −π³ vs +π³ differ by 2π³ | pass |
| 4.0 oper space | A₁: c=0, c≠0, x²E | slopes 0, ½, 1 against bound ½ | pass |
| 4.0 localization | η=λt | ∂_t e = −λe, −∂_t acts by λ; λ=−π gives +π, −π | pass |
| 4.0 rigidity / transfer | A₁: r=1, h=2; G₂: r=2, h=6; A₄ at p=2; L-function at q=4 | r(h+1)/h = 1.5 and 2.333 give Irr ≤ 1 and ≤ 2; invariants (3−3+0)/12 = 0.0; L(T)=1−T/4 | pass; slope bound now cited from RD.6.97 |
| 4.1 ι-tempered | Salem ζ; (3+4i)/5; G_m with ζ₃ | moduli 1 and 1.7221; 1.0; ζ₃, ζ₃² modulus 1 | pass |
| 4.2 globalization | G_m, ξ=1; ξ=3^deg | Π=1 unique, adjoint 0; infinite order, so excluded | pass |
| 4.3 pseudo-globalization | PGL₂ Euler–Poincaré pseudo-coefficient | traces St 1, trivial −1, principal series 0 | pass |
| 4.4 discrete-series parameters | GL₂ St⊗χ, χ(ϖ)=3, q=4 | pair (6, 1.5), det 9, ratio 4.0 (computed) | pass |
| 4.5–4.7 purity, geometricity, conjugates | PGL₂ St | weights ±1, pure of weight 0; conjugates remain discrete series | pass |
| 4.8 embedding independence | unramified, real part 0, Weil-number eigenvalues | tempered at every ι | pass |
| 5.1 T(G) | PGL₂ ½ω; PSp₄ ν=(½,0); PSO₈; PGL₂×PGL₃; Res PGL₂ | ¼; vector ½,−½,0,0,0 against spin ±¼ (×2); 1,6,1 vs 4,4; ±¼ excluded; ±q_F^(±1/4) has weight 0.5, while q_L^(1/4) measured against q_F gives 1.0 (computed) | pass |
| 5.1 product reduction (kept) | PGL₂×PGL₂ with 1⊗π₂; non-adjoint G | unitary, not generic, real part (½,−½) on factor 1; needs the isogeny transfer | statement qualified for non-adjoint G; Check added |
| 5.1 inseparable isogeny | 𝔽₂((t)) and 𝔽₃((t)) | classes 1+t^(2n+1) distinct, index infinite; index 4 | pass |
| 5.2 adjoint lift | ±I in SL₂; p=2 against odd p | traces 2, −2, same real part 0; H²=0 in char 2, Br[2] for odd p | pass |
| 5.3 integrality | constant 3 at q=4 | log₂3 = 1.585 ∉ ℤ | pass; anchor needed |
| 5.4 generic Ramanujan | G₂, s_c (a,b) ↦ (−1)^a, ν=½ω₂, q=4 | coroot values −1, 2, −2, 2, −2, −4 (computed): none is 4 or ¼; without s_c the highest coroot gives 4 | pass; central-compact hypothesis essential |
| 5.5 genericity | PGL₂ tempered spherical | irreducible unitary principal series, generic | pass |
| 6.1 elliptic | GL₂ χ₁⊕χ₂; Klein four in PGL₂; torus | S_σ/G_m of dim 1; 𝒮_σ = (ℤ/2)²; quotient trivial | pass |
| 6.2 elliptic temperedness | PGL₂ elliptic; GL₂ σ⊗|·|^(1/2) | standard weights 0; weights 1, 1 (not semisimple G) | pass |
| 6.3 Lafforgue–Zhu | GL_r, one moving standard factor | W^(G_m) = 0 | pass |
| 6.4–6.5 realizability | constant 3, ℓ=5; quadratic cover; zero sheaf | 2log₄3 = 1.585; eigenvalues ±1; empty stack | pass |
| 7.1–7.2 Arthur data | ψ=1⊠std at q_w=4; trivial SL₂ with diag(4,¼); ±I | (2,½), weights ±1; weights ±2, unbounded; n(0)=2, traces ±2 | pass |
| 7.3–7.4 discrete hypotheses | PGL₂ trivial; χ∘det; anisotropic G | diag(q^(1/2), q^(−1/2)); χ²=1; finite-dimensional | pass |
| 7.5 rationality | [[0,−1],[1,0]] | X²+1, eigenvalues ±i over ℚ(i) | pass |
| 7.6 Xue quotients | ℚ̄_ℓ[T]/(T−2) and /(T−2)² | dims 1 and 2, with T−2 nilpotent nonzero | pass |
| 8.0 n_(ν,τ) and recognition (new text) | zero ν; D₄ ν, ν′; Sp₆ points; ν=(¼,−¼); q_v=4 vs q_w=16 | full weight 0; vector profiles both 4 at ±1, half-spin 1,6,1 vs 4,4; 3,3 vs 1,1,2,1,1, norms ¾ and 5/4; zero function; adjoint eigenvalues 4 and 16, profiles 1,1,1 | API restricted to geometric ν; Checks added |
| 8.0 L_F(AZ(π)) = L_F(π) | PGL₂ 1 and St; anisotropic G | common pair (2,½), monodromy ranks 0 and 1; D_G = id | pass |
| 8.1 weight pattern | PGL₂ trivial; complementary diag(q^(1/4), q^(−1/4)) | n(±1)=1; no integer pattern | pass |
| 8.2 propagation | Sp₆ orbit (2,2,2); O∨=0 | (½,½,½) or (0,½,1); 0 at every split w | pass |
| 8.3 arrays | a(0,±1)=1; a(−2,−2)=3 | r = 2δ₀, c = δ₁+δ₋₁; margins 3 at −2 | pass |
| 8.4 Property A | 300 000 random symmetric arrays on rows −3..3, offsets 0..3; a(1,0)=1; signed a(0,±1)=−1 | 0 violations, 0 arrays with r=c that are not diagonal; col(1)=0 < row(1)=1; col(1)=−1 < 0 | pass; symmetry and ℕ needed |
| 8.5 exceptional comparisons | neutral h computed from the Levi (Bourbaki coordinates) against the stated point x | F₄ B₃: h has the profile of (5/2,½,½,½), 10:1,9:0,8:1 vs 10:1,9:0,8:2, i₀=8 (norms 7, 15/2); F₄ Ã₁+A₁: max 3 vs 4:1, i₀=4; E₇ D₅(a₁)+A₁: 10:1,9:0 vs 10:1,9:1, i₀=9; E₈ D₆: 18:1,16:1 vs 18:1,16:2, i₀=16; A₆: max 12 vs 13:1; A₄+A₂: max 8 vs 9:1; A₂+2A₁: max 4 vs 5:1 | all seven reproduce |
| 8.5 classical comparisons | Sp₆ (2,2,2); Sp₈ (2,2,2,2) with r=4; Spin₁₂ (3³,1³), ε₃=ε₁=1 | i₀=2, 1>0; (0,½,½,1) gives n(2)=1>0; profile 3:1, 2:1, 1:3, 0:2 vs central 2:3, 0:6, i₀=3, 1>0 | pass with the ε_⌊r/2⌋ shift; fails with the coweight ¼(ε₁±ε₂) (fix 1) |
| 8.6 elimination | O∨=0, supercuspidal σ_u | AZ=id, real part 0 | pass |

Context: there is no `variable` block or declaration, so no standing hypothesis can be lost.

Generality: the README's local statements are over every local function field. That matches the imported results, whose characteristic-free Hecke comparison is SmoothRepresentationsOfLocalGroupsPartII §5.27.

## Unresolved

1. **KloostermanSheavesAndBesselIsocrystals.** It exists only as a board design (`packages/KloostermanSheavesAndBesselIsocrystals/design/README.md`), with no package README and on neither main nor an open pull request. The merge order lists it at 345, just before this roadmap at 346. Its KB.1–KB.4 plan the same objects as §4.0: the Kloosterman eigenobject, the Frenkel–Gross connection, the invariant parameter, the oper slice, quantized Hitchin, Zhu's identification, the de Rham–rigid comparison and the Bessel F-isocrystal. The design does not cite this roadmap.
   - Decision taken: §4.0 is kept here, as the accepted review ruled. A design cannot be verified as a supplier at a head, and §4.2 needs the anchor. The upward consumer sentence was removed.
   - Still open: when KB's package is written, either KB imports §4.0 (this roadmap then moves before KB) or KB owns these objects and §4.0 becomes citations.
   - Scope names KB, with its Layers KB.5–KB.11, as the owner of material not used here. If the dependency tooling counts that as a supplier edge, it keeps this roadmap after KB; dropping the name would remove the edge.
2. **LieHighestWeightPartII.** It is also design-only, at position 231. Its N3 (exceptional appendix profiles) and N5 (geometric weight patterns, character separation of Weyl orbits, recognition of the positive real part) overlap §8.0's recognition theorem and the `exceptional-named-orbit-profiles` gap, which is addressed to NilpotentOrbits. SmoothRepresentationsOfLocalGroupsPartII already cites LieHighestWeightPartII N0–N5. Kept here for the same reason as item 1.
3. **Gap addressees.** `tempered-spherical-generic` and `spherical-isogeny-transfer` are still addressed to SmoothRepresentationsOfLocalGroups, as accepted. SmoothRepresentationsOfLocalGroupsPartII, now an earlier supplier, owns the adjacent generic/sign adapters (§5.27) and the Sp/PSp full-isogeny adapter (§6.2). It may be the better addressee; I did not change the accepted gap suppliers.
4. **Fifteen declared gaps remain**: function-field-simple-trace-formula, poincare-series-globalization, discrete-series-pseudo-coefficients, elliptic-orthogonality-open-subgroups, discrete-series-number-field-model, reductive-central-reduction, spherical-isogeny-transfer, tempered-spherical-generic, parameter-square-root-transport, stack-integer-weights, satake-constant-realization, rigid-middle-extension-specialization, pure-isocrystal-geometric-semisimplicity, normal-image-l-homomorphisms, exceptional-named-orbit-profiles. Greps of the current supplier heads found none of them supplied. `formal-to-differential-maximal-slope` is closed by RD.6.97. `design/plan.json` on the board still lists it; the worker may want to drop it there.
5. Thirteen suppliers are open pull requests. Their section numbers were verified at the heads indexed 2026-11-05T21:05:19Z and can move before merge.

No suspicious instructions were found in the materials read.


Pull request: #1845 (roadmap/global-shtukas-and-function-field-langlands-part-ii at 1858508)
