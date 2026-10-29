<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2099#issuecomment-6485814284 -->
Red team round 2 pass a (codex) of 64fe6dc

Verdict: needs_changes

1. **F01** (P1) The two imported roundness declarations do not exist at the pin

   **Location:** packages/QuadraticFormInvariantsPartII/README.md:224–225 and 737–739: `TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet` and `TauCeti.twoFoldPfister_smul_equivalent_of_mem_unitValueSet`.

   **Claim:** These are the pinned low-fold roundness suppliers.

   **Witness:** At Tau Ceti `358314d4`, TauCeti/LinearAlgebra/QuadraticForm/Witt/Round.lean:44,61 instead declares `oneFoldPfister_smul_equivalent_iff` and `twoFoldPfister_smul_equivalent_iff`. Repository-wide searches find neither cited name. Both existing equivalences assume only a commutative ring.

   **Exact repair:** Replace each `*_smul_equivalent_of_mem_unitValueSet` citation by the corresponding `*_smul_equivalent_iff`, specifying its reverse implication for roundness. Say that the comparison with the diagonal presentation uses invertibility of two, whereas these imported diagonal roundness theorems themselves hold over commutative rings. For `⟨1,1⟩` over ℚ and `c=2`, the value `(1,1)` gives membership and the reverse implication gives the required similarity.

2. **F02** (P2) The coefficient-field headline remains absent

   **Location:** packages/QuadraticFormInvariantsPartII/README.md:1656–1670, “there is a subfield `E ⊆ O` mapping isomorphically onto `κ`”; packages/QuadraticFormInvariantsPartII/Suggested.lean:286–304.

   **Claim:** The acceptance file contains the statable deep results. The repair added four of the five omissions in a-F10, but no coefficient-field theorem.

   **Witness:** Mathlib's `ValuationSubring`, `IsLocalRing.residue` and `RingHom` already state a residue section. The existing `quadraticPfister` states its isometry consequence. The repair's reason, that this is inside a source proof, does not make the native-carrier theorem unstatable.

   **Exact repair:** Add a headline asserting, for a henselian valuation subring `O` of a field `K` with characteristic-zero residue field, existence of `σ : IsLocalRing.ResidueField O →+* O` with `(IsLocalRing.residue O).comp σ = RingHom.id _`; include relative algebraic closedness of its image and the unit-Pfister transport of §6.1, or state these as a second headline on that section. Name it in §6.1 and the module's stated-headline inventory. No new heavy carrier is required. On ℚ((t)), σ is constant inclusion, and the terminal transport `[1,t] ≅ [1,0]` uses the square root of `1−4t`.

   This is the unrepaired fifth part of a-F10. The source's presentation as an intermediate step is not an exception to the acceptance-test rule for deep intermediate results expressly owned and stated by this roadmap.


3. **F03** (P1) The replacement metabolic-to-hyperbolic target duplicates its supplier

   **Location:** packages/QuadraticFormInvariantsPartII/README.md:573–574: “Prove that strictly metabolic nonsingular quadratic forms over a field are hyperbolic”.

   **Claim:** This is the new work retained in §0.5 after importing the quadratic Witt carrier.

   **Witness:** TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md:529–543, §3.5, already owns `strictly_metabolic_hyperbolic` for 1-quadratic structures on finitely generated projectives, explicitly including classical quadratic forms. Fields and their finite-dimensional spaces satisfy these hypotheses.

   **Exact repair:** Replace that sentence by: “Import the identification of strictly metabolic quadratic forms with hyperbolic forms from HermitianKTheoryOfPoincareCategories §3.5 (`strictly_metabolic_hyperbolic`), specialized to finite-dimensional vector spaces. Identify its hyperbolic object with the coordinate hyperbolic plane of §0.1.” Add §3.5 to the supplier contract and §0.5 Needs. Retain the tensor action and filtration here. For `xy` over 𝔽₂, the first coordinate is a Lagrangian and the supplied hyperbolic object is precisely this plane. This is a new duplication introduced by the a-F17 repair, not a request to reconstruct the carrier again.

4. **F04** (P3) The integral-comparison ownership locator is stale

   **Location:** packages/QuadraticFormInvariantsPartII/README.md:92: “GeometryOfNumbersAndQuadraticArithmeticPartII §DA.0”.

   **Claim:** The cited section owns the commutative-ring quadratic-to-symmetric Witt comparison.

   **Witness:** At the supplied current head, TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:93–112 calls this §0.1, “Integral Witt comparison”. There is no §DA.0 in that README. Its full-polar normalization is explicit.

   **Exact repair:** Replace “§DA.0” by “§0.1 (Integral Witt comparison)”. Keep the comparison's full-polar convention: over ℚ the inverse sends `b(x,y)=xy` to `x²/2`, whose polar at `(1,1)` is `1`. This agrees with that supplier and does not change §0.5's separately specified diagonal comparison.

5. **F05** (P2) The coefficient-field proof retains the additive valuation convention

   **Location:** packages/QuadraticFormInvariantsPartII/README.md:1666–1667: “An element of K algebraic over E has value zero”.

   **Claim:** The algebraic elements have value zero, in a layer governed by the multiplicative convention of README:156–161.

   **Witness:** In ℚ((t)) with coefficient field ℚ, `2` is algebraic over ℚ and `O.valuation 2 = 1`, not `0`. Only the zero field element has multiplicative valuation zero.

   **Exact repair:** “Every nonzero element of K algebraic over E has multiplicative value 1. Its residue lies in κ; the minimal polynomial over E reduces to the same separable polynomial over κ, so uniqueness of a lift of its simple residual root puts the element in E. The zero element already belongs to E.” Add the Check “For E=ℚ in ℚ((t)), v(2)=1 and v(0)=0.” The witness now satisfies the corrected statement. The Layer 4 maximum-value repairs remain correct.

## Earlier findings: verification at this head

Each row refers to the earlier pass's own IDs. Quotes below are from the repaired package, not from sources. “Repaired” concerns the specified original defect; independent fresh defects are listed above. None of the repair report's findings was marked “not actionable in this package”. The differently applied a-F10 remains partly repaired.

