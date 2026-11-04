# Review of DerivedModuleAlgebra (pull request #1701 at 5f638fa)

**Verdict:** needs changes

Three findings: one P2 and two P3. The supplied gate passes. The blocker is an omitted statable headline; the other findings concern internal build order and source locators. These repairs preserve the roadmap's scope.

## R01 (P2) — State homogeneous Roby representability on the native carriers

Location: `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean:15`, “the homogeneous divided-power piece and its universal polynomial law have no native carrier at the pin”; `TauCetiRoadmap/DerivedModuleAlgebra/README.md:176`.

Claim: homogeneous Roby representability cannot be stated at these pins.

Witness: `Mathlib/RingTheory/PolynomialLaw/Basic.lean:77` supplies the law carrier; `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean:127` supplies its generators. The README's homogeneous piece is an ordinary submodule span. The native signature below elaborates with one expected `sorry` warning.

Repair: add the homogeneous-piece and homogeneity definitions with real bodies, and state representability with the universal law existentially quantified. Include its scalar-extension normalization and unique factorization on **all** scalar extensions. Remove this headline from the unavailable list. The universal law need not be constructed as admitted data before stating its existence. This is the general theorem for arbitrary modules, not a free-module substitute.

Here is the tested signature, using only `import Mathlib`, the TensorProduct/BigOperators scopes and a noncomputable section. Names are illustrative:

```lean
universe u
variable (A M : Type u) [CommRing A] [AddCommGroup M] [Module A M]

def Piece (d : ℕ) : Submodule A (DividedPowerAlgebra A M) :=
  Submodule.span A {z | ∃ (r : ℕ) (n : Fin r → ℕ) (m : Fin r → M),
    (∑ j, n j) = d ∧ z = ∏ j, DividedPowerAlgebra.dp A (n j) (m j)}

def Homogeneous {N : Type u} [AddCommMonoid N] [Module A N]
    (d : ℕ) (f : M →ₚₗ[A] N) : Prop :=
  ∀ (S : Type u) [CommRing S] [Algebra A S] (s : S) (x : S ⊗[A] M),
    f.toFun' S (s • x) = s ^ d • f.toFun' S x

theorem robyRepresentability (d : ℕ) :
    ∃ γ : M →ₚₗ[A] Piece A M d,
      Homogeneous A M d γ ∧
      (∀ m, (γ.ground m).val = DividedPowerAlgebra.dp A d m) ∧
      (∀ (S : Type u) [CommRing S] [Algebra A S] (r : ℕ)
          (s : Fin r → S) (m : Fin r → M),
        TensorProduct.map (LinearMap.id : S →ₗ[A] S) (Piece A M d).subtype
          (γ.toFun' S (∑ j, s j ⊗ₜ[A] m j)) =
        ∑ n ∈ Finset.piAntidiag (Finset.univ : Finset (Fin r)) d,
          (∏ j, s j ^ n j) ⊗ₜ[A] (∏ j, DividedPowerAlgebra.dp A (n j) (m j))) ∧
      ∀ (N : Type u) [AddCommGroup N] [Module A N] (f : M →ₚₗ[A] N),
        Homogeneous A M d f →
        ∃! l : Piece A M d →ₗ[A] N,
          ∀ (S : Type u) [CommRing S] [Algebra A S] (x : S ⊗[A] M),
            (TensorProduct.map (LinearMap.id : S →ₗ[A] S) l) (γ.toFun' S x) =
              f.toFun' S x := by
  sorry
```

The unique-factorization statement expresses representability; linearity of its correspondence follows because postcomposition is linear. Its coefficient formula also fixes the natural universal law, rather than unrelated representing choices.

Test of repair: degrees zero and one give constant-one and identity laws; for a rank-two module the coefficient of `UV` in degree two is `γ₁(x)γ₁(y)`. For `M = ℤ/2`, the degree-two representing module is `ℤ/4`, not `Sym²(M) = ℤ/2`. Over `F₂`, the nonzero degree-three law `x²y−xy²` has zero ground values but value `T²−T` at `(T,1)`; scalar-extension factorization retains it. Roby Theorem IV.1, printed pp.266–267, supports precisely arbitrary modules (Roby line 1970).

The previous review's R06 requested the docstring exclusion, and this head fulfilled that request. This finding rests on the new successful native-carrier probe, including the full coefficient normalization; it corrects that earlier feasibility assessment. No repair report marking this issue “not actionable in this package” was supplied.

## R02 (P3) — Supply convergence before using the diagonal spectral sequence

Location: `TauCetiRoadmap/DerivedModuleAlgebra/README.md:813`, “the first-quadrant spectral sequence of the double complex abuts to diagonal homology”; lines 1114–1115 and 1127–1131; the convergence construction is §S.1, line 2167, in Layer 6.

Claim: the earlier layers can assert the abutting spectral sequence using their listed earlier inputs. Their Needs lists supply totalization and diagonal comparison, but not the spectral sequence with convergence and its filtration.

Witness: §S.1 at lines 2191–2192 explicitly makes the abutment a construction target because Mathlib supplies only pages. §0.2.2's Needs list at 816–817 and §0.9's at 1127–1128 do not supply this construction.

Repair: move the general first-quadrant spectral-sequence construction, including its homological reindexing, before its first use in §0.2.2, and cite it in both Needs lists. Its stated inputs are Mathlib spectral objects, homology, cones and totalization, so this move needs no later completion or Matlis layer. Alternatively move the spectral-sequence clauses to a later application section, retaining only the chain-homotopy diagonal comparison in §0.2.2. Preserve the full abutment and filtration, not just a list of pages. Also list §0.9 in §0.10's Needs line for its expressly invoked derived-pushout clause.

Test of repair: take free rank-one entries at `(0,1),(1,0),(1,1),(2,0)`, with `d′a=c`, `d″b=c`, `d′b=d` and all other maps zero. The total differential is the invertible matrix `[[1,1],[0,1]]`, so total cohomology is zero. Yet `E₂` has two copies of the coefficient ring, at `(0,1)` and `(2,0)`, killed by `d₂ = −id` with these choices. Supplying the convergence theorem before transporting along the diagonal comparison gives `E∞ = 0 = H(Tot)`, over ℤ and F₂ alike. A totalization equivalence by itself does not construct this page-to-abutment assertion.

This is a local build-order/Needs defect, not an unowned construction or an upward roadmap edge: §S.1 already owns the theorem. The mechanical supplier check passes.

## R03 (P3) — Correct three remaining source locators

Locations: `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1037`, “Lemma 2.3, Tag 0GPT, p.3”; line 1148, “Remark 6.3 … gives the comparison map outside the Tor-independent range”; `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean:222`, “Lemma 4.3, p. 221”.

Claim: these locators identify the stated classification, general comparison and flatness assertion.

Witness: StacksDefos line 161 puts Lemma 2.3 on p.4. StacksCt line 529 starts a special null-homotopy remark, assuming a factorization through B. BMS19 line 866 is **Remark** 4.3, printed p.220, about bounded-torsion amplitude.

Repair:

- Cite StacksDefos Lemma 2.3, Tag 0GPT, **p.4**, for Ext¹ classification.
- Cite the opening of StacksCt §6, Tag 08QL, pp.11–12 (StacksCt line 455), for functoriality for an arbitrary square; retain Lemma 6.2, Tag 08QQ, p.12 for Tor-independent base change. Remark 6.3, Tag 08SB, is the special factorization/null-homotopy statement.
- Replace “BMS19, Lemma 4.3” by Definition 4.1, p.220, together with the ordinary flat-base-change/Tor argument. Explain that the arbitrary-ideal module statement is that argument's general form; BMS19 states its p-complete framework. Likewise change README line 1815's blanket “Lemmas 4.3–4.8” to the actual relevant numbered results, especially Lemmas 4.4–4.7 and Corollary 4.8.

