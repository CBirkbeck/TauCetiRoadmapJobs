# Review of SchemeAndStackFoundations (pull request #1656 at 18d3246)

**Verdict:** rejected

The new prescribed-presentation normalization objective extends an existing roadmap and needs a successor roadmap (R03). Independently, this folder has two mathematical/ownership blockers and five P2 findings in total. The gate fails. No pull-request file was changed.

The supplied previous review identifies **#1276 at 0cb327b**, not this pull request or this head. I treated its ten findings as claims to recheck, not as evidence of a repair history for #1656. No supplied repair report marks any finding “not actionable in this package.” The comparison is:

| Previous finding | Current passage and location in `TauCetiRoadmap/SchemeAndStackFoundations/README.md` | Result |
|---|---|---|
| R01, reciprocal Jacobian supply | :5539, “JacobianChallenge's … supplies finiteness”; :5555, “JacobianChallenge Layers B–C” | Not repaired; current R01. |
| R02, arbitrary gradings | :4912, `LocallyConstant X ℤ`; :4931, the connected-case Check | Repaired. Degrees on clopen components give regular signs; the isolated-origin degree on the affine line is excluded. |
| R03, polarized-system algebraization | :74, “Polarized algebraization of formal schemes … are also outside this scope” | Old extension absent. Current R03 concerns the different, newly added normalization extension. |
| R04, degree-zero part of relative Proj | :2744, “in general not `O_S` … no condition on it” | Repaired. General degree zero in §0.3 accommodates `k×k`; the two-component example still returns two projective lines. |
| R05, alteration projectivity | :6549, “stronger projectivity conclusion”; the Lean conclusions remain `IsProper` | Not repaired; current R05. |
| R06, coherent full faithfulness | :5571, `grothendieck_existence_fullyFaithful`; :5602, README-only API | Not repaired; current R06. |
| R07, Nagata and 2-Yoneda locators | :1402, `0335`; :2829, `0432` | Not repaired; current R15. |
| R08, padding | Lean :393, `universalHomeomorphismEtaleEquivalence_functor`; :2284, thickness-three calculation | Not repaired; current R10. |
| R09, omitted-headline inventory | Lean :14–19, “Key definitions and headline theorems” | Not repaired: there is no unavailable-headline inventory; current R11. |
| R10, undeclared API names | README :2087–2106; :5188, `ArtinLocalAlg` | Not repaired; current R12. |

## R01 (P1) — Break the reciprocal supply with JacobianChallenge

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5539`, “JacobianChallenge's … supplies finiteness of coherent cohomology”; also :123, :419, :5555, :5794.

**Claim:** JacobianChallenge is a supplier of this roadmap, and this roadmap supplies prerequisites of that same supplier.

**Witness:** On main, `TauCetiRoadmap/JacobianChallenge/README.md:152` imports this roadmap's Chow lemma, :196 its formal functions, and :208 its Hilbert schemes. Here §§4.9 and 4.14 consume JacobianChallenge C.

This is a roadmap-level cycle, even if the early finiteness proof and later Picard construction can be ordered at theorem level. The binding contract requires one direction between roadmaps. The mechanical check does not expose these main-roadmap return edges.

**Repair:** Give the early foundational block—Chow's lemma, proper coherent cohomology and its required base change, formal functions, and Hilbert representability—one preceding owner. JacobianChallenge consumes that block. Move uses of JacobianChallenge's later Picard output to a successor. Record the ownership transfer rather than leaving duplicate plans. Rechecking the three cited return edges must give foundation → JacobianChallenge → successor, with no return edge. Reordering subsections alone leaves the same cycle.

## R02 (P1) — A constant formal system need not be an affine formal spectrum

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5444`: “a scheme as a constant system is `Spf` with the zero ideal.”

**Claim:** Every constant scheme system is of the form `Spf(A,0)`.

**Witness:** Take the constant system `ℙ¹_k`. Its level zero has dimension 1 and global sections `k`; `Spf(A,0)` has affine level zero `Spec A`. Taking global sections would force `A≅k`, whose spectrum has dimension 0.

**Repair:** Restrict this Check to an affine scheme `X=Spec A`. Keep the separate, general embedding of schemes as constant systems, without identifying every such system with an affine formal spectrum. The repaired Check gives `Spf(k[t],0)_n=Spec k[t]`; constant `ℙ¹_k` remains a valid system and a negative control for affineness.

## R03 (P2) — Put the new normalization objective in a successor roadmap

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:798`, “Linear Noether normalization for a prescribed affine presentation”; new `LinearNoetherNormalizationTargets.lean:22`.

**Claim:** This existing roadmap acquires a new stronger normalization theorem and its elimination/projection package.

**Witness:** Main's `TauCetiRoadmap/SchemeAndStackFoundations/README.md:755`–:797 contains local dimension and dimension formulas, followed immediately by §0.8. The present diff adds §0.7a and a new Lean file; it repairs no previous normalization statement.

The prescribed-tuple condition is genuine new content: Mathlib's ordinary normalization does not constrain its parameters to the linear span of the supplied generators. Under the brief, extensions are successor/Part II roadmaps, not additions replanning the existing roadmap.

**Repair:** Move the new objective, its general proof inputs, and its acceptance theorem into a separately scoped successor whose introduction states where the base stops. Import base dimension/morphism interfaces by section. Coordinate its name with the already recorded `SchemeAndStackFoundationsPartII`: `packages/SchemeAndStackFoundationsPartII/design/plan.json:19` concerns animated flat cohomology, not this normalization package. On `k[X,E]/(E²)`, the successor supplies the parameter `X` and rank-two finite map, while the existing dimension theorem supplies dimension 1. Neither obligation is lost. This scope defect determines the rejected verdict for this folder.

## R04 (P2) — Remove admitted constructions from the acceptance test

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:550`, `:653`, `:1539`, `:2053`, `:2442`, `:2542`; e.g. `def Scheme.formalCompletion … :=` with admitted fields.