| Earlier finding | Status | Repaired passage and current location | Recomputed witness |
|---|---|---|---|
| a-F01 | repaired | README:678–695, “for `n = 1` when `2` is invertible”; “need not generate” | `I_q(𝔽₂)=ℤ/2` is generated by `[1,1]` although `2=0`; over 𝔽₂(t), `t[1,1]` has odd-degree nonzero values and cannot represent `1`. Sufficient is correct; necessary is false. |
| a-F02 | repaired | README:1314–1317, “nonsingular quadratic `n`-fold Pfister form”; “`1 − 4a₀ ≠ 0`” | `[1,1/4]` has determinant `0` and no Witt invariant; `[1,0]` has determinant `−1` and invariant `0`. |
| a-F03 | repaired | README:800–805, “quotient by the quadratic radical”; “If the quotient is anisotropic” | `x²` on ℚ² has a nonzero radical vector but never represents `−1`; quotient is the anisotropic line. `(x+y)²` over 𝔽₂ never represents `t`; quotient is again a line. |
| a-F04 | repaired | README:826–829, “zero-dimensional one included”; generic-value clause “`n ≥ 1`” | For `ψ=0` on dimension zero and `q=⟨1⟩`, inclusion/subform/generic-unit membership have values T/T/F. Lean:113 keeps only the true equivalence. |
| a-F05 | repaired | README:1408 and 1470, “greatest value”; “unique maximum” | With `v(t)=c<1`, `v([1,1](1,t))=1=max(1,c)²`, whereas `min(1,c)²=c²`. Separate remaining convention error: S05. |
| a-F06 | repaired | README:1410–1414, choose `q(y)` a unit and lift the monic polynomial | In 𝔽₂((t)), `q=[1,t]⊥(1+t)[1,t]`, `x=(1,0,1,0)`, `y=e₂+x`: `q(x)=t`, `q(y)=1`, `b(x,y)=1`, so `q(x+sy)=t+s+s²`. |
| a-F07 | repaired | Suggested.lean:238–241, “when `2` is a unit”; “`a₀ = ε₀` in equal characteristic two” | In 𝔽₂((t)), terminal slot `1` gives anisotropic `[1,1]`; incorrectly dividing by `4` would give `[1,0]`, hyperbolic. |
| a-F08 | repaired | README:665, “`Fin (2ᵐ) × Fin 2 → F`” | At `m=0,2`, dimensions are `2,8`, matching Lean:62; the old Cartesian product gave `3,6`. |
| a-F09 | repaired | README:1284–1294, bilinear Milnor comparison is a target here; inverse then `blochGabberKato` | Over 𝔽₂(t), `⟨1,t⟩_b` maps to nonzero `dt/t`; at degree zero both sides are ℤ/2. The supplier provides differential norm residue, not this Witt comparison. |
| a-F10 | partly repaired | Suggested.lean:113,133,148,270 add representation, norm, similarity and Lang–Nagata | The zero-dimensional representation case is T/T; identity norm is `c`; constant similarity polynomial gives `c²`; empty system with `N=1` has vector `1`. The fifth omission, §6.1's coefficient-field headline, persists: S02. |
| a-F11 | repaired | README:1235–1248, “cohomological degrees at most the weight”; README:1260–1268 uses comparison inside induction | Weight zero, degree one over ℚ: motivic group `0`, Galois group nonzero. Degree `n−1` in weights `n−1,n` is inside the corrected range. |
| a-F12 | repaired | README:1220–1224, “no equality ... on general schemes is assumed or used” | `⟨1,−t⟩∈I(ℚ(t))` has second residue `⟨−1⟩≠0`; it is not an unramified section on 𝔸¹. This avoids the unsupported ideal-power identification. |
| a-F13 | repaired | README:1554–1558, handle algebraically closed fields separately, whatever `i` | ℂ is `C₁` but has no normic form of degree greater than one; `N>rdⁱ≥r` instead permits §5.2. |
| a-F14 | repaired | README:1191–1204 cites Theorem 2.3, Theorem 2.12 and “Lemma 3.11 and its proof, p. 90”; README:1830–1844 uses p.11 | morel lines 277,532,914 distinguish purity, quotient comparison and flasqueness; dp line 485 starts §3.C on p.11. |
| a-F15 | repaired | README:629, “signature 4 ... not divisible by 8”; README:1622–1624 gives three constant fields | `4∈4ℤ`, `4∉8ℤ`; constants of 𝔽₄(t), ℚ(√2)(t), ℚ̄ are 𝔽₄, ℚ(√2), ℚ̄, not their prime fields. |
| a-F16 | repaired | README:1670–1673, terminal discriminant ratio is a principal unit | Over ℚ((t)), `m=0,a₀=t,b₀=0`: `1−4t` is a square, so `[1,t]≅[1,0]`. The previously untreated binary factor now moves. |
| a-F17 | partly repaired | README:568–573, “It is not constructed here”; imports Hermitian §§3.4,4.5,7.9 | Over 𝔽₂ the imported quadratic Witt group retains `[1,1]≠0`, whereas its symmetric polar class is zero. Carrier repair is correct; the replacement target duplicates §3.5 (S03), and the retained DA.0 locator has drifted (S04). |
| a-F18 | repaired | README:1731–1746 explicitly proves the degree-two step and imports ArithmeticGaloisDuality §§R02.4.2,4.3,4.5,4.6 | `A=0` gives `0→0`; weight `−2` module ℚ₂/ℤ₂(1) fails surjectivity by the sum-of-local-invariants condition, and is excluded. |
| b-F01 | repaired, conditional on declared gap | README:289–291 and 1775–1781 name `gap:real-closure-uniqueness`; design/plan.json has the same slug | ℚ(√2) has two orderings; fixing one selects one sign of √2 and hence the unique ordered embedding into its real closure. Existence alone does not assert this uniqueness. |
| b-F02 | repaired | README:800–805, the quotient-by-radical branch | `(x+y)²` over 𝔽₂ has radical `⟨(1,1)⟩`; quotient line never represents `t`. Same computation as a-F03. |
| b-F03 | repaired | README:1201–1204, “Lemma 3.11 and its proof, p. 90” | morel lines 914–924 explicitly use the flasque sheaf; Theorem 2.12 instead identifies the graded Witt sheaf. |
| b-F04 | repaired | README:1196–1198 names Lemma 2.14, p.81 and p.78 for odd-degree injectivity | morel lines 611 and 511 contain the respective Arason attributions. The original paper remains uncertified, as instructed. |
| b-F05 | repaired | README:267–271,302–305,372–376 add the three contracts | Current DWP §§7.12,7.15 supply weights; ClassFieldTheory Layer10 supplies Brauer injectivity; GF.5 gives `rr+trdeg(residue)≤trdeg`. For 𝔽_p(t), `1+0=1`. |
| b-F06 | repaired | Suggested.lean:238–241 explicitly distinguishes the two terminal-slot formulas | Same 𝔽₂ terminal values `1` versus `0` as a-F07; no division by four remains in equal characteristic two. |
| b-F07 | repaired | Suggested.lean:227–231 omits `ha₀`; README:1453–1454 supplies the singular control | Over ℚ₃ with `ε=4,a₀=1/4`, the displayed form at `(2,0,1,0)` is `4−4=0`. In residue characteristic two the discriminant is automatically a unit. |
| b-F08 | repaired | README:1411–1414 chooses a unit quadratic coefficient before applying Hensel | In the explicit test, old coefficient `t` is a nonunit; new coefficient `1` is a unit and derivative at residual zero is `1`. Same witness as a-F06. |