Test of repair: `Exal_ℤ(F₃,F₃) = F₃`; the ordinary self-base-change of `ℤ → F₂` has relative cotangent zero but base-changed original cotangent `F₂[1]`, with `Tor₁ = F₂`; a flat ℤ-module ℤ has zero positive Tor and reduction F₂. The corrected references support the applicable assertions without changing those values.

## Verified sound

Both complete files were reviewed: 2324 README lines and 351 Lean lines. The normative README and CONTRIBUTING were read, and the main AlgebraicTopology and EnhancedDerivedSheaves roadmaps were used for shape and ownership comparisons. This is an amendment of the existing DerivedModuleAlgebra roadmap, not a competing new roadmap. The worktree head matches the requested commit; the PR diff outside this folder is empty. No PR file was changed.

**Previous findings, checked before the full pass.** Quotes in this table are from the present head.

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01: duplicate generic towers | README:18–24: “The generic module-tower theory belongs to … AlgebraicTopology, Stage 6, item 0”; §1.1 adds localization and exact-functor comparison. | Repaired. The supplier contract at line 56 imports the difference map, ML, Milnor, cone, cofinal and homotopy-square operations; their repeated Lean declarations are gone. |
| R02: omitted K-flat replacement | Suggested:103–114: “Every unbounded module complex has a termwise flat K-flat replacement”. | Repaired. The predicate tests tensor with every acyclic complex, and the theorem quantifies over unbounded complexes. |
| R03: omitted simplicial tensor comparison | Suggested:133–150 existentially binds one family `e`, with both naturality equations and the signed two-shuffle component. | Repaired. Both maps belong to native `HomotopyEquiv`; the degree-zero component is the identity. |
| R04: Check padding | The characteristic-p ground-zero law and characteristic-two degree-two detector remain README Checks; neither is a Lean theorem. | Repaired. Their unused predicate/example scaffolding is removed too. |
| R05: four locators | README:935 uses “p.3”; line 994 uses “Tag 0GPU”; line 1036 uses “p.21”; Suggested:249 uses “Definition 15.66.1”. | All four specified repairs made. R03 above identifies different occurrences/errors. |
| R06: form | README:1 is “Roadmap: derived module algebra”; Layers 0–6 each have Examples and Dependencies; Lean follows their order. | Requested structural repairs made. The Roby exclusion was added as requested; R01 explains the new evidence against retaining it. |

**Build, signatures and padding.** The worker's targeted-build gate reports zero failures for every scanner, dependency, outside-folder and build check. Independently, `lake env lean` on the submitted file exited successfully with only its 19 expected `sorry` warnings. A copied file with `#check @name` for all 32 declarations also elaborated; comparison with the README found no lost standing hypothesis. In particular, the Matlis signatures retain completeness, locality, Noetherianness and the essential injective envelope; the residue criterion retains finite freeness, a common upper bound and a single interval for all residue fields; the tensor comparison retains joint naturality. No binder change is requested.

The one-tactic probe tried `simp`, `rfl` and `infer_instance` on each of the 19 admitted theorems; none closed. The pinned-object searches below found no single existing library theorem with the same full conclusion to use by `exact`. The two previous Check theorems are absent. No additional padding finding is raised. The Roby existence/normalization probe uses two simple definitions, no admitted data, no option overrides, and elaborates at the same pins.

**Headline inventory.** The README's end results and deep intermediate contracts are: homogeneous Roby representability; augmentation generators and base-ideal intersection; unbounded K-injective and K-flat replacements, Lazard and simplicial tensor/diagonal comparison; derived tensor and nonadditive powers; the full cotangent complex, universal property, transitivity, base change, smooth/regular computations, décalage and square-zero obstruction theory; localized strict-tower limits and unbounded Hom; derived completeness, the completion reflector/Nakayama, Koszul and ordinary-quotient comparisons, simplicial-algebra completion, complete-flat descent; perfect finite models and inverse-system effectivity; Matlis duality; first-quadrant spectral-sequence convergence.

The 19 Lean theorems comprise 2 augmentation results, 4 replacement/Lazard/tensor results, 4 completeness laws, 1 flatness result, 4 perfectness laws, 1 unit-reflection result, 1 residue-field criterion and 2 Matlis results. R01 adds the omitted statable Roby headline. The docstring identifies the missing full derived tensor/Hom/limit functors, cotangent/resolution/power carriers, completion/effectivity constructions and abutment filtration. Those exclusions do not excuse the simple native construction in R01. No bounded replacement for an unbounded theorem is used.

**Seeded sample: all 15 targets examined.** There are no locators expressly flagged unverified in the README. The table distinguishes text actually read from unavailable original sources; it does not certify Illusie's inaccessible volume through a secondary citation. Numbering uses the versions in References; Stacks pages are chapter-local.

| Sampled target | Locator and source text read | Hypothesis/support assessment |
| --- | --- | --- |
| 0.2.1 Flat modules as filtered colimits | StacksAlg lines 8891–8960, Lemma 10.81.2 and Theorem 10.81.4, Tags 058E/058G, pp.190–191. | Arbitrary commutative ring and flat module; no finite-generation hypothesis. The finite-free diagram includes zero and arbitrary rank through a small filtered system. |
| 0.3 Non-additive derived functors | DoldPuppe lines 919–967, §§4.1–4.7, pp.227–228; SAG lines 62226–62253, Proposition 25.2.1.2/Corollary 25.2.1.3, pp.1698–1699. | Dold–Puppe first treats shifted objects. The bounded-above projective-model extension is the README's stated route. Extending from finite projectives requires the stated filtered-colimit condition. |
| 0.4 Full cotangent complex | StacksCt lines 81–95, Definitions 3.1–3.2, pp.2–3; lines 144–232, Lemmas 4.1–4.7, pp.4–6. | Polynomial resolutions, augmentation base change and normalization support the full connective complex. The source's polynomial calculation permits arbitrary sets of variables. |
| 0.5 Square-zero extensions | StacksDefos lines 32–186, §2, pp.1–4, especially Lemmas 2.1–2.3 and Remark 2.4. | The kernel and quotient are identified; automorphisms are derivations and Baer addition uses the identified module. Not merely an unmarked isomorphism class of a middle ring. |
| 0.6 Cotangent universal property | StacksCt lines 206–223 and 933–948, Lemmas 4.5/11.3; StacksDefos lines 161–176, Lemma 2.3; Bhatt12 lines 1185–1208, Remark 6.6/(6), p.25. | Ext⁰/Ext¹ and the derivation normalization agree; negative Ext vanishes by connectivity. The p.3 citation needs p.4 (R03). |
| 0.8 Transitivity | StacksCt lines 631–715, proof and Proposition 7.4, Tag 08QX, pp.14–16. | First term is derived tensor; all three ring maps are arbitrary. The comparison maps and pinned cone sign are retained. |
| 0.9 Simplicial cotangent/diagonal | GR lines 10619–10671, Proposition 8.1.7 proof, pp.220–221. | The source uses the polynomial-resolution/pullback construction and its diagonal spectral sequence. General homotopy-invariance is attributed there to Illusie II 1.2.6.2; that original locator remains uncertified. The local convergence input needs R02. |
| 0.10 Derived base change | StacksCt lines 455–528, §6 and Lemma 6.2, Tag 08QQ, pp.11–12; lines 529–555, Remark 6.3. | Ordinary base change requires Tor independence. Without it the derived pushout is the correct object. The remark is not the general-map locator (R03). |
| 0.12 Smooth computation | StacksCt lines 805–854, Lemmas 8.4–8.6 and 9.1, pp.18–19; polynomial case at lines 224–232. | Smoothness gives degree-zero Ω with finite projectivity; arbitrary polynomial algebras have free Ω without finite rank. |
| 0.14 Derived exterior powers | SAG lines 62288–62305 and 62365–62442, Construction 25.2.2.2 and Proposition 25.2.3.4(2), pp.1700,1702–1704. | Flat discrete comparison and connective extension supported after the explicit alternating-quotient correction. Signed coinvariants alone are wrong integrally; README excludes that model. |
| 0.15 Derived symmetric powers | SAG lines 62262–62287 and 62412–62442, Construction 25.2.2.1 and Proposition 25.2.3.4(1), pp.1699,1703–1704. | Ordinary comparison is restricted to flat discrete inputs; no averaging or division by factorials. |
| 0.17 Triangle filtration/décalage | DM lines 863–875, proof of Lemma 4.2, p.21; SAG lines 62450–62540, §25.2.4, pp.1704–1707. | DM uses degreewise projective models for the filtration; the connective generalization here uses the same replacement route. Exterior/divided and symmetric/exterior shifts agree. |
| 0.25 Square-zero obstruction | StacksCt lines 1388–1432, Lemma 16.1, Tag 08SP, pp.31–32; StacksAlg lines 11014–11042, Lemma 10.99.8, Tag 051C, pp.233–234; StacksDefos §2. | Arbitrary A-linear kernel map allowed. Flatness additionally needs its induced map `J ⊗ B → N` to be an isomorphism, as explicitly required here. |
| 1.4 Koszul completion tower | StacksMA lines 12260–12322, Situation 15.93.15 and Lemma 15.93.18, Tag 0920, pp.266–267. | Finite generating tuple, all complexes; transition on degree −1 is multiplication by the generator. No unrestricted replacement by ordinary quotients. |
| 1.6 Simplicial-algebra completion | Prisms lines 374–446, §1.2 and footnote 6, pp.10–11; StacksCt Definitions 3.1/Remark 5.5; StacksMA Tag 0920. | Supports the simplicial Koszul algebra tower and underlying completion. The strict-diagram descent and localized algebra adjunction are explicit construction targets elaborating these ingredients, not a separately numbered theorem in Prisms. |