**Claim:** The file uses constructed maps, comparisons, exact structures, and quotients as if their definitions were available at the pins.

**Witness:** The gate reports `sorry-data=25`. Examples include Frobenius comparisons, exactness instances for derived restriction, formal completion, rational-equivalence subgroup laws, and the exact structures defining `K0` and `G0`.

Admitting proof fields inside a data declaration still violates the stated rule; several of these are substantial constructions, not the few simple definitions allowed to state a headline.

**Repair:** Keep only genuinely simple definitions with complete bodies on pinned carriers. Move heavy constructions and their dependent stand-ins to the README; name the actual unavailable headlines and missing carriers in the module docstring. Where possible, quantify over a fully specified native system rather than manufacture it with admitted data. The coherent-map signature tested for R06 uses the existing system's explicit equations; on `Spec k[[t]]` they are exactly the quotient maps modulo `t^(n+1)`. Rerun the gate until `sorry-data=0`, including nested proof holes.

## R05 (P2) — Preserve projectivity in both alteration headlines

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6454`, `:6549`; `Suggested.lean:2322`, `:2388`.

**Claim:** Proper compactifications in Lean suffice to test the field and trait alteration theorems; the trait prose explicitly excludes the stronger projectivity conclusion.

**Witness:** `de-jong line 601`, Theorem 4.1, printed p.66, and `de-jong line 1258`, Theorem 6.5, printed p.83, require projective compactifications. Both elaborated Lean conclusions contain only `IsProper`.

**Repair:** Restore projectivity in both prose targets. State the full signatures if a few simple definitions on pinned carriers suffice; otherwise name the full theorems and missing projectivity carrier in the docstring and remove the weaker substitutes. For `ℙ¹_k` and `ℙ¹_{k[[t]]}`, identity alterations have projective compactifications, so the full conclusions are true; merely recording properness does not test them.

## R06 (P2) — State coherent full faithfulness as an acceptance theorem

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5571`, `:5602`; `Suggested.lean:2088`.

**Claim:** Essential surjectivity of completion and algebraization of scheme morphisms cover the coherent-existence headline.

**Witness:** `stacks line 3234` (Cohomology of Schemes, Proposition 30.25.4, tag 088C) asserts an equivalence. A scratch signature for unique algebraization of compatible maps of coherent modules elaborated at this head, with only `sorry` warnings.

**Repair:** Add the full-faithfulness theorem: for proper `X` over complete Noetherian adic `A`, coherent `M,N`, and compatible `g_n:j_n* M→j_n* N`, there exists a unique `G:M→N` restricting to all `g_n`. Specify the reduction kernels and transition equations, and use native `Scheme.Modules.pullbackComp` and `pullbackCongr`. The tested signature adds no new carrier. On `X=Spec k[[t]]`, `M=N=O`, the compatible residues of `1+t+t²+…` give exactly one multiplication map; `0 mod t` and `1 mod t²` fail compatibility. This is distinct from algebraizing maps of schemes.

## R07 (P2) — Put the new statable headline in the tested module

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:872`, “`LinearNoetherNormalizationTargets.lean` states”; `LinearNoetherNormalizationTargets.lean:22`; `Suggested.lean:1`.

**Claim:** A separate, unimported file supplies the acceptance theorem for §0.7a.

**Witness:** `exists_linear_normalization` elaborates with `Infinite k`, `Nontrivial A`, and the tuple-generation equation intact. It is absent from `Suggested.lean`, which neither imports nor states it; the specified targeted build therefore does not test it.

**Repair:** After the ownership move in R03, place the general theorem in that successor's `Suggested.lean`, using `import Mathlib` and only the necessary Tau Ceti module. Keep the two finite-field calculations as README Checks. The theorem still accepts the reducible and nonreduced cases and rejects the zero algebra; the independent signature run confirms no stand-in is necessary.

## R08 (P3) — Use the permitted imports in both Lean files

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:2`, `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`; `LinearNoetherNormalizationTargets.lean:5`–:7.

**Claim:** Another roadmap's proposed implementation and three Mathlib submodule imports may form the acceptance environment.

**Witness:** The gate reports `imports=1`. The companion file uses `Mathlib.RingTheory.NoetherNormalization`, `Mathlib.RingTheory.AlgebraicIndependent.Defs`, and `Mathlib.Data.ZMod.Basic`, instead of the required single `import Mathlib`.

**Repair:** Delete the roadmap import. Use actual pinned carriers or a few complete simple definitions; document genuinely unavailable headlines instead of importing their planned construction. Replace the companion's Mathlib imports with `import Mathlib` when relocating its headline. The normalization signature uses only native polynomials, finite ring maps, algebraic independence, matrices, and the pinned dimension comparison. The rank predicate consumed from AlgebraicVectorBundles must not be silently replaced with Mathlib's unrestricted locally-free predicate, which does not impose finite rank.

## R09 (P3) — Delete the 101 admitted examples

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:81`–:115 and throughout; e.g. `example … IsPseudoCoherentModule … := by sorry`.

**Claim:** Admitted examples function as acceptance Checks.

**Witness:** The gate reports `sorry-examples=101`; the zero-module and finite-free examples contain proof holes and therefore test no definition.

**Repair:** Delete these examples from `Suggested.lean`; retain their mathematics as README Checks. A handful of genuinely discriminating examples may remain only with complete proofs. For the zero module the resolution and all positive homology are zero; that computation belongs in the README and does not need a sorried declaration.

## R10 (P3) — Delete definitional and worked-example padding

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:393`, `:569`, `:691`, `:695`, `:791`, `:2284`; companion :45 and :52.