## Verified sound

Read all 1,978 README lines and all 306 Suggested.lean lines at the requested head, the repository README and CONTRIBUTING rules, all 26 earlier findings and the repair report. Counts: **21 Lean declarations** (6 definitions, 15 admitted theorems); **50 numbered README targets**, **10 bold conventions**, **4 bold worked examples**; **162 README Check bullets evaluated**; **34 source-locator groups** recorded below; **16 supplier contracts**, plus the additional integral-comparison ownership citation, resolved against current supplied copies. A group below may contain several theorem locators; the source count is groups, not individual occurrences of citations. Findings S01–S05 delimit the exceptions to the checks reported here.

No theorem in Suggested.lean is a one-tactic API lemma, boundary-case theorem or disguised Check. Its six definitions have real bodies and are used by headline theorems. The 15 statements have explicit binders, no section-variable retention problem, no `True` placeholder, no sorry'd data, and no `set_option`. The imports are `Mathlib` and four existing Tau Ceti modules. There is no new declaration with the same fully qualified name in the searched main, Completed, board-package or supplied open-head Lean files. The PR diff is confined to this package folder. No computational algorithm is planned in place of the mathematical theory.

### Headline coverage

The acceptance file states roundness and isotropy/hyperbolicity, Cassels–Pfister, the representation theorem, Springer, the similarity norm principle, quadratic similarity, the characteristic-not-two Hauptsatz, the cohomological Milnor comparison, invariant-zero detection, the principal-unit and independent-value criteria, Tsen–Lang, Lang–Nagata for systems, and the dimension theorem. These are the 15 admitted headline theorems.

The module docstring explicitly defers the characteristic-two Hauptsatz/invariant-zero criterion (quadratic Witt module and filtration missing), Kato comparison (Kato group/inverse Cartier missing), the original Milnor-K formulation (Milnor K carrier missing), the subform theorem (quadric function field missing), Jannsen's Hasse principle (local composita and restriction maps missing), and henselian-locus openness (valued henselization missing). Those omissions do not use stand-ins. The additional statable coefficient-field headline is S02.

### Sampled Lean signatures and adversarial computations

All declarations use namespace `TauCetiRoadmap.QuadraticFormInvariantsPartII`. This source-level sample retains explicit contexts and computed boundary values; it is not mechanically printed signature output. No Lean command was run.

| Declaration, line, layer | Variables and instances actually in the signature | Instances and computed values on both sides | Result / change |
|---|---|---|---|
| `quadraticPfister`, 62, 1 | Field K; `m:ℕ`; `a:Fin m→Kˣ`; `a₀:K` | Empty outer tuple: `x²+xy+a₀y²`, dimension `2`; `m=2`: dimension `8`. Over 𝔽₂, `[1,1]` has nonzero values all `1`; `[1,0](0,1)=0`. Over ℚ, terminal `1/4` gives `(x+y/2)²`, determinant `0`. | Real definition has correct mixed term and sign. Singular family members deliberately allowed. |
| `not_anisotropic_quadraticPfister_iff_equivalent_dualProd`, 80, 1 | Same; explicit `1−4a₀≠0`; dualProd space rank `2^m` | 𝔽₂ terminal `0`: T/T, dimension `2`; terminal `1`: F/F. Over ℚ terminal `1/4`: isotropic T, hyperbolic F, but hypothesis `0≠0` fails. | Correct guard; dualProd dimension `2·2^m=2^(m+1)`. |
| `extendScalars`, 92, 2 | Field K; `n`; Q on `Fin n→K`; CommRing L; Algebra K L | Mixed monomial `xy` stays `xy` (value `1` at `(1,1)`); diagonal-only substitute gives `0`. `[1,1]` over 𝔽₂ becomes `0` at `(ω,1)` over 𝔽₄. L=K gives same coefficients; zero-ring L gives the unique zero form on the zero module. | Characteristic-two body valid; no invertibility-of-two binder needed. |
| `isRepresentedBy_iff_forall_represents_extendScalars`, 113, 2 | Fields K,E; Algebra K E; m,n; both Q and ψ anisotropic; `c≠0` | `ψ=0` rank zero: injection and universal value inclusion T/T. `ψ=⟨1,1,1⟩`, Q rank2: subform F; generic represented value inclusion F. For 𝔽₂(t), `[1,1]⊆[1,1]⊥t[1,1]`: T/T. | Matches the corrected two-clause representation theorem. |
| `quadraticSimilarity_tfae`, 148, 2 | K field; rank `2k`, Nondegenerate; nonzero f in n variables; L field with both algebra structures, scalar tower and kernel `(p)` | n=0, f=c≠0: first scalar `c²`, second choice `c⁻¹`, third clause empty: T/T/T. Over 𝔽₂, Q=[1,1], f=t: F/F/F, since t has odd order and residue at t is anisotropic. Lex `2t₁+t₂²` gives coefficient `2`, not `1`. k=0: T/T/T. | `multiplicity` junk at f=0 avoided; every relevant p is nonunit and f nonzero. Kernel clause admits the genuine fraction residue field. |
| `quadraticPfister_isotropic_tfae_of_independent_values`, 242, 4 | Field K; O henselian; m,s; units ε; a₀ integral with unit discriminant; π units; every nonempty subset product has nonsquare value | 𝔽₂((t)), residual [1,1], π=t: F/F/F by even/odd valuation parity. Terminal0: T/T/T. π=t²: enlarged form isotropic while residual form is not, but hπ fails since v(t²)=v(t)². s=0: first two equivalent, third repeats second. | Full subset independence and nonsingular reduction both retained. |
| `IsCi.exists_common_zero`, 270, 5 | Field F, C_i; r,N,d; homogeneous family, d>0; `r*d^i<N` | r=0,N=1: vector1 solves empty family. d=1,N>r: kernel dimension≥N−r>0. 𝔽₂, r=2,d=2,N=5: `4<5`; Chevalley–Warning gives an even number of zeros, hence a nonzero zero. | System theorem, not a single-equation stand-in. |
| `not_anisotropic_quadraticPfister_of_kroneckerDimension`, 295, 6 | K field; O henselian and O≠top; finite cardinal dimension r; r unit slots; unit discriminant; all compatible real-closure composita via maps f,g | Henselized 𝔽_p(t): r=1, residue C₁, rank4>2 so conclusion T. Henselized ℚ(x) at x: r=2, all-positive rank8 stays anisotropic; hreal is F, excluding this example. r=0 cannot have nontrivial O. Top O excluded. | Quantifier order does not choose a convenient real closure; all compatible maps included. |