Additional text checks: Roby Theorem IV.1 at lines 1935–2005, pp.265–267; BMS19 Definition 4.1 and Lemmas 4.4–4.7/Corollary 4.8/Remark 4.9 at lines 850–977, pp.220–223; StacksDual Proposition 47.7.8 and preceding completion/Artinian results at lines 402–469, pp.10–11; Nekovar §2.3 at lines 2225–2248, p.52. These support the integral, bounded-torsion and general-residue-field distinctions used below.

**Adversarial calculations: 133 rows.** Each row gives actual values or maps. “Retain” means that the displayed instances do not refute the statement; these are discriminating checks, not proofs of universal assertions. In this table `k` is a field, `p` is prime, and `[1]` moves a discrete module to degree −1. Rows cover the sampled targets, all headline families, the real-bodied definitions and the constructions/API distinctions in every section.

| Statement | Instances tried | Values on both sides; excluded model | Result; change |
| --- | --- | --- | --- |
| 0.DP.1 Homogeneity, addition | `id`, `0`, `id+id` over ℤ | At scalar 2: `2x=2x`, `0=2ⁿ0`, `4x=2(2x)`. Zero has every degree. | Retain. |
| Homogeneity under composition | Square followed by cube | `(sx)^6=s⁶x⁶`; degrees multiply `2·3=6`, not add to 5. | Retain. |
| Degree-one classification | `f(x)=cx` on a line; square law | Linear law scales by s; square scales by s². At s=2,x=1 over ℤ these give 2 and 4. | Retain. |
| Ground evaluation is insufficient | `x^p y−xy^p`, p=2,3 | Ground values 0; `(T,1)` gives `T²−T` and `T³−T`, both nonzero. | Retain; R01 must retain scalar extensions. |
| Multiplicative laws and unit | Identity, determinant, zero | Identity sends `1→1`; determinant of diag(2,3) is 6 and respects products; zero sends `1→0`. | Retain unit condition. |
| Noncommutative multiplicative input | `R=M₂(k)`, degree one | `E₁₂E₂₁=E₁₁`, `E₂₁E₁₂=E₂₂`; identity preserves these different products. | Retain associative, not necessarily commutative input. |
| 0.DP.2 Homogeneous piece | M=0, free line, d=0,1,2 | `Γ⁰(0)=A`, higher pieces of 0 vanish; line pieces are A; `Γ¹(M)=M`. | Retain real span in R01. |
| Torsion divided-power piece | M=ℤ/2,d=2 | `Γ²(M)=ℤ/4`; ordinary symmetric square is ℤ/2. Four maps to ℤ/4 versus two for the wrong module. | Retain arbitrary modules. |
| Direct-sum grading | Free line over ℤ,F₂ | `γ₁²=2γ₂`; modulo 2 this is 0, but γ₂ is nonzero in the independent degree-two summand. | Retain; no division by factorials. |
| Universal law coefficients | Rank two, d=2 | `γ₂(Ux+Vy)=U²γ₂(x)+UVγ₁(x)γ₁(y)+V²γ₂(y)`; mixed coefficient is 1, not 2. | Retain normalization; R01. |
| Universal law at degree zero | Empty sum and empty product | d=0 gives one antidiagonal tuple and value 1; d>0 on zero gives 0. | Retain, including empty index set. |
| Roby representability | Free line, M=ℤ/2,d=2; d=1 | A law on a line is `x↦cxᵈ`, parameter c; torsion example is parameterized by ℤ/4; d=1 gives linear maps. | Add full native headline, R01. |
| Arbitrary base change of Γ | ℤ→F₂, M=ℤ/2,d=2 | `(ℤ/4)⊗F₂=F₂=Γ²_F₂(F₂)`; both γ₂ generators correspond. | Retain; no flatness needed. |
| Tensor map for Γᵈ | Free lines,d=0,1,2 | `1⊗1→1`; ordinary tensor at d=1; `γ₂(1)⊗γ₂(1)→γ₂(1⊗1)` with coefficient 1. | Retain. |
| Tensor-map naturality | Maps ×2 and ×3 on ℤ,d=2 | Both composites multiply the output γ₂ by `2²·3²=36=(2·3)²`. | Retain. |
| Internal Roby multiplication | R=ℤ,d=2 | `γ₂(1)⋆γ₂(1)=γ₂(1)`; graded multiplication gives `6γ₄(1)` in the wrong degree. | Retain separate internal algebra. |
| Multiplicative representability | R=A,d=0,1,2 | Universal laws are `a↦1,a,a²`, representing algebra A in each case; zero law fails the unit if A≠0. | Retain. |
| Free symmetric-tensor comparison | Rank two,d=2 | Γ² basis maps to `e⊗e`, `e⊗f+f⊗e`, `f⊗f`; invariant tensors have exactly these three coordinates, also over F₂. | Retain free hypothesis; no averaging. |
| 0.DP.3 Augmentation | `3+γ₂(m)`, γ₀, zero module | Values are 3,1; for M=0 it is id_A. The nonzero rational PD lift gives γ₂(1)↦1/2 instead of 0. | Retain actual lift body. |
| Augmentation naturality/uniqueness | m↦2m; ℤ→F₂ | Positive degree evaluates 0 through either composite; scalars r evaluate r or its reduction. Generators determine the map. | Retain. |
| Augmentation ideal | γ₂(m),1 over ℤ; zero ring | ε-values 0,1 respectively; zero ring gives the zero ideal, equal also to top. | Retain nontriviality only for properness. |
| Positive-degree remainder | Scalar r; `3+γ₂(m)γ₁(n)` | Remainders 0 and `γ₂(m)γ₁(n)`, the latter in the generator ideal. | Retain. |
| Positive generators equal kernel | M=0; free line; F₂ | Both ideals 0 for M=0; both contain all positive γᵢ and exclude 1 for nonzero A; γ₂ survives in F₂. | Retain Lean headline. |
| Scalar/augmentation splitting | `r+u`, ε(u)=0 | Forward `(r,u)`; inverse `r+u`. Multiplication includes `ru′+r′u+uu′`, unlike a direct-product algebra. | Retain linear equivalence. |
| Extended-ideal remainder | I=(2), z=`2(3+γ₂)` | ε(z)=6∈I; remainder `2γ₂∈IΓ·Γ₊`. | Retain. |
| Base ideal intersection | I=0,A,(2) on Γ_ℤ(ℤ) | Both sides 0,Γ₊, and the positive-degree elements with even coefficients, respectively. | Retain Lean headline. |
| Characteristic-two detector | γ₁(1),γ₂(1),γ₀(1) | In `F₂[ε]/ε²`, images are 0,ε,1; products obey γ₁²=0 and ε²=0. | Retain as README Check. |
| Degree one insufficient | Γ_F₂(F₂) | Ideal generated by γ₁ maps to 0 under detector; γ₂ maps to ε≠0. | Retain negative control, no Lean padding. |
| 0.K.1 Koszul complex | Empty sequence; (0); (1) | Complexes A[0], `[A→0 A]`, `[A→id A]`; homology A, A in degrees −1/0, and 0. | Retain. |
| Koszul two-generator sign | (x,y) | `d(e₁∧e₂)=xe₂−ye₁`, then `d²=xy−yx=0`; replacing minus by plus gives 2xy over ℤ[x,y]. | Retain. |
| Linear-functional Koszul functoriality | φ(e)=a, map e↦2f with ψ(f)=a/2 where defined | Both differential composites send e to a; no map is claimed without φ=ψ∘u. | Retain functional compatibility. |
| Koszul homotopy/resolution | One generator p; e₁-contraction | `dh+hd=p·id`; `[ℤ→p ℤ]` has H⁰=F_p,H⁻¹=0. Zero generator instead retains H⁻¹=A. | Retain regularity in resolution assertion. |
| 0.I.1 K-injective replacement | ℤ[0],field,zero | `[ℚ→ℚ/ℤ]` has H⁰=ℤ,H¹=0; field complexes split; zero replaces zero. Hom from F_p into this resolution has H¹=F_p. | Retain unbounded headline. |
| 0.1 Polynomial resolutions | Identity; polynomial algebra | Constant polynomial resolution realizes A or A[t]; standard P₀=A[B] and P₁=A[A[B]] augment to B. | Retain set-level extra degeneracy. |
| Resolution non-example | Constant A[t]→A[t]/t²,A≠0 | H⁰ of source is A[t], quotient has t²=0; augmentation kernel (t²)≠0. | Reject wrong model as README does. |
| Resolution independence | Identity functor; constant functor A | Identity realizes B; constant simplicial A has H⁰=A and higher homology 0, for either resolution. | Retain derived comparisons. |
| 0.2 K-flat replacement | F_p; bi-infinite ×2 over ℤ/4 | Free two-term model resolves F_p. Bi-infinite complex has H=0, but tensor with F₂ has Hⁱ=F₂ for every i. | Retain repaired K-flat predicate; termwise flatness alone fails. |
| Derived tensor unit/zero | A[0],M,zero | `A⊗ᴸM=M`, `0⊗ᴸM=0`; both computed on replacement complexes. | Retain. |
| Derived tensor and Tor | F_p⊗ᴸ_ℤF_p,p=2,3 | Two-term differential becomes 0; H⁰=H⁻¹=F_p. Ordinary tensor loses H⁻¹. | Retain. |
| K-flat closure and signs | Cone(id_A), shifts of A | Tensor of the disk is contractible, H=0; switching two degree-one terms multiplies by −1, which becomes 1 in F₂. | Retain. |
| Khovanov comparison | Two based unknots,W=dual numbers | `W⊗_W W=W`; quantum shifts give `1+1−1=1`; zero factor gives 0. | Imported bounded graded comparison agrees. |
| 0.2.1 Lazard | 0,A,ℚ over ℤ; F₂ over ℤ | Constant diagrams give 0,A; denominators a/d give ℚ and agree under divisibility transitions; tensoring ×2 with F₂ kills it. | Retain arbitrary flat modules; F₂ excluded. |
| 0.2.2 Natural tensor equivalence | Constant modules, maps ×2,×3 | H⁰ comparison is id on tensor; either naturality composite multiplies by 6. Both inverses induce inverse identity. | Retain jointly chosen family. |
| Signed shuffle | Degree-one generators | `s₁x⊗s₀y−s₀x⊗s₁y`; transpose gives −1 on H₂=A. In F₂ both signs coincide. | Retain repaired Lean normalization. |
| Flat-model qualification | Free resolution of F₂ versus constant F₂ | Derived self-tensor H⁰=H⁻¹=F₂; constant levelwise self-tensor only H⁰=F₂. | Retain. |
| Bisimplicial diagonal | Constant A; two normalized degree-one inputs | Both total/diagonal homologies are A in degree 0 or degree 2 respectively; transposition in second case is −1. | Retain homotopy equivalence; R02 for convergence. |
| 0.3 Derived nonadditive functor | F=id; constant F=A; tensor square of F₂ | Values M, A[0] even at input zero, and H⁰=H⁻¹=F₂ for the square. | Retain nonadditivity. |
| Finite-projective extension condition | Double dual,V=⊕ℕF₂ | Colimit of finite-dimensional double duals is V; V→V** is not onto. | Retain filtered-colimit hypothesis. |
| 0.4 Full cotangent | Identity, polynomial,ℤ→F_p | L=0, A[t]dt[0], F_p[1] respectively. | Retain full complex. |
| Nonreduced cotangent | B=k[ε]/ε² | Model differential ×2ε; for char≠2 H⁻¹=kε,H⁰=k; for char2 H⁻¹=H⁰=B. | Retain all characteristics. |
| 0.5 Split extension and Baer zero | B⊕M | Product `(b,m)(c,n)=(bc,bn+cm)`; M²=0, extension class 0. | Retain identified kernel and quotient. |
| Exal classification/addition | ℤ→F_p, M=F_p,p=2,3 | Ext¹=F_p; ℤ/p² gives normalized class 1, split F_p[ε] gives 0; p copies of 1 sum to 0. | Retain. |
| Extension automorphisms | B=A[t] versus B=A | `t↦t+m` composes by m+n; for B=A only zero derivation. | Retain. |
| 0.7 Naive versus full | ℤ→F_p; B=k[x,y]/(x,y)² | First has only H⁻¹=F_p. For the second the full model has H⁻²=k, while the naive two-term complex has H⁻²=0. | Retain truncation distinction. |
| 0.6 Ext⁰/Ext¹ | Polynomial B=A[t]; ℤ→F_p | Polynomial gives Hom(L,M)=M,Ext¹=0; quotient gives Hom=0,Ext¹=F_p. | Retain; locator R03. |
| Negative Ext | L connective,M discrete | Hom(L,M[−n])=0 for n>0; for F₃[1], Hom to F₃[1]=F₃ but Hom to F₃[−1]=0. | Retain shift directions. |
| Classifier normalization | ℤ/9→F₃ | Conormal generator 3 maps to 1; rescaling class by 2 maps it to 2, not 1. | Retain marked comparison. |
| 0.8 Transitivity identities | A=B; B=C | First case first term 0 and second map id; second case third term 0 and first map an isomorphism. | Retain. |
| Transitivity/cone sign | Cone of 0:ℚ[0]→ℚ[0] | Cone ℚ[1]⊕ℚ[0]; boundary sends shifted generator to −1. Positive projection would give +1. | Retain pinned convention. |
| 0.9 Simplicial cotangent | Constant ℤ→F₂; identity simplicial map | Diagonal H₁=F₂,H₀=0 in first; full diagonal 0 in second. | Retain; R02 supplies abutment earlier. |
| 0.10 Tor-independent base change | Polynomial square | dt tensors to dt; both sides are B′dt in degree 0. | Retain. |
| Base-change negative control | ℤ→F₂ self-square | Ordinary relative L_(F₂/F₂)=0; original base-changed L=F₂[1]; Tor₁^ℤ(F₂,F₂)=F₂. | Excluded by Tor independence; R03 locator. |
| 0.11 Localization | k[t]→k[t,t⁻¹]; invert 1 | Relative L=0 in both; absolute Ω in first is k[t,t⁻¹]dt. | Retain. |
| Filtered colimit of cotangents | Polynomials in first n variables | Both sides `⊕ᵢ Bdtᵢ`; an infinite product wrongly includes infinite-support differentials. | Retain. |
| 0.12 Smooth computation | Polynomial ranks0,1,2; infinitely many variables | Ω ranks0,1,2; infinite case free of infinite rank, not finite projective. | Retain separate finite smooth/polynomial statements. |
| 0.13 Regular quotient | (t²)⊂k[t]; empty sequence | Model `[B→2t Bdt]`; relative quotient complex `(t²)/(t⁴)[1]`; empty relative quotient complex 0. | Retain; char2 differential is 0. |
| Inseparable cotangent control | k=F_p(s),B=k[t]/(tᵖ−s) | Derivative 0; L has B in degrees −1 and 0. Ω alone misses H⁻¹, so this is not smooth. | Retain smoothness hypothesis. |
| 0.14 Derived exterior weights | 0,line,rank2; n=0,1,2 | Weight0=A, weight1=M; ∧²(line)=0,∧²(A²)=A. Signed coinvariants of an integral line give ℤ/2 instead. | Retain alternating quotient. |
| Exterior scalar change | ℤ²→F₂² | ∧² has rank1 on both sides, e∧f a generator and e∧e=0. | Retain. |
| 0.15 Symmetric powers | 0,line,rank2,n=0,1,2 | Weight0=A; Sym²(line)=A; Sym²(A²)=A³ with e²,ef,f², including char2. | Retain. |
| 0.16 Divided powers | Flat line in F₂,F₃ | γ_p is nonzero, but γ₁ᵖ=p!γ_p=0; Γ⁰=A,Γ¹=M. | Retain integral powers. |
| 0.17 Triangle filtration | Split A²=Ae⊕Af,n=2 | Three graded terms 0,A(e∧f),0; total exterior square A. If an end is 0 only the other exterior power survives. | Retain. |
| Décalage | Free line over ℤ,F₂,n=2 | `L∧²(A[1])=Γ²(A)[2]=A[2]`; `LSym²(A[1])=∧²(A)[2]=0`. | Retain distinct formulas. |
| 0.25 Flat deformation | ℤ/4→F₂,B=F₂[t],canonical c | Lift ℤ/4[t], kernel F₂[t], Tor₁ against F₂=0; Ext² of polynomial cotangent=0. | Retain. |
| Arbitrary-c nonflat solution | ℤ/4→F₂,B=F₂,N=F₂,c=0 | B′=F₂[ε],2B′=0, quotient by JB′ remains B′≠B; Tor₁^ℤ/4(F₂,B′)=B′≠0. | Retain exclusion from flat claim. |
| Identity base, arbitrary kernel | A′=A=B=ℤ,N=ℤ,c=0 | ℤ[ε] supplies nonzero square-zero kernel ℤ even though J=0; flat-specialization N=J⊗B would instead be 0. | Retain distinction. |
| Morphism-lift torsor | k[x]→k; k[ε]→k | Two lifts x↦0 and x↦ε differ by derivation ε; obstruction Ext¹=0 does not make the lifts identical. | Retain. |
| Nonzero conormal boundary | k[x]/x³→k[x]/x²→k | Subsequent conormal map sends x² to 0 in (x)/(x²); connecting map surjects onto k. | Retain nonzero boundary. |
| Polynomial automorphism sign | h_a(X)=X+aε over ℚ[ε] | h₁(X)−X=ε; inverse gives −ε; δ(X²)=2aX; h_a h_b=h_(a+b). | Retain h−id convention. |
| 1.1 Supplied cone/localization | Constant identity tower; zero transitions | δ has kernel A,cokernel0 in first; δ=id gives both0 in second. Rlim values M and0. | Retain additional localization; import generic owner. |
| Non-ML tower and Milnor maps | ℤ with ×p; K_n=[ℤ→ℤ/pⁿ] | limℤ=0,lim¹ℤ=ℤ_p/ℤ; H¹(Rlim K)=ℤ_p/ℤ=lim¹H⁰(K). | Retain all degrees. |
| Surjectivity versus cohomology ML | Same K_n | Each chain transition surjective, but H⁰(K_n)=pⁿℤ has strictly decreasing images. | Retain nonzero lim¹. |
| Six-term boundary | pⁿℤ→ℤ→ℤ/pⁿ | Boundary ℤ_p→ℤ_p/ℤ is quotient, nonzero; split constant sequence gives zero boundary. | Supplier's maps retained. |
| Cofinal shift | ×p tower, omit r levels | Tail class is p⁻ʳ times original modulo ℤ after removing finite sum; constant tower comparison id. | Supplier normalization retained. |
| Specified square homotopy | δ′u−vδ=dh+hd | Fibre map `(x,y)↦(ux,vy+hx)` satisfies chain equation; −h leaves an error `2(dh+hd)` over ℤ. | Supplier comparison retained. |
| Strict/coherent diagram distinction | V=⊕ℕk,tails A_n,C_n=kⁿ | limA=0,limV=V,limC=∏k; boundary has quotient `(∏k)/(⊕k)≠0`. | Retain strict derived-diagram input. |
| 1.1.1 Unbounded Hom | L=A,F_p,ℤ[1/p] | RHom(A,M)=M; RHom(F_p,ℤ) has H¹=F_p; RHom(ℤ[1/p],ℤ) has H¹=ℤ_p/ℤ, both H⁰=0. | Retain nonperfect inputs. |
| 1.2 Completeness definition | I=0,A; ℤ_p,ℚ_p | Localization at0 is0, so every M passes; unit ideal forces M=0. ℤ_p passes p-test; ℚ_p has nonzero map sending1→1. | Retain native predicate. |
| Generator and radical criteria | (p),(p²),empty tuple | Both nonzero localizations equal ℤ[1/p]; empty generators span0 and both tests are vacuous. | Retain both Lean laws. |
| Cohomology criterion | ℤ_p[1] and cone(×p) | First only H⁻¹=ℤ_p; second only H⁰=F_p. Each object and its cohomology are complete. | Retain. |
| Triangle/shift closure | Cone(×p on ℤ_p),shift n | Complete triangle has third vertex F_p; shift moves support0 to−n without changing localization vanishing. | Retain. |
| 1.3 Reflector/unit/idempotence | ℤ,F_p,ℤ[1/p]; I=0,A | Λ_p gives ℤ_p,F_p,0; Λ_pℤ_p=ℤ_p; Λ₀=id,Λ_A=0. Unit ℤ→ℤ_p sends1→1. | Retain finite ideal. |
| Adjunction/Nakayama | Complete N=ℤ_p; incomplete ℤ[1/p] | Hom(Λℤ,N)=Hom(ℤ,N)=ℤ_p. ℤ[1/p] has zero mod-p reduction but is nonzero and incomplete. | Retain completeness in Nakayama. |
| Complete-category colimits | I=0, ×2:ℤ[0]→ℤ[0] | There is no categorical cokernel: a split epi target would be a summand0 orℤ, neither works. Cone(2) has H⁰=F₂ but is not that cokernel. | Retain explicit HasColimit hypothesis. |
| 1.4 Koszul tower | f=p,0; empty tuple | p-transition `(p,id)`; f=0 has zero −1 transition, so limit extra term0; empty tuple limit M. | Retain; identity −1 transition is wrong. |
| 1.5 Quotient comparison | ℤ,(p); k[x,y]/xy,(x,y) | Koszul/quotient limits give ℤ_p and k[[x,y]]/(xy), both degree0; second is Noetherian despite nonregular sequence. | Retain hypotheses. |
| Unbounded-torsion counterexample | A=ℤ_p⋉(ℚ_p/ℤ_p) | Koszul H⁻¹=H⁰=ℤ_p; quotient tower has H⁰=ℤ_p,H⁻¹=0. | Retain general Koszul construction. |
| Action on that completion | Same A,C=ΛA,R=ℤ_p | Res C=R[1]⊕R; Hom_D(A)(C,R[1])=Ext¹_A(A,R)=0, whereas a split A-object has a nonzero projection. | Retain splitting only after restriction. |
| 1.6 Algebra localization | Polynomial resolution P→0 with P₀=A[t] | Strict Hom(0,P)=∅,Hom(A,P) singleton; after localization P≃0 both relevant Hom sets singleton. | Retain adjunction in H_A. |
| Strict completion models | Empty tuple versus(0) | First model B; second tower has extra negative term with zero transitions, limit B. Stage complexes need not be equivalent. | Retain unit-compatible limit comparison. |
| Algebra reflector | ℤ at(p);ℤ[d] at(p,d);I=A | Values ℤ_p,ℤ_p[[d]],0; underlying units give the same ring maps as module completion. | Retain all negative degrees and algebra unit. |
| Algebra idempotence/naturality | ℤ→ℤ_p,complete target | Applying completion twice gives ℤ_p again; both unit composites send integers to the same p-adic integers. | Retain. |
| 1.7 Complete flatness | ℤ,ℤ_p,F_p over ℤ | First two: higher Tor0,reduction F_p flat. Last: Tor₁=F_p, so excluded. | Retain module predicate and flat implication; R03 citation. |
| Unit ideal complete flatness | I=A | Reduction0 and all Tor0 for every M; every module qualifies. Completeness would force M=0, but is deliberately separate. | Retain. |
| 1.8 Complete amplitude | ℤ_p[1];∏ₙℤ/pⁿ | First support[−1,−1]; second ordinary support[0,0], complete Tor-amplitude[−1,0], unbounded torsion exponents. | Retain restricted bounded-torsion conclusion. |
| Complete-flat torsion formula | M=A=ℤ_p; A=ℤ/p² | First M[pⁿ]=0=A[pⁿ]⊗M. Second at n=1 both sides (p)≅F_p; reductions flat. | Retain. |
| 1.9 Complete faithful-flat descent | Identity; ℤ_p→ℤ_p×ℤ_p | Čech complexes contract to M, giving Tot=M in both. | Retain arbitrary complete M. |
| Descent negative control | ℤ_p→F_p | Mod-p map id_F_p, but Tor₁(F_p,F_p)=F_p≠0. | Excluded by complete flatness. |
| 1.E.0 Perfect predicate | A=k×k,e=(1,0) | eA finite projective,ranks(1,0); bounded free complexes have equal Euler ranks on both factors. | Retain projective model. |
| Pseudo-coherence/perfect implication | Same eA | Infinite-left rank-one free resolution with alternating e,1−e has H⁰=eA and other H=0. | Retain bounded-above, not bounded-free. |
| Perfect retracts | Idempotents e,0 on A | Inclusion/projection composite id on eA; images eA and0 both perfect. | Retain retraction equation. |
| Perfect shifts | A[0], n=−1,0,1 | Supports{1},{0},{−1}, all bounded finite-projective. | Retain. |
| Perfect triangles | Cone(×2 on ℤ[0]) | Two finite-free terms,H⁰=F₂; F₂ need not itself be projective. | Retain distinguished triangle. |
| Finite-free-model predicate | Zero,A[0],term at b+1 | First two pass b=0; a nonzero term at b+1 fails IsZero. | Retain explicit bound. |
| Termwise scalar extension | `[ℤ→2 ℤ]` to F₂ | Differential becomes0; H⁻¹=H⁰=F₂, agreeing with derived base change of the free model. | Retain model hypothesis. |
| Ring-tower limit and units | k[t]/t^(n+1),limit k[[t]] | Compatible coefficients determine one series; 1+t has inverse Σ(−t)ⁿ; t maps to0 at stage0 and is not a unit. | Retain full limit predicate. |
| Local versus global nilpotence | B=k[xᵢ]/(xᵢ²),I=(xᵢ) | Each finite set generates a nilpotent ideal; x₁⋯x_r≠0 for every r. | Retain locally nilpotent transition kernels. |
| Residue-field Tor criterion | `[k[[t]]→t k[[t]]]`;k over k[ε]/ε² | First fibre H⁻¹=H⁰=k, interval[−1,0]; second Tor_i(k,k)=k for every i≥0, no finite interval. | Retain pseudo-coherence and uniform interval. |
| Zero ring/residue universe | R=0 | No nonzero field quotient, but every unital R-module=0; conclusion has zero model too. | No false vacuity. |
| Compatible finite-free models | Constant tower;k[t]/t^(n+1) with ×t | Constant matrices remain constant; reduction of ×t equals ×t at prior level. | Retain chain-level comparison and bases. |
| Strict limit/reduction | Same two-term ×t tower | Limit `[k[[t]]→t k[[t]]]` has H⁻¹=0,H⁰=k; each finite H⁻¹=k, with zero transition maps. | Retain derived reduction, not cohomology tensor. |
| 1.E.1 Effectivity | Same tower;constant eA | Effectivizations are the two-term limit and eA[0]; derived reductions recover the finite stages, including their H⁻¹. | Retain full perfect systems. |
| 1.M.1 Arithmetic Matlis | R=ℤ_p,E=ℚ_p/ℤ_p | D(R)=E,D(E)=R; evaluation identifies each double dual with itself. | Retain. |
| Equivariant Matlis convention | Cyclic group acting by a unit a | Dual action is a⁻¹; applying twice restores a. Evaluation of m on f is f(m) on both sides. | Retain contragredient action. |
| Equivariant nonabelian control | S₃ acting on k³ by permutations | For s=(12),t=(123), st≠ts; dual matrices are inverse transposes and preserve evaluation. Double dual restores P_s and P_t. | Retain for nonabelian groups too. |
| 1.M.2 Arbitrary residue field | Any k,M=kʳ,r=0,1,2 | Dual dimension r; evaluation matrix I_r, including empty0×0 matrix. | Retain both general Lean headlines. |
| Completion action/necessity | R=k[x]_(x),E residue hull | End_R(E)=k[[x]]; bidual of R is its completion, larger than R. | Retain completeness for biduality. |
| Finiteness/Artinian necessity | M=⊕ℕk | D(M)=∏ℕk; evaluation M→M** not onto. | Retain finite/Artinian binders. |
| S.1 Single row/column | Only q=0 or only p=0 | E₂ is H of that row/column and equals H(Tot); no other nonzero terms. | Retain. |
| S.1 Exact-row comparison | A⁰⁰=A¹⁰=ℤ,d′=id | E₂=0,H(Tot)=0; kernel column0, so its cohomology also0. | Retain. |
| S.1 Abutment filtration | Single nonzero total degree n | Row: FⁿHⁿ=Hⁿ,Fⁿ⁺¹=0; column:F⁰Hⁿ=Hⁿ,F¹=0. | Retain actual filtration. |
| S.1 Stabilization/d₂ | Four-entry complex in R02 | E₂^(0,1)=E₂^(2,0)=ℤ; d₂=−id, E₃=0=H(Tot). Bound at(0,1) requires r>2. | Retain mathematics; move supply under R02. |
| S.1 Extended sequence bound | Only A⁰⁰=ℤ,n=0,1 | For n=0 both edge maps id, composite id≠0; for n=1 all displayed positive-degree terms0. | Retain n≥1. |