**Claim:** Projection identities, recursion equations, and individual worked examples are headline theorems.

**Witness:** Five scratch proofs close with `rfl`: `universalHomeomorphismEtaleEquivalence_functor`, `absoluteFrobenius_base`, `iteratedSchemeFrobenius_zero`, `iteratedSchemeFrobenius_succ`, and `qPowerFrobenius_eq_iterated`. The nodal calculation and both three-line theorems reproduce README Checks.

**Repair:** Delete them from `Suggested.lean`, not prove them in place. Delete the companion's two finite-field comparison theorems and the seven auxiliary definitions/abbreviations used only by those Checks. Keep the general normalization headline. Also delete the proved example at :224 that merely calls `fixed_of_henselian`. The retained README computations are unchanged: `uv=s³t` becomes `ab=st` after removing `s²`, and over `𝔽₂`, `zx=x³`, `zy=y³`.

## R11 (P3) — Inventory omitted headlines and their missing carriers

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:14`–:19; companion :10–:14; README :17–:23.

**Claim:** The module docstrings describe the roadmap's acceptance coverage.

**Witness:** Neither docstring lists unavailable headlines. The summary promises Keel–Mori, coherent Grothendieck duality, the scheme Brauer-class map, pointless-curve Picard torsors, Schlessinger, GRR, and Hodge index; these are not stated as those headlines.

**Repair:** Give each file the required target-signatures docstring. List every end theorem, state each that is expressible on the pins, and identify the precise missing carrier for each other theorem. Do not substitute affine matrix splitting for the scheme Brauer-class map or properness for projectivity. On a pointless real conic, actual line-bundle degrees are `2ℤ`, while geometric Picard degrees are `ℤ`; the affine Picard comparison does not test that headline.

## R12 (P3) — Make README names agree with the acceptance declarations

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2087`–:2106, :5188–:5211, :872.

**Claim:** Backticked names advertise declarations of this roadmap's Lean file.

**Witness:** The gate reports `readme-ids-missing=15`, including `isNormalScheme_Spec_iff` and `ramificationIdxAt.eq_dvr`. `ArtinLocalAlg` and `IsArtinLocalAug` are also README-only; the companion's actual theorem names are not listed in the README.

**Repair:** Write non-headline API and Checks as mathematical prose without invented Lean counterparts. Retain code names only for actual declarations, and name the relocated normalization headline explicitly. Do not fill the file with API padding to satisfy the scanner. The normality Check still distinguishes the cusp from its normalization and the ramification Check still gives index 2 for `t↦u²`.

## R13 (P3) — Remove TeX-only syntax outside code spans

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1940`, “On Spec F_{p²}”; also :1866, :1952 and following.

**Claim:** These formulas meet the README typography rule.

**Witness:** The gate reports `tex=65`; the displayed field and several Frobenius twists contain braced TeX subscripts/superscripts outside code spans.

**Repair:** Use Unicode or enclose ASCII mathematical notation in code spans; update any changed heading links. Preserve the formula's meaning: on `𝔽₄`, the absolute 2-Frobenius has order 2, not 1. Rerun the scanner to obtain `tex=0`.

## R14 (P3) — Replace the Mathlib pull-request reference with pinned interfaces

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:848`, `[PR42835]`.

**Claim:** A development pull request is the timeless normalization interface to follow.

**Witness:** The gate reports `prnum=1`. The next sentence already names the pinned Tau Ceti dimension declaration; the actual Mathlib normalization declarations are present at the manifest pin.

**Repair:** Remove the pull-request number and process direction. Cite the pinned declarations and files in the supplier contracts. They yield dimension 1 for the finite injective map `k[X]→k[X,E]/(E²)` without any dependency on future Mathlib work.

## R15 (P3) — Correct four source attributions

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1402` (`0335`), :2829 (`0432`), :3720 (Česnavičius comparison), :5790 (scheme Hom/Isom).

**Claim:** These locators support the associated general theorems.

**Witness:** Stacks 0335 lists Nagata examples; 0432 concerns stacks in setoids. Česnavičius §2 uses comparison for tori; Appendix A treats fields. Nitsure 3.5 represents module homomorphisms, not morphisms between projective schemes.

**Repair:** Use Algebra Proposition 10.162.15 (0334), `stacks line 21107`, for finite-type Nagata stability, and Categories Lemma 4.41.2 (004B), `stacks line 4451`, for 2-Yoneda. Keep 0335 where the README really discusses examples, and 0432 where it discusses setoids. Give the arbitrary-base smooth-group comparison its own primary locator at that generality (the cited paper points to Grothendieck's Brauer III, 11.7). Give scheme Hom/Isom its own graph-open-locus theorem and dependencies, separately from Nitsure's Quot theorem. On `R[T]` for Nagata `R`, the first corrected proposition has exactly the needed hypothesis; 2-Yoneda preserves the automorphisms in a fibre groupoid. For `Hom(ℙ¹,ℙ¹)`, degree-one graphs form `PGL₂`, dimension 3; Nitsure's linear module-Hom scheme is a different object.

## R16 (P3) — Supply a mathematical locator and explicit needs for §0.7a

**Location:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:819`–:845, “Supply the linear elimination step”; the subsection has no `*Needs:*` clause.

**Claim:** The new linear normalization, elimination, and geometric projection assertions have the required sources and supplier contracts.

**Witness:** The subsection cites library declarations and a pull request, but no mathematical theorem/page for the stronger prescribed-generator statement. Its leading-form elimination route and base-change claims also have no source locator.