### Sampled README adversarial computations

The full pass evaluated all 162 Check bullets. These sampled rows retain computations supporting the findings and representative boundary cases. T/F denote mathematical truth values; “retain” records no defect on these tests, not a formal proof.

| Target and README line | Instances and values computed | Result / change |
|---|---|---|
| 0.5 Quadratic Witt module, 565 | `c[1,a](x,y/c)=cx²+xy+(a/c)y²`, so Arf product a; wrong `[c,ca]` has product c²a. For a=1,c=t over 𝔽₂(t), the latter class is t, not the constant class1, modulo Artin–Schreier. Over 𝔽₂ `[1,1]` class1, polar class0. Two outer diagonal factors give weights `1,−a,−b,ab`. | Tensor action correct; import metabolic/hyperbolic theorem instead of replanning it (S03). |
| 1.4 All-fold roundness, 717 | m=0 is norm case. For positive rank4 form over ℚ, value2 gives scaling similarity via two-squares identities on blocks. Non-Pfister rank3 positive form represents3, but determinant changes1→27, square class1→3, so not similar. | Retain full induction; pinned low-fold citations need S01. |
| 2.2 Cassels–Pfister, 791 | h=0 gives vector0; ℚ sum of two squares represents `t²+1` via `(t,1)` and cannot represent3 (mod3 forces an infinite common factor in any primitive rational solution). `x²`/ℚ² cannot represent−1. Motzkin polynomial is nonnegative, rational sum of four squares, but not polynomial sum of squares. | Radical repair sound; multivariable polynomial conclusion is not asserted. |
| 2.3 Substitution/representation, 821 | 𝔽₂(t): binary [1,1] injects in rank4 `[1,1]⊥t[1,1]`, value inclusion T. H universally represents values but has no anisotropic rank2 subform. Zero ψ gives inclusion/subform T/T, generic nonzero-value F. Q rank2 cannot contain anisotropic rank3 ψ. | Retain corrected two-clause result, third clause only positive rank. |
| 3.4 Ext vanishing, 1227 | n=0: Hom(ℤ/2,j_N)=j_N(k)=0 under base-field hypothesis. τ has degree0,weight1; Kummer(−1) instead has degree1. Weight0/degree1 over ℚ gives motivic0 vs Galois nonzero; degree n−1≤weight n−1,n succeeds. | Correct comparison range; the induction uses norm residue, not a circular postscript. |
| 3.6 Kato comparison, 1281 | Arf([1,1])/𝔽₂=1; Arf([1,0])=0. d(c²)=0. 𝔽₂(t) outer slot t gives nonzero `[dt/t]`; bilinear class ⟨1,t⟩ gives nonzero logarithmic dt/t. Degree0 bilinear quotient=ℤ/2; perfect fields have I_b=0 but may retain I_q¹. | Bilinear comparison is now owned here; original Kato proof remains uncertified. |
| 4.1 Unit reduction, 1403 | [1,1]/𝔽₂((t)): F/F for residual/generic isotropy. ℚ₂ same integral block: F/F, discriminant−3 a unit. Diagonal ⟨1,1⟩ has split singular reduction but generic anisotropy, and integral binary parameter1/2 is unavailable. New lifted direction gives `t+s+s²`, derivative1. ℚ at7: residual2=3² but generic2 nonsquare. | Henselian and nonsingular-reduction hypotheses essential; arbitrary rank allowed. |
| 4.3 Independent values, 1461 | t-adic orders of blocks [1,1] and t[1,1] have parity0,1, preventing cancellation. Multiplicatively v(1+t+t²)=1=max(1,v(t))². Slot t² has square value and makes the tensor hyperbolic despite anisotropic residual form. Trivial valuation allows only s=0. | Correct maximum convention, full subset independence, no rank-one restriction. |
| 5.4 Lang–Nagata, 1550 | r=0,N=1 gives vector1; r=1 is C_i. ℂ is C₁ yet normic forms of degree>1 do not exist. Over 𝔽₂ binary norm has exactly1 zero and degree2. Two quadrics,N=5:5>2·2=4, common zero count divisible by2. | Algebraically closed branch repaired for every i. |
| 6.1 Coefficient fields, 1658 | ℚ((t)) residue section is constant inclusion; ℚ₂ cannot contain residue field𝔽₂. 1+t is square; 2+t is not (constant coefficient2 nonsquare), but (2+t)/2 is square. Terminal [1,t]≅[1,0] through √(1−4t). ℚ(s) and ℚ(s+t) are distinct residue sections. v(2)=1, not0. | Mathematical existence/transport sound; missing Lean headline S02 and proof convention S05. |
| 6.4 Real-place descent, 1761 | Finite inverse system: compatibility, not surjective transition maps, suffices. Once i enters the constants, all real-place sets empty. ℚ(√2) has two orderings, √2 images ±√2; over a fixed ordering its image sign is fixed. | Conditional on precise, declared real-closure uniqueness gap; no uniqueness of coefficient field claimed. |
| 6.5 Dimension theorem, 1794 | Positive residue case reduces to rank4>2 at r=1. Henselized ℚ at2 contains √−7, so constants unorderable. Henselized ℚ(x) atx has dimension2 and positive rank8 remains anisotropic at real extension; both hreal and conclusion F. r=0/nontrivial valuation incompatible. | Correct real-place hypothesis and unit-discriminant condition; no good-primes restriction. |
| 7.1 Embedding loci, 1847 | ℚ,T²−2,x=3: p(x)=7,derivative6. At7 valuation of7 positive,6 zero; trivial valuation has v(7)=0 and no √2. Inseparable F(√t)/F in char2 cannot embed into separable henselization, locus empty. Identity extension has entire locus. | Additive convention explicitly local to Layer7; openness uses finite polynomial data. |