The computations include zero modules/rings, empty generators, unit ideals, torsion modules, characteristic 2 and 3, inseparable and nonreduced rings, nonflat base change, infinite rank, unbounded complexes and torsion, and noncommutative input where permitted. Tensor, cone, shift, conormal and automorphism signs agree with the actual two-term examples. No restriction to good primes, flat inputs for the entire library, or finite residue fields was introduced to avoid a negative control.

**Pinned-library audit.** Manifest pins checked: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Searches used the objects—polynomial-law evaluations, divided-power generators, cotangent/conormal maps, tensor/acyclic complexes, injective envelopes, completion, perfect models and spectral objects—not just this roadmap's names. The following opened declarations delimit the existing inputs:

| Pinned file and line | Declaration/content examined |
| --- | --- |
| `Mathlib/RingTheory/PolynomialLaw/Basic.lean:77` | `PolynomialLaw` contains scalar-extension functions and naturality, with the scalar algebra in the base universe. Homogeneity is not a field. |
| `Mathlib/RingTheory/PolynomialLaw/Basic.lean:118`, :232, :271, :332 | `id`, `ground`, `comp`, `toFun`; the all-universe extension does not make ground evaluation determine a law. |
| `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean:127`, :147, :152, :156, :171, :251 | `dp`, `induction_on`, degree-zero/scaling/product laws and `submodule_span_prod_dp_eq_top`; generation is not a homogeneous direct-sum decomposition. |
| `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean:346`, :364, :418, :431 | `lift`, `lift_apply_dp`, `map`, `map_apply_dp`; sufficient for the real augmentation body, but no homogeneous Roby representability declaration was found. |
| `Mathlib/RingTheory/Flat/EquationalCriterion.lean:270` | `Module.Flat.exists_factorization_of_finitePresentation`; finite-free factorization, not yet a filtered-colimit presentation. |
| `Mathlib/Algebra/Homology/Monoidal.lean:48`, :56, :64 | `HomologicalComplex.tensorObj`, tensor inclusions and `tensorHom`; native unbounded tensor complexes and their maps. |
| `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean:701` | `HomologicalComplex.Acyclic` asks for exactness in every degree. |
| `Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean:160`; `Mathlib/Algebra/Homology/Homotopy.lean:740` | Alternating-face functor and `HomotopyEquiv`, including both maps and both inverse homotopies. |
| `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:42` | `IsKInjective` is the null-homotopy property for maps from acyclic complexes. |
| `Mathlib/Algebra/Homology/DerivedCategory/DerivabilityStructureInjectives.lean:60` | `CochainComplex.Plus.exists_quasiIso_injective` has bounded-below input. It does not remove the unbounded replacement target. |
| `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:324`, :578 | `exact_cotangentComplex_toKaehler`, `Generators.equivH1Cotangent`; low-degree conormal/differential information, not the full cotangent object. |
| `Mathlib/RingTheory/Derivation/ToSquareZero.lean:116` | `derivationToSquareZeroEquivLift` retains the scalar tower and supplied square-zero lift setting. |
| `Mathlib/Algebra/Homology/HomotopyCategory/Pretriangulated.lean:54`, :60 | `mappingCone.triangle`, `inl_v_triangle_mor₃_f`; third map is the negative shifted projection. |
| `TauCeti/RingTheory/Ideal/ArtinRees.lean:78` | `TauCeti.ArtinRees.exists_controlled_lift`; Noetherian ring and finite ambient module, shift independent of depth and surjection. |
| `TauCeti/Algebra/Module/Injective/Envelope/Basic.lean:101`, :172 | `TauCeti.IsInjectiveEnvelope`, essential range and uniqueness via `exists_linearEquiv`; no unrestricted hull-existence theorem is imported. |
| `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:327` | `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`; ordinary finite-module completion comparison with its finiteness/Noetherian binders. |
| `Mathlib/Algebra/Homology/HomotopyCategory/SpectralObject.lean:46`; `Mathlib/CategoryTheory/Triangulated/SpectralObject.lean:246` | `spectralObjectMappingCone`, `mapHomologicalFunctor`; the stated route's spectral-object inputs exist. |
| `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean:176`, :394; `Mathlib/Algebra/Homology/SpectralObject/SpectralSequence.lean:480` | `coreE₂CohomologicalNat`, `IsFirstQuadrant`, `spectralSequence`; page construction and homology isomorphisms, not the particular total-complex abutment/edge-map theorem of §S.1. |