**Repair:** In the successor, attach a legal primary/textbook locator supporting the infinite-field, reducible and nonreduced generality; state the explicit needs for polynomial evaluation, transitivity of finite maps, lying-over, and the scheme/algebra finite-map comparison. Keep this as mathematical existence and proof inputs, not an executable elimination algorithm. The check `f=XY(X+Y)` over `𝔽₂` gives dehomogenization `a(a+1)`, zero at both field elements; the infinite-field evaluation input is essential. The source mentioned in the PR data as Kirby, pp.128–129 could not be obtained through the source service, so its contents are not certified here.

## Verified sound

The numerical tests below are computations on concrete instances, not proofs of the universal statements. The retained rows cover the fifteen seeded targets, the summary's headline theorems, and all findings with mathematical content. The source, elaboration, and ownership evidence following them records what each kind of check establishes.

| Statement/definition | Instance tried | Computed values on the two sides / discriminant | Result; change |
|---|---|---|---|
| §0.1 quasi-coherent algebra | `Spec k`, algebra `k[ε]/ε²` | Sections and algebra both have basis `1,ε`, with `ε²=0`; zero multiplication would give `1·1=0≠1`. | Pass; none. |
| §0.1 direct-image algebra | Finite `Spec k[ε]/ε²→Spec k` | Pushforward sections `k⊕kε`; relative spectrum recovers the same length-2 scheme, not its reduced point. | Pass; none. |
| §0.3 general relative Proj | Two projective lines over `k` | Degree zero `k×k`; every Veronese retains `k×k`; Proj has two components. | Old R04 repaired. |
| §0.3 base change | `A=k[X,Y]`, field extension `K/k` | Both constructions are `ℙ¹_K`; standard chart is `Spec K[t]` on both sides. | Pass; none. |
| §0.5 pseudo-coherent module | `A=k[ε]/ε²`, `M=k` | Periodic differential `ε`; kernel and image both `(ε)`; all positive homology 0, projective dimension infinite. | Pass; none. |
| §0.5 affine criterion | Extension by zero from the generic point of a DVR | Global sections 0, restriction to the fraction field `K`; tilde of global sections restricts to 0, not `K`. | Pass; none. |
| §0.7a linear normalization | Coordinate tuple in `k[X,Y]`, infinite `k` | `C=I₂`, `d=2`, evaluation identity, module rank 1, Krull dimension 2. | Mathematical target passes; R03/R07/R16. |
| §0.7a nonreduced case | `A=k[X,E]/E²` | `y=X`, `C=(1,0)`, basis `1,E`, rank 2, dimension 1. | Pass; none. |
| §0.7a finite case and empty tuple | `A=k[ε]/ε²`; separately `A=k,n=0` | First: `d=0`, module dimension 2. Second: empty matrix, polynomial ring `k`, rank 1, dimension 0. | Pass; none. |
| §0.7a zero algebra | `A=0` | Structural map sends distinct `0,1∈k` to the same element; injectivity false; Krull dimension bottom, not natural `d`. | Pass; none. |
| §0.7a linear elimination | `f=X²+Y²` over `ℚ`, `X=Z+aT,Y=T` | Coefficient of `T²` is `a²+1`; at `a=0` it is 1; division is by a nonzero scalar. | Pass; none. |
| §0.7a finite-field obstruction | `𝔽₂[x,y]/xy(x+y)` | Forms `x,y,x+y` give quotients `𝔽₂[T]`, each infinite-dimensional; zero form also not finite. Top-form evaluation `a(a+1)=0` for `a=0,1`. | Pass; none. |
| §0.7a nonlinear comparison | Same algebra, `z=x²+xy+y²` | `zx=x³`, `zy=y³`; 9 monomials with exponents <3 span; under `y=0`, `z↦x²`, an injective polynomial substitution. | True Check; delete Lean padding. |
| §0.7a geometric projection/base change | Dual-number line, extension `K/k` | Fibres have ring `κ(s)[ε]/ε²`, length 2 and one geometric point; after extension basis remains `1,ε`, matrix `(1,0)`. | Pass; none. |
| §0.12 henselization | `(k,0)`; `(R,R)` | First henselization is `k`; second is zero ring since quotient condition admits the zero terminal neighborhood. | Pass; none. |
| §0.12 neighborhoods | `(ℤ,(5))` | Mod-5 quotients: `ℤ[1/2]` gives `𝔽₅`; `ℤ[1/5]` gives 0; `ℤ×ℤ` gives `𝔽₅²`. | Pass; none. |
| §0.20 Japanese/Nagata | Field; polynomial ring in infinitely many variables | Field finite extension integral closure has finite dimension; infinite-variable ring has non-finitely generated ideal `(x_i)`, so not Noetherian/Nagata. | Pass; none. |
| §0.23 universal homeomorphism | `Spec 𝔽₄→Spec 𝔽₂` | Original spaces each have 1 point; self-base-change has 2 points, so not universally injective. | Pass; none. |
| §0.23 universal homeomorphism | Cusp normalization; dual-number reduction | Integral surjections on spectra with singleton geometric fibres; residue extensions trivial; dual-number reduction preserves the sole point. | Pass; none. |
| §0.23a étale invariance | `k[ε]/ε²→k` | Finite étale rank-`r` split algebra is `(k[ε]/ε²)^r` before reduction and `k^r` after; rank `r` unchanged. | Pass; none. |
| §0.29 absolute Frobenius | `𝔽₄=𝔽₂[a]/(a²+a+1)` | `a↦a²=a+1≠a`; second iterate sends `a↦a`; base topological map identity in both cases. | Pass; none. |
| §0.29 relative Frobenius | `𝔸¹_k`, characteristic `p=2,3` | Map `t↦t^p`; free bases `(1,t)` or `(1,t,t²)`; ranks 2 or 3=`p¹`. | Pass; none. |
| §0.29 finite-field base change | `Spec 𝔽₂` extended to `𝔽₄` | Base change of identity fixes `a`; absolute square sends `a→a+1`. | Pass; none. |
| §0.29 recursion identities | Iterates 0,1,2 | Endomorphisms `id,F,F∘F`; zero/successor equations reduce to these same expressions. | `rfl` padding; R10. |
| §0.30 normality | Cusp `k[t²,t³]` | `t` is integral (`T²−t²=0`) but absent from ring; normalization `k[t]` contains it. | Pass; none. |
| §0.30 ramification | `k[[t]]→k[[u]]`, `t↦u²`, then `u↦v³` | Quotient lengths 2 and 3; composite length 6=`2·3`; identity length 1. | Pass; none. |
| §1.2 quasi-finite descent | Split fppf cover, two-point finite scheme | Local algebras `k²` on both components with swap-compatible descent give global rank 2; a doubled-origin line is not separated. | Pass; none. |
| §1.2 spaces gluing | Cover `U∪V=X` | Identity overlaps glue to `X`; empty union yields empty algebraic space, not a point. | Pass; none. |
| §1.11 QCoh definition | Representable `Spec A`; empty space | Descent category is `A`-modules; empty-site module category has only zero object. | Pass; none. |
| §1.11 folded-line QCoh | Structure sheaf, char ≠2 | Descent invariants `f(t)=f(−t)` are `k[t²]`; odd term `t` fails. | Pass; none. |
| §1.11 non-QC sheaf | `j_!O` from `Spec ℤ[1/2]` | Global sections 0; after restriction `ℤ[1/2]≠0`; localization of 0 remains 0. | Pass; none. |
| §1.17 Artin bootstrap | Identity atlas of a scheme | Flat, locally finitely presented, locally surjective map is identity; pullback to `T` equals `T`. | Pass; none. |
| §1.18 stacks / 2-Yoneda | One-object groupoid with group `C₂` | Fibre has 1 object and 2 automorphisms; evaluation equivalence must retain both automorphisms. | Wrong setoid locator corrected in R15. |
| §1.23 Keel–Mori / tame | `BC_p`, characteristic `p` | Coarse space one point; averaging would divide by 0, invariants not exact; finite inertia still holds. | Pass; none. |
| §2.10 topology comparison | `Spec ℝ`, `μ₂` | `H¹_Zar=0`; `H¹_et=ℝ×/ℝ×²=C₂`. | Pass; none. |
| §2.10 smoothness control | `Spec 𝔽_p[t,t⁻¹]`, `μ_p` | Units `𝔽_p××t^ℤ`; modulo pth powers `ℤ/p`; étale sheaf trivial, `H¹_et=0`. | Non-smooth case excluded; locator R15. |
| §2.13 distinguished square | `p(s)=s²+2s`, remove `−1,−2` | Derivative `2(s+1)` invertible; preimage of 0 was `{0,−2}`, now `{0}`. | Pass; none. |
| §2.13 extra point | `U=∅`, `V=Spec ℝ⊔Spec ℂ` | Exactly 1 rational lift but 2 total points; complement map not an isomorphism. | Pass; none. |
| §2.13 sheaf criterion | Constant two-element presheaf with identity restrictions | Every square is a pullback of `2→2←2`; empty-cover matching set has 1 element versus `F(∅)` with 2. | Pass; none. |
| §2.13 qc basis | Infinite disjoint union of field points | Infinite discrete cover has no finite subcover; identity of field has 1-point finite subcover. | Pass; none. |
| §2.16 Tsen | `k(t)` with algebraically closed `k` | Brauer group 0; split `M₂(k(t))` has class 0. Over `ℝ`, quaternion class instead has order 2. | Pass; none. |
| §2.16 curve `Gm` | `𝔸¹_k`, `ℙ¹_k`, algebraically closed `k` | Picard groups 0 and `ℤ`; both `H²(Gm)=0`; degree on `O(1)` is 1. | Pass; none. |
| §2.16 proper hypercover | Normalization of a rational nodal cubic | Normalization genus 0; gluing the two node preimages creates one loop, `H¹(C,ℤ/n)=ℤ/n`. | Pass; none. |
| §2.18 affine derived equivalence | `Spec k`, complex `k --id→ k` | Cohomology 0 in both degrees in `D(k)` and `D_QCoh`; zero differential instead gives `k` in each degree. | Pass; none. |
| §2.18 derived gluing | Zero complex and a negative-Ext control | Zero complex has all negative Homs 0; for `K=k,L=k[1]`, `Hom(K,L[−1])=k≠0`. | Pass; none. |
| §2.19 coherent duality | Finite point `Spec L→Spec k` | Right adjoint on `k` is `Hom_k(L,k)`, dimension `[L:k]`; cannot replace it by a 1-dimensional `k`-space. | Correct finite-map model; absent full headline R11. |
| §2.22 Azumaya | `M₂(k)` and zero algebra over nonzero `k` | Left-right map dimensions 16→16 and isomorphism for matrices; zero map 0→0 also bijective but faithfulness fails. | Pass; none. |
| §2.22 Brauer class | Quaternion algebra over `ℝ` | Class nonzero of order 2; after `ℂ`, algebra `M₂(ℂ)`, class 0. | Pass; none. |
| §3.4 graded Picard symmetry | Degrees 1 on connected affine line | Symmetry is constant −1; origin-only degree would demand −1 at origin and +1 generically, not a polynomial unit. | Local constancy repairs old R02. |
| §3.4 disconnected grading | `Spec(ℚ×ℚ)`, degrees `(0,1)` | Koszul self-sign `(1,−1)` is a regular unit. | Pass; none. |
| §3.6 pointless Picard | Real conic `x²+y²+z²=0` | Real points 0; geometric curve `ℙ¹`; degrees of actual real line bundles `2ℤ`, geometric Picard degree group `ℤ`. | Pass; none. |
| §4.2 Artinian coefficients | `A=k[ε]/ε²` | Maximal ideal `(ε)`, residue `k`, dimension over `k` 2; `k[t]_(t)` not Artinian. | Pass; none. |
| §4.2 small extension | `k[t]/t³→k[t]/t²` | Kernel `(t²)`, dimension 1, killed by maximal ideal; identity kernel 0 is not a nonzero small extension. | Pass; none. |
| §4.4 hull / prorepresentability | Same functor | Hull is `k[[t]]`, tangent dimension 1, map on tangent identity; adjoining unused `u` gives tangent dimension 2 and is not minimal. | Pass; none. |
| §4.7 adic tower | `k[t]/t^(n+1)` | Transition kernel at level 2 is `(t²)`; square of ideal of level 0 in level 2 also `(t²)`. | Pass; none. |
| §4.7 wrong tower | Level 0 `k`; all positive levels `k[t]/t³` | Transition from level 1 to 2 identity, kernel 0; required square `(t²)≠0`. | Pass; none. |
| §4.7 constant system | `ℙ¹_k` versus `Spec k[t]` | First nonaffine of dimension 1 with sections `k`; second equals `Spf(k[t],0)` at every level. | R02 restricts affine-spectrum Check. |
| §4.7 level-preserving map | Identity `k[[t]]`, ideals `(t)` and `(t²)` | `(t)²⊆(t²)` gives continuity; `(t)⊄(t²)` prevents level preservation. | Pass; none. |
| §4.9 formal functions | Proper finite `Spec k→Spec k[[t]]` | `H⁰=k`, completion `k`, every quotient system term `k`, inverse limit `k`; map not flat. | Pass; none. |
| §4.9 Stein factorization | Finite `Spec(k×k)→Spec k` | Relative Spec of pushforward is two points; first map identity, its fibres singleton; second finite degree 2. | Pass; none. |
| §4.10 coherent existence | `X=Spec k[[t]]`, free modules rank 2 | Reductions `(A/t^(n+1))²`; limit `A²`; rank stays 2. | Pass; none. |
| §4.10 full faithfulness | `M=N=O`, geometric-series residues | Compatible multipliers `1+t+…+t^n` have unique limit `(1−t)⁻¹`; pair `0 mod t,1 mod t²` incompatible. | Statable missing headline; R06. |
| §4.10 scheme morphisms | Identity proper affine `Spec A` over `A` | Over-base endomorphism count 1; each reduction also count 1; unique compatible lift identity. | Pass; none. |
| §4.14 Quot/Hilbert | `X=Spec k,E=k³,r=1`; length-2 subschemes of `ℙ¹` | Quot is `ℙ²`, dimension 2; `Hilb²(ℙ¹)=Sym²(ℙ¹)=ℙ²`. | Pass; none. |
| §4.14 scheme Hom/Isom | `ℙ¹_k→ℙ¹_k`, degree 1 | Isom locus `PGL₂`, dimension 3; graph has bidegree `(1,1)`. | True target; different source needed, R15. |
| §4.18 residual chart | `uv=s³t`, substitute `u=sa,v=sb` | Equation `s²(ab−st)=0`; strict transform `ab=st`, dimension 3, tangent dimension 4 at origin. | True worked example; R10 removes padding. |
| §4.19 field alteration | `ℙ¹_k`, empty boundary | Identity generic degree 1; compactification `ℙ¹`, projective=true, proper=true, regular=true. | Full source conclusion stronger; R05. |
| §4.20 trait alteration | `ℙ¹_{k[[t]]}` | Identity base extension degree 1; smooth special fibre multiplicity 1; total space regular and projective. | Projectivity must remain; R05. |
| §5.8 GRR/HRR | `O(d)` on `ℙ¹` | `ch=1+dH`, `td=1+H`, top coefficient `d+1`; Euler characteristic also `d+1`, including `d=−2` giving −1. | Pass; none. |
| §5.10 adjunction and Hodge | Same surface, `H=F₁+F₂`, `D=F₁−F₂` | `H²=2`, `H·D=0`, `D²=−2`; canonical class `−2F₁−2F₂`, `K²=8`, `c₂=4`, sum 12. | Pass; none. |
| §5.11 Weil bound | `ℙ¹(𝔽₂)` and `ℙ¹(𝔽₃)` | Counts 3 and 4; `\|N−(q+1)\|=0`, RHS `2g√q=0`. | Pass; none. |
| §5.11 nonzero genus control | `E:y²=x³−x` over `𝔽₃` | Three affine points `(0,0),(1,0),(2,0)` plus infinity: `N=4`; genus 1, deviation 0≤`2√3`. | Pass; none. |