### Bold conventions and worked examples

| Item, README line | Two-term or boundary computation | Result |
|---|---|---|
| Fields and spaces, 117 | Zero-dimensional vector space has unique vector0; zero ring has0=1 and cannot satisfy Field. | Field and finite-dimensional restrictions are real. |
| Nonsingular/nondegenerate, 122 | 𝔽₂ line x²: quadratic radical0, polar radical dimension1; binary [1,1]: determinant1. | Even rank needed for equivalence. |
| Binary/hyperbolic, 129 | xy(1,1)=1; `[1,1/4](1,−2)=0` with determinant0. | Mixed coefficient1 and singular exception fixed. |
| Bilinear forms, 133 | Diagonal ⟨1,1⟩_b/𝔽₂ has matrix determinant1 and Witt class0; its diagonal quadratic polynomial has polar0. | Bilinear object not replaced by quadratic diagonal. |
| Pfister forms, 137 | Slots−1,−1 produce positive rank4; plus convention yields signature0. Empty outer tuple gives binary rank2. | Minus sign and fold shift agree with Tau Ceti. |
| Coefficient groups, 148 | H₂¹(𝔽₂)=𝔽₂, H₂²(𝔽₂)=0; H¹(ℝ,𝔽₂)=𝔽₂. | Degree n−1 differential and twist convention necessary. |
| Valuations, 156 | Multiplicative v(t)=c<1: v(1+t)=1; additive ord(t)=1 and ord(1+t)=0. | Layers4/7 agree after reversal; §6.1 exception S05. |
| Kronecker dimension, 163 | ℚ(t):1+1=2; 𝔽_p(t):1+0=1. | Characteristic correction retained. |
| C_i, 168 | N=1,d=2,i=0 gives1<1 false; N=2 gives1<2 true. | Strict bound, no d=0 junk. |
| Universes, 171 | Fin n coefficients, finite algebraic witnesses and rational-function fields over K can be represented in Type u; unrestricted scalar extensions are separately Type v. | No missing higher-universe object is needed to detect the stated equivalences. |
| Characteristic-two worked example, 1908 | ρ=[1,1]⊥t[1,1]: block orders even/odd, so anisotropic; residue of `[dt/t]` is1. Over 𝔽₄(t) terminal splits; under t=s², dt=0 and outer slot square. | Anisotropy, filtration, invariant and rank bound4 agree. |
| Minus-sign worked example, 1915 | Outer−1,−1, terminal1/2 gives8 positive squares, signature8 and (−1)³≠0. Over ℚ(i) or ℚ₂ invariant0 and isotropy T. | Sign and cohomological degree agree. |
| Dimension worked example, 1922 | Henselization of ℚ(x,y) at y has dimension3, residue ℚ(x) dimension2; local compositum cd₂≤1+2=3<4. | Only the real-place obstruction remains for fold4. |
| Patch-clopen worked example, 1929 | At7: ord(−2)=0,ord(7)=1,ord(6)=0. At trivial valuation ord(7)=0; at p≠7 also ord_p(7)=0. | Explicit neighborhood singles out the intended nontrivial valuation of ℚ. |

### Supplier and ownership record

The pins inspected were Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, from the content manifest. Searches were by objects as well as declaration names, using the supplied roadmap service and direct searches of main, Completed, board packages and the supplied open checkouts. Broad searches that reached the service's result limit were narrowed before drawing conclusions. The service's three unresolved-name leads consist of the two real errors in S01 and the locally defined `IsCi.exists_common_zero`, which is not missing. The following resolves the 16 contracts and the additional ownership citation; an existing roadmap's main version, rather than a progress PR, was used.