**Cross-roadmap ownership and citation resolution.** The roadmap service was used for object searches and to read open-work matches; the supplied main checkout, board packages and supplied sibling heads were also searched. References to a revision of an existing roadmap were resolved against main. The target's own older main version is not a competing owner of its amendment. No other readable roadmap's Lean file was found declaring this folder's namespace. The 28 unresolved-name leads in the supplied citation report were checked as local names or names in the external affine-crystalline source; they are not 28 missing suppliers.

| Cited object / potential collision | Resolved location and ownership conclusion |
| --- | --- |
| Generic module towers | `TauCetiRoadmap/AlgebraicTopology/README.md:954–996`, Stage 6 item 0 on main, owns difference maps, lim/lim¹, ML, Milnor, cone, cofinal and specified homotopy-square theory. This head imports it. §1.1's additional strict-diagram localization is different content. |
| Ringed-site replacements and enhancement | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429–467`, §§0.1–0.3 on main. Its point-site replacements expressly consume this roadmap at lines 451–453; they are not suppliers back into the ordinary-module construction. |
| Point-site Hom and affine tensor | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:637–665` (E1.F3.H1) and :888–923 (E1.8.DMA.1). These own the site/module comparisons; their ordinary Hom/tensor inputs belong here. |
| Perfect realization and trace | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1295–1358`, F.10.3 on main. This is the DG realization/dualizability/trace contract, consuming the ordinary perfect predicate, not a second ordinary-module predicate. |
| Bounded dual-number tensor | `TauCetiRoadmap/KhovanovHomology/README.md:686–725`, K5 on main. Quantum gradings, dot action and connected sum distinguish its bounded model from this roadmap's general module tensor. |
| Ordinary versus almost cotangent | `TauCetiRoadmap/PerfectoidSpaces/README.md:2334–2367`, P0.19, expressly consumes the ordinary complex and owns the almost construction at P0.20; P0.22 at :2747–2771 consumes the normalized ordinary deformation laws. |
| Animated/analytic extension | `TauCetiRoadmap/AnalyticStacks/README.md:14`, :64–66, :992–1001 at the supplied open head. It imports this roadmap's classical cotangent, Koszul and perfect inputs and extends them to analytic/animated settings. |
| Matlis/ordinary-model consumers | `packages/DirectSummandsAndBigCohenMacaulay/README.md:9`, :106 and its supplied open-roadmap counterpart consume the generic Matlis and perfect-model inputs. Older design references do not supersede that final ownership. |
| Other open-work searches | DeRhamCohomologyAndDuality builds smooth real de Rham theory; HopfologicalAlgebra and McKaySkewGroup concern different enhancements/representations. The object search did not reveal a competing construction of the ordinary module contracts here in the supplied open heads. |

The ownership correction moves no new mathematics to a later supplier: the generic tower construction stays with its existing main owner. Some consumers on main still mention the old `DerivedModuleAlgebra §1.T.1` locator (for example EnhancedDerivedSheaves line 465); those consumer-side citations will need repointing to AlgebraicTopology. They are not a reason to reconstruct the deleted theory here or to edit another folder in this review.

Every Needs line and supplier citation in this folder was read. Sheaf, trace, Khovanov and almost adapters are ownership exclusions or consumers, not reverse prerequisites of the ordinary construction. No declared gap contract was present. The remaining internal convergence ordering issue is R02. The independent dependency-check output was:

```text
depcheck: 205 roadmaps, 1605 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted. The gate also reports `depcheck=0`, `outside-folder=0`, `stray-files=0`, `sorry-data=0`, `set_option=0` and `build=0 OK`.