There are **72 computed rows** above, retained for the seeded sample, headline theorems and findings. The infinite-field restriction is not a route-specific shortcut: the four linear forms over `𝔽₂` refute unrestricted linear normalization; ordinary normalization over every field remains imported. No outside-folder change, copied passage, `set_option`, or computational implementation was found in the reviewed diff.

**Headline inventory** (README :17–:23, plus §0.7a):

| Headline | Acceptance coverage |
|---|---|
| Henselization and universal property | `Henselization.henselian`, `existsUnique_lift`. |
| Artin bootstrap | `Groups.artinBootstrap`, with atlas hypotheses. |
| Keel–Mori | Absent; missing coarse-moduli/stack carrier must be named. |
| Coherent Grothendieck duality | Affine equivalence/gluing present, not the upper-shriek adjunction. |
| Scheme Brauer-class map | Affine splitting present, nonaffine class construction absent. |
| Pointless-curve Picard torsors | Affine Picard comparison present, torsor/obstruction headline absent. |
| Schlessinger | Absent; deformation-functor/hull carriers are README targets. |
| Coherent existence | Object effectivity present; statable full faithfulness absent, R06. |
| Scheme-morphism algebraization | `Formal.algebraize_hom` present. |
| Two alteration theorems | Weaker properness substitutes, R05. |
| GRR and Hodge index | Absent; completed Chow operations/numerical intersection carriers missing. |
| Weil bound | Present with proper, smooth, geometrically integral, dimension-one and finite-genus hypotheses. |
| Linear normalization | Statable but only in companion, R07. |