| Supplier | Current locator verified | Scope / ownership conclusion |
|---|---|---|
| QuadraticFormInvariants | README Layer1:1010; Layer4:1290, signature:1391; §7A:2252, §7B:2365; Layer9:2749 | Characteristic not two; Witt/Pfister constructions and low-degree quaternion comparison imported. Characteristic-two continuation and new higher theorems stay here. |
| ProfiniteCohomology | README Layer10:1549, Layer11:1739, Layer12:2091 | All-degree canonical cohomology, dimension and cups; not a second cochain theory. |
| ClassFieldTheory | README:1286 (Layer6),1606 (Layer10) | cd₂ of dyadic local fields and Brauer Hasse injectivity present with the stated scopes. |
| AdicSpaces | Completed/AdicSpaces/README.md:276,295,310 | Existing valuation spectrum, spectrality and patch space; no second valuation carrier. |
| RealAlgebraicGeometry | Completed/RealAlgebraicGeometry/README.md:128–181 | Ordered real-closure existence present; uniqueness absent there and at the pin. Declared gap is appropriate. |
| SchemeAndStackFoundations | README:969,1032,1068,3656,3867,3896 | §§0.12–0.14,2.11,2.15,2.16 exist; limit application is to spectra of fields with affine transitions, hence qcqs. |
| LocalFieldsRamificationPartII | packages/LocalFieldsRamificationPartII/design/README.md, GF.1, GF.4:732–750, GF.5:873–885 | Earlier-board design owns valued henselization, rank-one decompletion and finite-trdeg Abhyankar inequality; no generality reduced to DVRs in the consuming inequality. |
| HermitianKTheoryOfPoincareCategories | README §§3.4:512,3.5:529,4.5:628,7.9:1214 | Quadratic Witt carrier import correct; §3.5 already supplies its metabolic/hyperbolic identification, S03. |
| GeometryOfNumbersAndQuadraticArithmetic | README §6.4:2500 onward, §6.8a:2937 onward | ExactW0 supplies additive symmetric Witt group; characteristic-two product/action/filtration are the new targets here. |
| K2SymbolsBrauer | README §§5.4:540,5.6:605,5.7:627,5.8:638,5.12:728; §§10.5–10.9:1851–1931;10.32:2422 | Milnor carrier, symbols, residues, inseparable-compatible transfers and number-field higher groups are imported, not rebuilt. |
| KTheoryFiniteLocalFields | README §3.0:453–478, §3.0a:479 onward | Cartier/logarithmic comparison and motivic norm residue present; neither supplies the characteristic-two bilinear Witt comparison, which §3.6 now owns. |
| MotivesAndAlgebraicCycles | README §0.5b:157; §§4.1–4.6 and4.14 | General coniveau/transfer/motivic infrastructure present. Rost cycle-module sheaves, contraction and Gersten package are explicitly requested through the declared gap rather than falsely attributed. |
| ClassicalAdicEtaleCohomology | README §11.2:5636–5638 | Field cohomological-dimension/transcendence bound present; applied directly to local composita. |
| DeligneWeightsAndPurity | README §7.12:2238, §7.15:2292 | Finite-field cohomological weight results and proper smooth purity present. |
| ArithmeticGaloisDuality | README §R02.4.2:3119,4.3:3437,4.5:3870,4.6:4142 | Local duality, Poitou–Tate, function-field version and global kernels match §6.3's added step. |
| AdicCoefficientsAndComparisonsPartII | packages/AdicCoefficientsAndComparisonsPartII/design/README.md:1295, §PA.6.9 | Exact prime-to-ℓ alteration contract, including base extension and generic degree prime to ℓ, matches Jannsen's input. |
| GeometryOfNumbersAndQuadraticArithmeticPartII (ownership only) | Supplied open-head README §0.1:93 | Full-polar integral comparison already owned; update obsolete §DA.0 reference, S04. |

The two plan gaps have matching slugs in design/plan.json and the exact-contract README subsections. Both name an earlier supplier, have explicit hypotheses, and request coherent missing interfaces rather than a conclusion already present at the pins. Neither is a new blocking finding. The real-closure contract fixes an ordering; it does not assert uniqueness of an unordered embedding of ℚ(√2). The Rost contract is one cycle-module infrastructure package, not an unrelated collection of requests.

Relevant pinned bodies read include Mathlib/LinearAlgebra/QuadraticForm/Radical.lean:115 (`Nondegenerate` means zero quadratic radical and polar-kernel rank at most one), Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127 (base change has invertible-two context), TauCeti/LinearAlgebra/QuadraticForm/Representation.lean:44,47 (`Represents` permits zero; `IsRepresentedBy` uses an injective isometry), TauCeti/LinearAlgebra/QuadraticForm/Witt/Pfister/Basic.lean:61,154 (weights in every characteristic, Witt classes with invertible two), and Mathlib/CategoryTheory/CofilteredSystem.lean:111 (finite nonempty inverse systems; surjective transitions not required). These distinctions are retained in the target signatures. The native `multiplicity` is natural-valued with a junk value for infinite multiplicity, but `f≠0` and irreducible p remove that case in quadraticSimilarity_tfae. The four imported Tau Ceti files and the other named pinned declarations were located; S01 records the only missing names found.

The dependency command requested in the brief, run read-only on this README and the supplied ORDER, returned exactly:

```text
depcheck: 188 roadmaps, 1238 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The layer chain is also consistent: 0→1→2→3; 4 uses0–1; 5 uses4 and its finite-field/valuation suppliers; 6 uses3–5; 7 uses0 and henselization/patch suppliers. No input from the later global-quadratic, lattice-mass, orthogonal-spin or quaternion-arithmetic open work was introduced. The named owners retain their carriers. No additional ownership move is needed beyond importing §3.5 as S03 requests.

### Source-locator register

All readings used the supplied legal cache. Each row is one of the 34 counted locator groups. Source line numbers below are extraction locators; page numbers in the package are printed pages, not extraction page indices. A locator can be verified while a source error is separately recorded below.

| # | Source and locators read | Evidence and conclusion |
|---|---|---|
| 1 | ekm, Lemma2.1, Proposition2.4, Corollary2.5, pp.19–20 | ekm lines892,936,948: bilinear tensor, anisotropic representatives and metabolic zero classes. |
| 2 | ekm, Theorem4.8, Proposition4.13, Theorem4.22, pp.23–27 | ekm lines1078,1150,1397: presentation, signed determinant, degree-two relations. |
| 3 | ekm, Lemma5.2, Proposition5.3, Fact5.15, pp.29–31 | ekm lines1630,1648,1843: low-degree isomorphisms and bilinear graded comparison; Fact5.15 cites Kato in characteristic2. |
| 4 | ekm, Notation7.3, Remark7.4, Examples7.5–7.6, Proposition7.19, pp.40–44 | ekm lines2260,2273,2279,2281,2411: matrices and binary isotropy. Package adds the necessary polar qualification absent from Remark7.4. |
| 5 | ekm, Lemmas7.12,7.15 and Proposition7.13, p.42 | ekm lines2351,2360 and the following scalar-extension discussion: quotient radical, splitting plane, transcendental anisotropy. |
| 6 | ekm, Propositions7.29,7.31, pp.45–46 | ekm lines2494,2508: diagonalization versus binary-plus-totally-singular decomposition. |
| 7 | ekm, Theorems8.3–8.5 and(8.7), pp.47–49 | ekm lines2566,2629,2639,2671: extension, nonsingular cancellation, full decomposition and characteristic-two failure of singular cancellation. |
| 8 | ekm, Lemma8.16, Remarks8.17–8.18, p.51 | ekm lines2748,2765,2768: tensor module, class plus dimension detection, restriction. |
| 9 | ekm, Examples9.3–9.4 and§9.B, pp.52–53 | ekm lines2831,2842,2848: binary norm roundness and quadratic Pfister construction. |
| 10 | ekm, Proposition9.8, Corollaries9.9–9.10, Lemma9.11, pp.54–55 | ekm lines2906,2932,2933,2941: round induction and characteristic-two criterion. Regular-only clause of9.8(2) is erroneous; package uses nonsingular. |
| 11 | ekm, Proposition16.1, Fact16.2, pp.67–68 | ekm lines3620,3634: invariance and graded quotient comparison. |
| 12 | ekm, Theorem17.3, Corollary17.7, Proposition17.9, Theorem17.12, pp.71–74 | ekm lines3737,3776,3792,3831: polynomial, substitution, constrained representation and subform equivalence. Radical and zero-dimensional corrections in package checked. |
| 13 | ekm, Theorem18.3, Corollary18.5, pp.76–77 | ekm lines3947,4004: odd-divisor value theorem and Springer without separability. |
| 14 | ekm, Lemmas19.2,19.4,19.5, Corollary19.3 and Propositions19.7–19.8, pp.79–80 | ekm lines4144–4195: DVR and completion scopes distinguished. |
| 15 | ekm, Lemmas20.1,20.4, Proposition20.2, Corollaries20.5–20.7, pp.83–84 | ekm lines4348,4359,4381,4391,4445,4463: transfer and reciprocity; nonzero functional explicit where needed. |
| 16 | ekm,(20.8), Lemmas20.9,20.12, Corollary20.13, pp.84–85 | ekm lines4475–4488,4550,4576: power-basis normalization and norm sign. |
| 17 | ekm, Theorems20.14,20.16, pp.86–87 | ekm lines4586,4620: similarity norm and lex-leading-coefficient equivalence. |
| 18 | ekm, Propositions22.1,22.4, Example22.2, Theorem22.5, pp.93–94 | ekm lines5157,5182,5191,5198: smoothness, binary field and subform theorem. |
| 19 | ekm, Theorem23.7(1), p.100 | ekm lines5444–5457: nonzero anisotropic form, general scaled Pfister generation, dimension bound. |
| 20 | ekm, Lemma97.1, Theorem97.2, Corollaries97.5–97.6, Theorem97.7, pp.385–386 | ekm lines20220,20227,20259,20271,20284: normic construction, systems, algebraic and transcendental extensions. Algebraically closed branch repaired. |
| 21 | ekm, §101, pp.402–404 | ekm lines21263–21324: coefficient definitions, restriction/corestriction and grading. Distinguish §16's quadratic twist from §101's diagonal shorthand. |
| 22 | morel, Theorems1.1,1.3, pp.65–66 | morel lines75,104,122–133: all characteristic-not-two fields, perfect-base induction and comparison range. |
| 23 | morel, Definition2.1, Theorems2.2–2.3, Remark2.5, pp.70–72 | morel lines243,253,277,316–329: 0-purity, intersection filtration, no supplied ideal-power equality. |
| 24 | morel, Theorems2.11–2.12, Lemma2.14, pp.76–81 | morel lines451,532,592,511,611: cycle-module comparison and the two separate Arason references. |
| 25 | morel, Theorem3.4, Lemmas3.5–3.9, Theorem3.10, pp.84–89 | morel lines718–760,815–853: cycle supports, vanishing and Ext hypotheses; no reversal of weight and cohomological degree. |
| 26 | morel, Lemma3.11 and proof, Lemma3.16, Corollary3.17, pp.90–93 | morel lines914–924,1010,1024: flasqueness conditional on previous kernel vanishing and the inductively constructed inverse. |
| 27 | dp, §1,p.1 | dp lines34–36: Kronecker dimension for arbitrary fields. |
| 28 | dp, §2 and Fact2.1, pp.3–4 | dp lines135–159: twist n−1, algebraic local composita and local-global implication. |
| 29 | dp, Fact3.1, Proposition3.2 and proof, pp.6–8 | dp lines229–335: source non-dyadic family; package's integral-block proof genuinely extends to dyadic nonsingular reduction. Source cd error is avoided. |
| 30 | dp, §3.C, Lemma3.9, p.11 | dp lines485–517: finite-extension and isotropy loci, monic simple-root neighborhood. |
| 31 | jannsen16, Theorem0.4, Corollary0.8, pp.2–4 | jannsen16 lines86,113–141: finite coefficients via norm-residue divisibility; degree d+2. |
| 32 | jannsen16, Theorem1.5/proof, Theorem2.4/proof, Theorems2.10–2.11, pp.13–24 | jannsen16 lines510–600,661–669,894–901,1034–1059: weight exclusion, duality step, Hasse principle and prime-to-ℓ alteration hypotheses. |
| 33 | ovv, Theorem4.1,p.11 | ovv lines393–408: characteristic zero, not the sole source for the package's characteristic-not-two generality. |
| 34 | ojanguren-panin, Theorem A,p.72 | ojanguren-panin lines82–112: regular local rings containing a field of characteristic different from two; companion injectivity and Morel's reformulation also checked. |

## Not verifiable

- **Fresh elaboration and mechanically printed signatures:** unavailable. The supplied signature attempt exited before printing declarations because a pinned Tau Ceti Pfister object file was missing. No Lean build or elaboration was run in this read-only pass. The sampled binder audit is source-level, not a claim to have produced `#check @...` output. The earlier repair's successful build does not certify the current environment.
- **kato82:** main comparison theorem, Inventiones 66 (1982), pp.493–510, remains settled uncertified. EKM Facts5.15 and16.2 confirm the stated result; this pass cannot certify Kato's original proof.
- **arason75:** Satz3.3 and subsequent odd-degree injectivity, Journal of Algebra36 (1975), pp.448–491, remain settled uncertified. Morel's precise attributions at pp.78 and81 were verified instead.
- **milnor70:** §4, Question4.3,p.332 and prime-field computations remain settled uncertified. Morel's use of those computations and this package's explicit prime-field cases were checked, but the original text was not read.
- **New source requests:** none. The three settled works were not requested again, and no missing-reference request was created. Available source text was sufficient for the other conclusions. Ownership searches cover the supplied open-head files and the roadmap service index; no claim is made about unprovided or unindexed private work.