**External formalization citations.** The sources service retrieved the version 1.0.0 files and license from the named public affine-crystalline repository. Its manifest pins Mathlib `c026161a585cd81c984425fbf72406b5523442c7` (AffineCrystalline, lake-manifest extraction line 12), different from this PR's pin. The code was read, not downloaded and executed. The README correctly treats it as a source for porting, not as an available pinned import.

- AffineCrystalline, `Envelope/FreeConstruction/DPAlgebraAugmentation.lean` extraction lines 76–85, 113–138, 157–190: augmentation, its generator/scalar values, positive ideal, remainder and equality with the kernel. Hypotheses are arbitrary commutative R and R-module M in one universe, without freeness.
- AffineCrystalline, `Cohomology/Cech.lean` extraction lines 85–94 and `Cohomology/CechDerived.lean` lines 65–78: `CechNerveData` has a cosimplicial corepresenter with nonempty index sets, and `rightDerivedLimIsoCech` uses that data and its size assumptions. This does not by itself supply general unbounded Rlim on arbitrary strict towers.
- AffineCrystalline, `Homology/TotM.lean` extraction lines 912–917 and 1056–1064, and `Homology/TotQuasiIso.lean` lines 551–554: the two augmented acyclic-assembly theorems and columnwise quasi-isomorphism theorem are on `RawBi`, with first-quadrant and augmented exactness hypotheses. The README retains the required adaptation to Mathlib's native double complexes.