**Seeded source audit.** No README locator is explicitly labelled unverified. All texts below were obtained through the legal source service. Chapter names disambiguate the single `stacks` key; pages are those of the fetched versions. This certifies these passages, not every incidental citation in the README.

| Target | Actual text checked | Outcome |
|---|---|---|
| 0.1 | `stacks line 159`, Constructions §27.3, p.4; `stacks line 2134`, Schemes Lemma 26.24.1, p.46 | Algebra charts and qcqs direct images supported. |
| 0.7a | Pinned declarations below; no mathematical locator in subsection | Stronger theorem's source uncertified, R16. |
| 0.23 | `stacks line 5009`, Morphisms Lemma 29.46.5, p.110 | Integral + universally injective + surjective, no finite-type hypothesis. |
| 1.2 | `stacks line 8204`, More on Morphisms 37.57.1, p.169; `stacks lines 747,791`, Bootstrap 80.11.1/3, pp.17–18 | Separated locally-quasi-finite descent and space gluing supported. |
| 1.11 | `stacks lines 2470,2480,2703`, Properties of Spaces 66.29.1/2 and 66.32.1, pp.53–59 | QCoh definition, pullback, presentation descent supported. |
| 2.10 | `stacks lines 10152,10334,10347`, Étale Cohomology §59.100, especially 59.100.7/8, p.217; `stacks line 1322`, Descent 35.9.3 | General étale-to-fppf and QCoh comparison supported; smooth-group attribution R15. |
| 2.13 | `morel-voevodsky lines 1790,1802,1830,1851,1858`, §3.1 Definition 1.3, Proposition 1.4, Lemmas 1.5/6, Remark 1.7, pp.96–98 | Complement isomorphism, splitting route, Mayer–Vietoris checked; README supplies necessary empty-object clause. |
| 2.16 | `stacks lines 5038,5041`, Étale Cohomology 59.67.12/§59.68, pp.109–111; `stacks lines 3444,3460`, Simplicial Spaces 85.36.4/6 | Tsen/curve vanishing supported. Proper hypercover theorem allows arbitrary abelian sheaves, not just torsion. |
| 2.18 | `stacks lines 77,145,1031`, Derived Categories of Schemes 36.3.1/5, §36.10, pp.2,4,23–25 | Coproducts, affine equivalence, pseudo-coherence criteria checked. |
| 2.22 | `stacks line 4400`, Étale Cohomology 59.62.2, p.96; native Azumaya definition | Degree annihilates constant-degree class. Grothendieck originals unread; Stacks proof slip below. |
| 4.2 | `stacks lines 150,168,251,404`, Formal Deformation Theory §90.3–4, beginning p.4 | Finite coefficient map, nonzero principal small kernel, pullback along surjection, completion checked. |
| 4.4 | `stacks lines 2185,2291,2700`, Formal Deformation Theory 90.15.1/5 and 90.18.2, pp.45–47,55 | Complete-local residue setting in README §4.3 makes `Der_Λ(k,k)=0`; classical criterion valid. Original Schlessinger unread. |
| 4.7 | `stacks lines 1054,1085,1112`, Formal Spaces 87.9.9/10 and tower construction, pp.24–25 | Affine spectrum and contravariant map checked; level-preserving restriction explicit; R02 persists. |
| 4.9 | `stacks line 2604`, Cohomology of Schemes 30.20.5, p.54; `stacks line 7649`, More on Morphisms 37.53.4, p.158 | No flatness needed; Stein first map geometrically connected, second finite. |
| 4.14 | `nitsure lines 460,619–715,771,948–972`, Theorems 2.3,3.3–7,4.3,5.1–3, pp.11,15–19,24 | Quot/Hilbert supported; scheme Hom/Isom attribution R15; source error below. |