## Source issues

- **Misprint** in dp at §3, printed p.6 (dp line 234): the source says the characteristic-two outer factors are quadratic binary forms; it should be bilinear factors tensored with the terminal quadratic block; affects nothing.
- **Misprint** in dp at Proposition3.2(2), proof, printed p.7 (dp lines 281–282): the source says subset block coefficients are unsigned products of slots; it should be those products multiplied by the parity sign of the subset; affects nothing.
- **Error** in dp at Proposition3.2(3), Claim, printed p.7 (dp line 314): the source says the global coefficient field has finite ordinary cohomological dimension bounded by its Kronecker dimension plus one; it should be the nonreal local compositum that is bounded directly, since formally real fields have infinite mod-two cohomological dimension; affects the proof.
- **Gap** in dp at Proposition3.2(3), Claim, printed p.8 (dp lines 323–328): the source says the real-local cohomology class is the directed limit of classes from smaller constant fields; it should be justified using compatible ordered embeddings and uniqueness of real closures before applying cohomological continuity; affects the proof.
- **Misprint** in dp at Lemma3.9(2), proof, printed p.11 (dp lines 515–517): the source says the embedding locus is a neighborhood of the quadratic form; it should be a neighborhood of the valuation; affects nothing.
- **Error** in ekm at Remark7.4, printed p.40 (ekm lines 2273–2276): the source says every nonzero binary form has the mixed-term binary normal form; it should be restricted to binary forms with nonzero polar form, excluding characteristic-two squares; affects nothing.
- **Error** in ekm at Remark8.9(2), printed p.50 (ekm lines 2691–2692): the source says similarity of anisotropic parts suffices for similarity of arbitrary quadratic forms; it should be supplemented by equality of total dimensions and quadratic-radical dimensions; affects nothing.
- **Error** in ekm at Proposition9.8(2), printed p.54 (ekm lines 2908–2930): the source says regularity suffices for an isotropic doubled round form to be hyperbolic; it should be nonsingularity: over 𝔽₂ the regular round line doubles to the singular square `(x+y)²`; affects nothing.
- **Gap** in ekm at Theorem17.3, proof, printed p.72 (ekm lines 3762–3765): the source says quotienting an isotropic form by its quadratic radical permits splitting a hyperbolic plane; it should be followed by a new anisotropic-versus-isotropic split, since the quotient may be anisotropic; affects the proof.
- **Misprint** in ekm at Lemma17.10 proof, printed p.73, and Theorem17.12 proof, printed p.74 (ekm lines 3810–3812 and 3848–3849): the source says the constant vector evaluates to the quadratic leading coefficient and the linear vector to the constant coefficient; it should be the reverse, or the displayed vector expansions should exchange their indices; affects the proof.
- **Misprint** in ekm at Corollary17.11, printed p.73 (ekm lines 3827–3830): the source says the complementary target form evaluated on remaining variables is represented by the original target; it should be the remaining source form represented by the complementary target; affects the proof.
- **Error** in ekm at Theorem17.12, printed pp.73–74 (ekm lines 3831–3840): the source says all three representation conditions are equivalent also in source dimension zero; it should be the subform/value-inclusion equivalence generally, with generic nonzero-value membership restricted to positive dimension; affects a stated result.
- **Misprint** in ekm at Proposition19.1 proof, printed p.79 (ekm lines 4134–4136): the source says the decomposition adds an unprimed vector to the difference from the primed vector; it should be the primed vector in both summands; affects nothing.
- **Misprint** in ekm at §19, primitive-vector definition, printed p.79 (ekm lines 4140–4142): the source says primitivity is defined in a vector space over the fraction field; it should be defined relative to the finite free valuation-ring module, since every fraction-field vector is divisible by the uniformizer; affects nothing.
- **Misprint** in ekm at Lemma20.9 proof, printed p.85 (ekm lines 4495–4498): the source says the span includes powers from one through the extension degree and has the base field as complement; it should be powers one through degree minus one; affects the proof.
- **Misprint** in ekm at Lemma20.12 proof, printed p.85 (ekm lines 4568–4572): the source says the complementary span uses indices one through the degree, omitting the middle index; it should be indices zero through degree minus one, omitting the middle index; affects the proof.
- **Error** in ekm at Example22.3, printed p.94 (ekm lines 5184–5187): the source says any two irreducible quadrics have the displayed product function field; it should be restricted to integral products: two copies of Spec𝔽₄ over 𝔽₂ have product Spec(𝔽₄×𝔽₄); affects nothing.
- **Gap** in ekm at Theorem97.2 proof, printed p.385 (ekm lines 20229–20233): the source says positive C-index permits invoking the nonalgebraically-closed normic-form lemma; it should be preceded by removing the algebraically closed case independently of the index, since ℂ is also C₁; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "64fe6dcc3eb6c0735b81fc892f8c18c8454c1418", "job": "RT-QuadraticFormInvariantsPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