## Not verifiable

- **IllusieCC**, *Complexe cotangent et déformations I*, Chapter II, 1.2.6.2: the sources-service DOI attempt did not yield readable full text (publisher/Crossref retrieval was unavailable). The original volume's exact numbering and general simplicial homotopy-invariance statement were not independently certified. GR Proposition 8.1.7's use was read; it does not replace verification of the original. This locator was already treated as uncertified in the previous review, so no renamed or duplicate source request is made.
- **NSW**, *Cohomology of Number Fields*, version 2.3, Proposition 2.1.1 p.99 and Lemma 2.2.4 p.105: the stated author/institutional PDF URL, fetched through the sources service, returned the book landing page. Its announcement of a freely downloadable version does not expose the cited pages in the retrieved text. The source numbers/pages remain unverified; the mathematical first-quadrant calculations above were performed independently. This is recorded once under the existing NSW source identity in the scratch reference request.

All cited works were attempted through the legal sources service; the initially unresolved AffineCrystalline landing-page request was resolved by its public versioned files and removed from the missing-text list. This review is complete with the limitations above; it is not parked pending a text. No unavailable source was assumed to contain an unstated theorem.

## Source issues

- **Error** in SAG at Construction 25.2.2.2, printed p.1700 (SAG line 62288): the source says exterior powers are signed tensor coinvariants; it should be the alternating quotient also imposing repeated-factor vanishing; affects a stated result.
- **Error** in SAG at Proposition 25.2.3.4(2), printed p.1703 (SAG line 62415): the source says the flat exterior-power comparison uses signed coinvariants; it should be the ordinary alternating exterior power; affects a stated result.
- **Misprint** in SAG at the second proof heading after Lemma 25.2.4.3, printed p.1705 (SAG line 62476): the source says the following argument proves Proposition 25.2.4.1; it should be Proposition 25.2.4.2; affects nothing.
- **Misprint** in SAG at the Koszul resolution in that proof, printed p.1705 (SAG line 62486): the source says its terminal quotient is the symmetric algebra of M₁; it should be the symmetric algebra of M₂; affects the proof.
- **Misprint** in SAG at the sifted extension argument, printed p.1706 (SAG line 62524): the source says the initial functor u has domain E; it should be E₀ before extending to E; affects the proof.
- **Misprint** in StacksCt at Lemma 92.7.3, proof for i=2, printed p.16 (StacksCt line 686): the source says a morphism in C_(C/A) is a B-algebra homomorphism; it should be an A-algebra homomorphism; affects the proof.
- **Misprint** in StacksCt at Lemma 92.7.3, same proof, printed p.16 (StacksCt line 693): the source says the restricted sheaf is pulled back by g₁; it should be pulled back by g₂; affects the proof.
- **Misprint** in StacksCt at Lemma 92.16.1, proof of (1), printed p.32 (StacksCt line 1425): the source says the truncation comparison uses L_(A′/A); it should be L_(A/A′), as in the surrounding Ext groups; affects the proof.
- **Misprint** in StacksDefos at Lemma 91.2.1, proof, printed p.3 (StacksDefos line 113): the source says the unchanged second evaluation is ν(f′(z_e)); it should be ν(f′(y_e)); affects the proof.
- **Misprint** in StacksDefos at Remark 91.2.4, printed p.4 (StacksDefos line 184): the source says the lifted presentation has source P′; it should be P, the polynomial presentation already fixed; affects the proof.
- **Misprint** in Bhatt12 at Remark 6.6, printed p.25 (Bhatt12 line 1202): the source says the section's target prelog ring is N→P; it should be N→B; affects nothing.
- **Misprint** in StacksMA at Lemma 15.93.21(2), proof, printed p.268 (StacksMA line 12394): the source says completed cone cohomology vanishes below r; it should be below −r; affects the proof.
- **Error** in StacksMA at §15.96 opening example, Tag 0BKH, printed p.275 (StacksMA line 12712): the source says the square-zero-ring completion splits as ℤ_p[1]⊕ℤ_p[0] in D(A); it should assert that splitting after restriction to D(ℤ_p), retaining the nonsplit A-action; affects a stated result.
- **Misprint** in StacksDual at Remark 47.7.9, printed p.11 (StacksDual line 474): the source says the nonzero quotient is N″/N′ when N″ is properly contained in N′; it should be N′/N″; affects the proof.
- **Misprint** in BMS19 at Lemma 4.7(2), proof, printed p.222 (BMS19 line 954): the source says to check H^(−i) for i<0; it should be i>0, the negative cohomological degrees; affects the proof.