Also read: `de-jong lines 597–606,1253–1259`, Theorems 4.1/6.5, pp.66/83; `milne-2024 lines 1461–1495`, Theorem 11.53, Corollary 11.54, Example 11.55 and Weil proof, pp.37–38. The latter gives `F₁²=F₂²=0`, `F₁·F₂=1`, `def(Δ)=2g`, `def(Γ_F)=2gq`.

**Pinned declarations opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These fourteen declaration sites were inspected:

- `Mathlib/RingTheory/NoetherNormalization.lean:274` and :287: `exists_integral_inj_algHom_of_fg`, `exists_finite_inj_algHom_of_fg`; arbitrary fields and nontrivial finite-type algebras, no prescribed linearity.
- `Mathlib/Algebra/MvPolynomial/Funext.lean:82`: `MvPolynomial.funext`, infinite integral domain.
- `TauCeti/RingTheory/KrullDimension/FiniteType.lean:99`: `ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial`, no domain/reducedness on the receiving algebra.
- `TauCeti/AlgebraicGeometry/RelativeSpec/Functor.lean:159`: `QuasicoherentAlgebra`, algebra objects with quasi-coherent underlying module; `RelativeSpec/Basic.lean:136`: actual sections and restriction maps in `CommMon.sectionsPresheaf`.
- `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean:61`: local free generators, **no finite-rank condition**.
- `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:236`: `pullbackComp`, direction `pullback g ⋙ pullback f ≅ pullback (f ≫ g)`.
- `Mathlib/Topology/LocallyConstant/Basic.lean:212`: bundled local-constancy proof, not a bare function.
- `Mathlib/Algebra/Azumaya/Defs.lean:60`: finite projectivity, faithfulness, bijective left-right multiplication; :52 fixes formula `a*x*b`.
- `Mathlib/Algebra/Homology/LocalCohomology.lean:173`: colimit-of-Ext carrier; geometric support comparison remains additional.
- `Mathlib/RingTheory/RamificationInertia/Ramification.lean:52`: localized quotient length, junk value 0 for nonprime ideals.
- `TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64`: explicit finite-dimensional `H¹` binder; retained in the Weil signature.

Object searches used `roadmaps grep`, main, given open checkouts and readable board packages. No existing prescribed-linear-normalization target or new fully qualified name collision was identified. Resolved main contracts include AlgebraicVectorBundles L0B/L1A/L1B/L2A/L2B (:228/:269/:290/:306/:340), StableReduction 0–4 (:343–:551), ModularCurves 0F/0G (:412/:427), JacobianChallenge C (:143–:208), AlgebraicCurves 3/4/7/8/12 (:520/:578/:783/:870/:1468), ClassFieldTheory 5 (:920), ProfiniteCohomology 9 (:1363), and GrothendieckEulerForms 2 (:238). They distinguish supplied carriers from new comparisons; R01 records the return edges. The base owns its existing content, while the new extension needs successor ownership. The scanner's 356 unresolved-name leads were not treated as 356 missing-library findings: many are local proposed API names.

**Elaboration and gate.** Original `Suggested.lean`: exit 0, only `sorry` warnings. Scratch `#check @name` runs: **225 named declarations + 10 companion declarations**, exit 0. Inspected types retain the explicit field, prime, finiteness, completeness and scalar-tower hypotheses used here; normalization retains `Infinite k`, `Nontrivial A`, generation. No binders were changed. One-tactic probes of **103 named sorried theorems + 3 companion theorems** tried `rfl`, `simp`, `infer_instance`; five successes appear in R10. The additional coherent-Hom signature also elaborated. These runs do not prove the remaining admitted theorems.

Requested dependency command output:

```text
depcheck: 204 roadmaps, 1501 edges, 0 problem(s)
```

No `UPWARD` or `CYCLE` line; manual cycle R01 remains. Supplied gate at this head:

```text
set_option=0 blob=0 latex=0 tex=65 prnum=1 sorry-data=25 sorry-examples=101 residue=0 private-paths=0 imports=1 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=15 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL
```

All failing rules are covered by R04/R08/R09/R12/R13/R14. Companion imports were additionally checked manually. Outside-folder diff empty; worktree unchanged.

## Not verifiable

- Sampled originals unobtained: **Grothendieck Brauer I/II/III** (no legal copy resolved), **Schlessinger Theorem 2.11** (AMS landing page only), **Kirby pp.128–129** (PR-data citation unresolved). The Stacks checks above do not certify these printed locators.
- Other retrieval failures: **Cheng–Lian–Murayama** (NSF timeout), **Liu** (Oxford 403), **Kleiman** (JSTOR landing page), **Grothendieck 1957** (resolution/rate limit), **Knudsen II** (journal host unclassified), **Kisin/Poonen** (AMS landing pages), **Milne Algebraic Groups** (Cambridge landing page). EGA I/IV₃ were subsequently obtained from Numdam.
- Uncertified/paywalled resolutions: **Fulton, Hartshorne, SGA 4 XVI, SGA 6, Grothendieck 1966, Deligne–Mumford, Huber, Benoist–Wittenberg, Benoist, Thomason–Trobaugh**. Their cited passages are not certified. Accessible Hoyois notes do not certify Thomason–Trobaugh's printed locator.
- **Ownership limits:** AbundanceStatement and CommRingFactorizationSystems are absent from supplied main; their open heads were not among the explicit checkout paths. Their contracts are not certified, and no missing-declaration finding is inferred. Other unspecified open heads and remote board-package heads absent locally were not independently checked. The readable Part II design was checked.
- Concrete tests are not exhaustive proofs of every API bullet. Source certification is limited to the passages recorded above; `sorry` elaboration does not settle the derived-category, quotient or moduli constructions.

## Source issues

- **Error** in stacks at Étale Cohomology Lemma 59.62.2 (0A2L), printed p.96, `stacks line 4408`: the source says the exterior power is the entire sign-isotypic tensor submodule; it should be the antisymmetrization image, potentially smaller in small characteristic; affects the proof.
- **Misprint** in stacks at Formal Spaces §87.9 after Definition 87.9.9, printed p.24, `stacks line 1072`: the source says the ring map is B→A while the spectrum map is Spf B→Spf A; it should be A→B, as the next lemma states; affects nothing.
- **Error** in morel-voevodsky at §3.1 Proposition 1.4, printed p.96, `morel-voevodsky line 1802`: the source says preserving distinguished pullback squares characterizes Nisnevich sheaves; it should also require a singleton value on the empty scheme; affects a stated result.
- **Error** in nitsure at Theorem 3.7(3), printed p.17, `nitsure line 703`: the source says constant fibre cohomology dimension forces locally free higher direct image over any Noetherian base; it should require reduced base for this implication, or stronger base-change hypotheses; affects a stated result.

Witnesses: in characteristic 2, rank 2, sign-invariant tensors have dimension 3 while the exterior square has dimension 1. The constant two-element presheaf fails the empty cover. A nontrivial first-order degree-zero line-bundle deformation on an elliptic curve over `A=k[ε]/ε²` has cohomology model `[A --ε→ A]`: the sole fibre has dimensions `(1,1)`, while cohomology modules are `k`, not free over `A`.
