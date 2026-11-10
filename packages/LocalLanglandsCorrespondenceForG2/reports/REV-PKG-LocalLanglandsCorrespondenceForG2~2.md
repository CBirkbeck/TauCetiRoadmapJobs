# Review of LocalLanglandsCorrespondenceForG2 (package, round 2)

**Verdict:** needs changes

Eleven findings: one P1, six P2 and four P3. The existing Lean file elaborates, with only its expected `sorry` warning. No package implementation, metadata, design or source-manifest file was changed. The findings concern an unowned cancellation step, a statable missing headline, globalization hypotheses, supplier precision, organisation and four smaller corrections.

## Previous findings, checked first

The repair report's F01–F09 refer to the preceding review's R01–R09. I checked the changes against the source texts, current supplier heads and pins rather than treating the repair report as authority. None was marked not actionable.

| Previous finding | Repaired passage in packages/LocalLanglandsCorrespondenceForG2 | Assessment |
|---|---|---|
| F01, Griess ownership | README.md:119: “whose seven-dimensional representations v ∘ ρ and v ∘ ρ′ are completely reducible”; new §0.0 is consumed in §§0.3–0.5, 0.9–0.10 and 3.13. | **Repaired as an ownership defect.** The independent summand argument in §0.2 does not require Griess. The added unstatability assertion creates the separate R02 below. |
| F02, direction at p = 3 | README.md:635: “an injection L⁻¹(φ) → Irr(μ₃)”; :645 has the corresponding S₃ injection; :856 assembles an injection, with the nonvanishing qualifications. | **Repaired.** Fibre sizes 1, 2 or 3 inject into three labels; the reverse map need not exist. The self-dual p = 3 case reduces to the subregular parameter. |
| F03, spin-factor owner | README.md:77–80 names AutomorphicLFunctionsAndLocalFactorsPartII, Layer 6, and says the contract “extends the ramified-spin-factor contract”. | **Repaired.** Plan and README name the same earlier supplier and slug; §2.4 and §6.1 consume it. |
| F04, unrelated contracts bundled | README.md:90 gives `gap:poincare-weak-containment`; :91 separately gives `gap:regular-real-unitarity`, beginning “for each of split G₂(ℝ) and split PGSp₆(ℝ)”. | **Partly repaired.** The two mathematical inputs are separated and the real bound is quantified. The Whittaker branch of the first contract still names the wrong Hilbert space: R07. |
| F05, native Weil group overlooked | Suggested.lean:19–23: “Tau Ceti has the local Weil group” with `TauCeti.ClassFieldTheory.WeilGroup` and `weilDegree`. | **Repaired.** Both declarations exist at the pin. This does not settle the separate Griess statability question. |
| F06, reciprocity label | README.md:26: “arithmetic normalization of local reciprocity” and “ω = \|·\|⁻¹”, with SR.5.2 transport. | **Repaired.** At q = 5 the arithmetic absolute value is 1/5 and ω is 5; on geometric Frobenius these interchange. The rank-one transport is inversion of the character. |
| F07, Chebotarev owner | README.md:109 names “Chebotarev, Layer 10”; Needs in §§0.9, 5.2 and 8.2 and their layer dependencies repeat it. | **Repaired.** The completed roadmap supplies density #C/#G, sufficient on finite quotients, with semisimplicity retained. |
| F08, missing Needs | README.md:199 names the parameter and spin-map suppliers; :269 names the quaternion stabilizer and period-space suppliers; :285 names cusp realizations and Whittaker functionals. | **Repaired.** All three definitions now have their prerequisite lists. |
| F09, complex theta input | README.md:70: “at a complex place”; new `gap:pgsp6-pgso8-complex-theta`, also in the plan, is consumed in §§2.3–2.4. | **Repaired.** The local nonarchimedean tables and complex-place comparison are separate. GS line 789 supplies the place where this comparison enters. |

The altered statements and their consumers were reviewed again. Unchanged material was inherited only where the previous review recorded actual calculations; every other target was read anew. In particular, the preceding round's acknowledgement of the auxiliary-place issue was not evidence that the missing step had an owner.

## R01 (P1) — The auxiliary-place cancellation has no supplied theorem

**Location:** packages/LocalLanglandsCorrespondenceForG2/README.md:401, §2.4, and :1123. Quote: “the cancellation requires either a globalization in which that place is spherical, or an identity … obtained by the same induction on the depth of the auxiliary place”.

**Claim:** The route proves the spin gamma identity from §1.6, functional equations and comparisons at the other places.

**Witness:** GS line 764 requires every other finite component spherical; GS line 1227 allows one exception. With ratios Rσ = 2, Rz₁ = 1/2 and Rz₂ = 1/4, both product identities hold, but Rσ ≠ 1.

More explicitly, even granting ratios 1 at the Steinberg and fixed supercuspidal places, one and two prescribed copies yield RσRz₁ = 1 and Rσ²Rz₂ = 1. Dividing gives Rσ = Rz₁/Rz₂, not 1. These are a countermodel to the proposed cancellation, not purported automorphic representations. No target, supplier contract or pinned declaration makes the auxiliary ratios 1, makes the two ratios equal, or supplies a decreasing induction invariant. The word “depth” does not specify one; depth can increase under an unconstrained globalization. Acknowledging the missing step in Notes does not supply it.

**Exact repair:** Name and own the additional mathematical input, with its quantifiers, before §2.4. One sufficient contract is a strengthening of the §1.6 globalization on AutomorphicFormsOnReductiveGroups, Layer 4, which gives the same prescribed components and confines the one auxiliary component to a class for which the spin gamma comparison is already proved independently, for example generic principal series. State and supply that local principal-series comparison using the classical theta tables and the local-factor supplier. Declare the globalization strengthening in both the plan's gaps and the README if it is imported. Alternatively provide an actual decreasing induction with its base case and transition. Remove the unsupported cancellation sentence and update the Notes and Needs. Test the repaired argument with one and two copies: the new input must force Rz₁ = Rz₂ = 1, giving Rσ = 1. Do not narrow the theorem to unramified or good-prime representations.

## R02 (P2) — Griess's headline is statable on the pinned octonions

**Location:** packages/LocalLanglandsCorrespondenceForG2/Suggested.lean:36–40 and README.md:119. Quote: “Griess's conjugacy theorem … the group G₂(ℂ) with its seven-dimensional representation … but no comparison between them”.

**Claim:** The missing comparison with `spinGroup` prevents stating §0.0.

**Witness:** `TauCeti/Algebra/Octonion/Basic.lean:143,233,279,305` supplies the complex octonion algebra; `Mathlib/RepresentationTheory/Semisimple.lean:34` supplies semisimplicity. A multiplicative subgroup of its linear automorphisms and its native representation elaborate with no admitted data.

The theorem needs the octonion automorphism group, not a comparison with Spin₇ or an algebraic-group-scheme carrier. Multiplicative invertible linear maps preserve the unit. Over ℂ their representation on the octonions is the direct sum of the fixed scalar line and the seven-dimensional imaginary representation. Semisimplicity and intertwining for the eight-dimensional representation are therefore equivalent to the required seven-dimensional conditions, by cancelling the trivial summand. This is the actual G₂ model, not a free predicate or a weakened substitute.

**Exact repair:** Add the real definitions of the octonion automorphism subgroup and its representation, then state the Griess theorem with complete reducibility and linear equivalence as hypotheses and G₂ conjugacy as conclusion. Import the individual octonion module; register the new names in §0.0; remove Griess from the unstatable list while retaining the separate missing comparison needed by parameter theorems. The following test was elaborated at the pins: exit 0, only the theorem's `sorry` warning. It demonstrates that no new mathematical carrier is required. Add declaration docstrings and use the package namespace in the final file.

```lean
import Mathlib
import TauCeti.Algebra.Octonion.Basic
namespace GriessStatability
abbrev O := TauCeti.Octonion ℂ

def octonionAut : Subgroup (O ≃ₗ[ℂ] O) where
  carrier := {g | ∀ x y, g (x * y) = g x * g y}
  one_mem' := by
    change ∀ x y : O, (1 : O ≃ₗ[ℂ] O) (x*y) =
      (1 : O ≃ₗ[ℂ] O) x * (1 : O ≃ₗ[ℂ] O) y
    intro x y; rfl
  mul_mem' := by
    intro a b ha hb x y
    change a (b (x*y)) = a (b x) * a (b y)
    rw [hb, ha]
  inv_mem' := by
    intro a ha
    change ∀ x y, a (x*y) = a x * a y at ha
    intro x y
    apply a.injective
    change a (a.symm (x*y)) = a (a.symm x * a.symm y)
    simp only [LinearEquiv.apply_symm_apply, ha]

def action {Γ : Type*} [Group Γ] (ρ : Γ →* octonionAut) :
    Representation ℂ Γ O where
  toFun γ := (ρ γ).val.toLinearMap
  map_one' := by
    change (ρ 1).val.toLinearMap = 1
    rw [map_one]; rfl
  map_mul' := by
    intro a b
    rw [map_mul]; rfl

theorem griess {Γ : Type*} [Group Γ] (ρ ρ' : Γ →* octonionAut)
    (hρ : Representation.IsSemisimpleRepresentation (action ρ))
    (hρ' : Representation.IsSemisimpleRepresentation (action ρ'))
    (h : ∃ e : O ≃ₗ[ℂ] O,
      ∀ γ x, e ((ρ γ).val x) = (ρ' γ).val (e x)) :
    ∃ g : octonionAut, ∀ γ, ρ' γ = g * ρ γ * g⁻¹ := by
  sorry
end GriessStatability
```

For the identity homomorphism the witness is the identity automorphism; the zero endomorphism is excluded by `LinearEquiv`. On the order-five negative control of §0.0 the eigenvalue multiplicities remain different after adding one trivial eigenvalue, so the intertwining hypothesis fails as it should. The original Griess text remains uncertified; this finding concerns statability of the roadmap's stated theorem, not fresh certification of that text.

## R03 (P2) — Quaternion-period globalization adds unsupported level control

**Location:** packages/LocalLanglandsCorrespondenceForG2/README.md:289, §1.3(a), and :299, §1.4. Quote: “unramified outside S and infinity”.

**Claim:** Arbitrary prescribed finite relative discrete components and compact real components globalize with no additional ramification.

**Witness:** GS lines 1179–1197 prescribe components and a period, but no outside level. SV lines 11075–11080 and 11239–11246 give Fell approximation and isolated occurrence, also without that level condition.

The declared contract at README.md:90 permits one further finite place. Its output allows #({ramified finite places} ∖ S) = 1; §1.4 demands 0. Restricting a representation to the product over S forgets its component at that extra place, so the weak-containment statement as written cannot imply the stronger assertion. In addition, §1.3(a) restricts S to finite places, whereas §1.4 uses it to prescribe all the real components; GS Proposition 10.5 explicitly allows real places.

**Exact repair:** State §1.3(a) for the finite set of all prescribed places, including archimedean ones, with the precise relative Hilbert-space hypotheses. Carry through the declared allowance of at most one additional finite place into §1.4 and its route, or remove level control there if it is not needed. If zero additional ramification is essential, it needs a separately stated and owned stronger theorem; neither cited locator proves it. Recheck consumers using the allowed set S_f ∪ {z}: the amended conclusion must accept #({z} ∖ S_f) = 1. This does not repair the distinct cancellation problem R01.

## R04 (P2) — Generic globalization does not assume generic real components

**Location:** packages/LocalLanglandsCorrespondenceForG2/README.md:319, §1.6, and :324. Quote: “For a split simple group G … and real components prescribed far from the walls”.

**Claim:** The stated finite-place hypotheses and an informal real regularity condition suffice for globally generic globalization for every split simple group.

**Witness:** GS lines 1223–1225 require every prescribed place, including infinity, to be ψ-generic, square-integrable and isolated in the selected spectrum. The real-unitarity contract covers only G₂ and PGSp₆ and concludes only discreteness.

A discrete series of SL₂(ℝ) with the opposite Whittaker sign has Hom_N(D_k, ψ) = 0, for arbitrarily large k and hence arbitrarily far regular infinitesimal character. A globally ψ-generic representation would require this space to be nonzero. The omitted hypothesis cannot be recovered from distance to walls. Similarly, the Check at :324 invokes the Steinberg-isolation theorem without its rank restriction: SmoothRepresentationsOfLocalGroupsPartII, §4.7, assumes split rank at least two. Rank-one complementary series approach Steinberg in the full unitary dual.

**Exact repair:** State the general criterion in the form actually supplied by GS Proposition 10.7: at every prescribed place δ_v is ψ_v-generic, square-integrable and isolated in the selected globally generic spectrum with fixed σ at w. Keep the no-real-place case. Give G₂/PGSp₆ applications separately, with the quantified real constant from the declared contract and the required genericity and isolation, instead of suggesting that that contract works for every G. Qualify the Steinberg Check by the supplier's split-rank-at-least-two hypothesis. The wrong-sign D_k must then fail the hypotheses because its Whittaker space has dimension zero, however large k is.

## R05 (P2) — Coefficient-prime compatibility drops the supplier's irreducibility premise

**Location:** packages/LocalLanglandsCorrespondenceForG2/README.md:100 and :598, §3.15. Quote: “AG2.6 full polarized local–global compatibility at the coefficient prime”.

**Claim:** The cited AG2.6 theorem directly supplies full compatibility at u dividing ℓ with no further input.

**Witness:** AutomorphicGaloisRepresentationsPartII, open pull request #1006, TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:2453 and :3226, assumes `ExtremelyRegularIrreducibility n`. ModularityAndLanglandsExtensions, #1180, TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1490–1494, §2.43, discharges it.

This is a universal premise about every extremely regular polarized rank-n form over CM fields. It is not the assertion that this particular seven-dimensional representation is irreducible. Odd rank does not remove it: the supplier's polarized coefficient-prime domination already assumes it. The required theorem has an earlier owner and is not currently cited by this package, whose ModularityAndLanglandsExtensions imports are all in Layer 3.

**Exact repair:** Import ModularityAndLanglandsExtensions §2.43 in Scope, the exact supplier contracts, §3.15's route and Needs, and Layer 3 dependencies. State that its density-one conclusion implies `ExtremelyRegularIrreducibility 7`, which supplies the premise of AG2.6's totally real descent. Do not impose extreme regularity on Π or re-plan the density-one theorem here. The repair is tested on the quantifiers: a set of primes of Dirichlet density 1 is nonempty for each eligible CM form, so one pair (ℓ′, ι′) exists; irreducibility of only one fixed Π would not suffice. The supplier explicitly avoids a cycle by proving §2.43 using only the weaker admissibility/Iwahori comparisons.

## R06 (P2) — The summary describes following a source

**Location:** packages/LocalLanglandsCorrespondenceForG2/README.md:3. Quote: “following Gan–Savin (GS)”.

**Claim:** The introduction presents the source as the organising plan.

**Witness:** The binding organisation rule explicitly disallows a README saying it follows a source. This sentence does so verbatim.

**Exact repair:** Delete that clause and describe the construction through exceptional theta lifts, triality and parameter comparisons. Retain the exact GS Main Theorem locator as evidence for the end theorem. The mathematical layer order may remain where the stated dependencies force it; this finding does not require rearranging the layers merely because GS has a similar order. A reread after deletion should leave a description of the objects and their dependencies, with no assertion of following the paper.

## R07 (P2) — The Whittaker supplier contract uses the untwisted quotient

**Location:** packages/LocalLanglandsCorrespondenceForG2/README.md:90; corresponding `poincare-weak-containment` gap and §1.3(b). Quote: “a maximal unipotent subgroup with a generic character … summands of L²(H_v \\ G_v)”.

**Claim:** The same untwisted H-distinguished Hilbert space supplies both the quaternion-period and Whittaker constructions.

**Witness:** GS lines 1221–1230 use square-integrable ψ_v-Whittaker functions and the ψ-generic cuspidal spectrum with fixed σ at w. If ψ_v(n) = −1 and f(g) = 1, twisted equivariance gives f(ng) = −1; untwisted invariance gives +1.

A nontrivial character is not encoded by merely mentioning it next to H. The stated local space and global distinguished part forget it, as well as the fixed supercuspidal selection required by §1.2. SV Theorem 16.3.2 itself has anisotropic stabilizer hypotheses; the Whittaker extension is a legitimate declared supplier gap, but it must specify the correct extension.

**Exact repair:** Keep the same named supplier and slug, and distinguish its two instances explicitly. For quaternion periods use the untwisted relative space. For Whittaker models use L²(N_v \\ G_v, ψ_v), state f(ng) = ψ_v(n)f(g), fix the generic σ at w, and state weak containment in the selected L²_(ψ,σ) of §1.2 with its allowed extra finite place. Align the plan's needs sentence with this corrected contract. With ψ_v(n) = −1, the amended definition must yield −1 rather than +1. This is a precision correction to a declared gap, not an objection that the supplier has not yet implemented it.

## R08 (P3) — The triality declaration moved to a different pinned file

**Location:** packages/LocalLanglandsCorrespondenceForG2/README.md:47. Quote: `TauCeti/Algebra/Lie/D4/Tripled/Triality.lean`.

**Claim:** This is the pinned file containing the two triality declarations.

**Witness:** That file is absent. At the pin, `trialityAutomorphism` and `trialityAutomorphism_pow_three` are in TauCeti/Algebra/Lie/D4/Tripled/Triality/Basic.lean:155 and :197.

**Exact repair:** Replace the file locator with `TauCeti/Algebra/Lie/D4/Tripled/Triality/Basic.lean`. Keep the declaration names and mathematical contract. Both declarations were opened there; the order-three assertion is unchanged. This is file-locator drift, not an absent mathematical prerequisite.

## R09 (P3) — The spin-regularity Check misstates what repeated weights imply

**Location:** packages/LocalLanglandsCorrespondenceForG2/README.md:928, §8.2. Quote: “a repeated zero weight that regularity excludes only in the presence of the other two hypotheses”.

**Claim:** A cocharacter with the indicated repeated zero weight can still be spin-regular unless Steinberg and cohomological hypotheses are added.

**Witness:** On the principal PGL₂, Sym⁶ ⊕ 1 has weights 6,4,2,0,0,−2,−4,−6: zero has multiplicity 2, whereas spin-regularity requires multiplicity 1. On G₂ the fixed line plus the standard zero weight gives the same obstruction.

Once a Hodge cocharacter is identified and factors through either subgroup, its weights alone exclude spin-regularity. If “monodromy” instead means a local Weil–Deligne parameter at another finite place, the claim about exclusion by the three global hypotheses is still wrong: the permitted Steinberg component itself has principal parameter and repeated zero spin weight.

**Exact repair:** Replace this Check by the computed weight obstruction, distinguishing a global Hodge cocharacter from finite-place monodromy. Retain all three hypotheses when invoking KS Proposition 13.1(4); they are hypotheses of that theorem, not a reason a repeated weight becomes regular. Verify the replacement with the displayed list: multiplicity 2 excludes regularity immediately, while the finite Steinberg place remains allowed.

## R10 (P3) — The weak-containment Check already contains the claimed summand

**Location:** packages/LocalLanglandsCorrespondenceForG2/README.md:293. Quote: “Weak containment alone does not produce a summand: the sum of one isolated Steinberg representation and infinitely many copies of the trivial representation”.

**Claim:** This example witnesses failure of summand existence.

**Witness:** St ⊕ ⨁_(n≥1) 1 contains St with multiplicity exactly 1. It witnesses failure of a convergent subsequence of distinct indexed summands, not absence of a summand.

**Exact repair:** Retain the example but describe precisely the false subsequence inference it refutes. Say that isolation gives an actual occurrence by SRU.1.10. Alternatively, to illustrate weak containment without occurrence, use the trivial representation weakly contained in the regular representation of ℝ: its invariant L² space has dimension zero. For the retained direct sum, recompute multiplicity(St) = 1 and multiplicity among the trivial summands = 0; the amended sentence must agree with both values.

## R11 (P3) — Several deep summary targets are not named in the unstatable list

**Location:** packages/LocalLanglandsCorrespondenceForG2/README.md:3 versus Suggested.lean:15–40. Quote from the summary: “globalization theorems with quaternion periods and with Whittaker models; the spin transfer … through triality”.

**Claim:** The module docstring identifies all the roadmap's unstatable headline theorems.

**Witness:** It contains no entry naming the globalization theorems of §§1.4–1.7 or the local/global spin-transfer construction and gamma comparison of §§2.2–2.4. These are explicit deep summary targets, not definition APIs or Checks.

**Exact repair:** Add explicit docstring entries for those headline groups, explaining the missing automorphic/smooth-representation and theta/local-factor carriers. Likewise name the Chenevier automorphic descent of §§0.9–0.10 and the Kret–Shin local parameter construction of §§5.1, 8.2, rather than relying on their eventual use in a different named theorem. Do not add substitute algebraic identities to Lean. Keep Griess separate as statable under R02. The resulting summary-to-docstring inventory should assign every deep result to a named entry or a genuine Lean theorem.

## Verified sound

### Coverage and principles

I read the four requested package files, the preceding review, its repair report, the plan's gap list, the board package index, the overlap and library-match leads, all 75 numbered targets and their Checks/Needs. The README has 11 layers and 17 definitions with API lists and at least three Checks each. I inspected repaired passages and searched their patterns elsewhere: p = 3 injection direction, unowned conjugacy inputs, reciprocity transport, spin-factor ownership, complex theta matching and missing prerequisite lists. The exceptions found are listed above; a section being read is not a claim that its proof is complete.

No re-planning of an existing G₂ correspondence roadmap was found. The generic theta, Arthur/Xu, classical similitude theta and GL_n infrastructure is imported, not redeclared here. The package retains p = 2 and p = 3 in its field universe; its p = 3 nonvanishing limitation is explicitly a partial enhancement statement, not a good-primes workaround. There is no computational algorithm, sorried data, `set_option`, imported open-roadmap Lean module, or newly introduced fully qualified duplicate declaration. The mathematical meaning of “packet” is appropriate here. There are no job IDs, pull-request numbers or machine paths in the roadmap text. The explicit source-following clause is R06.

The main-branch exemplars read for shape were Chebotarev, OrthogonalSpinGroups and ClassFieldTheory. Each layer here has Examples and Dependencies, and each numbered target has a source locator. The corrected dependency sections and 75 Needs lines were read; R01, R03–R05 and R07 explain where having a Needs line still does not supply the promised conclusion.

### Elaboration, signatures and padding

I ran the requested `lake env lean` command against this package's Suggested.lean from the pinned content checkout. Exit status 0; the only diagnostic was `warning: declaration uses 'sorry'` at line 59. Its only import is `import Mathlib`, so no Tau Ceti object build was needed. The additional R02 statability test uses an already available Tau Ceti object and also exits 0 with only its expected warning. Nothing is left running.

A scratch copy with `#check @` for both declarations elaborated. The resulting types are:

- `sumSquaresSeven : QuadraticForm ℂ (Fin 7 → ℂ)`.
- `spin7_not_acceptable`: there exist a type Γ, a Group structure, a Finite instance and two homomorphisms to `spinGroup sumSquaresSeven`, elementwise `IsConj`, with no single group element conjugating the homomorphisms.

There are no section variables; no hypothesis was dropped. Both types match §0.8. The sole definition has an actual body and is needed by the headline. Every backticked identifier presented as this roadmap's own resolves to one of these two declarations.

I tried the sole sorried theorem separately with `rfl`, `simp`, and `infer_instance`. Each fails: respectively a nonreflexive existential goal, an unsolved existential goal, and a goal that is not a type class. I also inspected the near matches and searched the pinned group/conjugacy/representation objects for a single lemma supplying this assertion; none does. Thus there is **zero padding among the one existing theorem**. The theorem needs a nonabelian conjugacy obstruction, not a routine tactic. The deficiency is missing headlines, not too many declarations.

### Headline inventory

| Deep result from the README | Status at the pins and acceptance-test coverage |
|---|---|
| Griess conjugacy, §0.0 | Statable on the native octonions; absent: R02. |
| Spin₇ unacceptability, §0.8 | Statable and stated; one-tactic probes fail. |
| Parameter injectivity/rigidity, §§0.4–0.5 | Parameter and comparison infrastructure missing; named in docstring. The Griess subtheorem must be separated from this reason. |
| Chenevier automorphic descent, §§0.9–0.10 | Automorphic carriers missing; needs its own docstring entry, R11. |
| Quaternion/Whittaker and spin-regular globalization, §§1.4–1.7 | Automorphic Hilbert spaces and smooth representations missing; R11. |
| Triality spin transfer and gamma comparison, §§2.2–2.4 | Local/global automorphic transfer and factor carriers missing; R11. |
| G₂ LLC, enhanced A₂ and diamond fibres, §7.1 | Smooth representation, parameter, theta and component-group infrastructure missing; explicitly named with its properties. The p = 3 qualification is retained. |
| Gamma-factor characterization, §§3.12–3.13 | Missing gamma-factor carriers; named. |
| Theta-diagram characterization, §3.14 | Covered explicitly by the §7.1 docstring entry's two characterizations and diagrams. |
| All-places global–local compatibility, §3.15 | Automorphic carriers missing; named. Supplier precision is R05. |
| Kret–Shin local parameters, §§5.1, 8.2 | Automorphic and local-parameter carriers missing; R11. |
| Exceptional spin identity, §5.6 | Smooth representations, theta and factors missing; named. |
| Generic supercuspidal correspondence, §7.2 | Smooth representations and Whittaker functionals missing; named. |
| Enhanced PGSp₆ diamond correspondence, §7.3 | Xu packets and local-parameter infrastructure missing; named. |
| Weak PGSp₆ correspondence and union-of-Xu fibres, §§10.1, 10.9 | Same missing carriers; both named. |

### Pinned declarations opened

Mathlib is pinned to `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti to `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are library-relative locators at those pins, not references to a newer online library.

| Declaration/object | File and line at the pin; content checked |
|---|---|
| `lipschitzGroup`, `spinGroup`, group instance | Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:62,293,385. The spin group is the even part of the pin group; Lipschitz generation uses invertible vectors. No smooth-representation or LLC structure is supplied by this definition. |
| `QuadraticMap.weightedSumSquares` | Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1408; evaluation at :1415 is the sum of the weighted squares. |
| `IsConj` | Mathlib/Algebra/Group/Conj.lean:32. Conjugation is witnessed by a unit; in the actual Group target this agrees with group conjugacy. |
| `Matrix.diagonal`, characteristic polynomial and diagonal formula | Mathlib/Data/Matrix/Diagonal.lean:50; Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140,158. Diagonal polynomial is the product of X minus the entries. |
| Determinant and degree/monicity | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:80; Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:115,119. The degree theorem carries nontrivial coefficients; ℂ satisfies this. |
| `TauCeti.Octonion` and algebra structures | TauCeti/Algebra/Octonion/Basic.lean:143,233,279,305. Native Zorn carrier, module, multiplication and nonassociative ring suffice for R02. |
| Octonion norm and imaginary submodule | Same file :537,551,831,861: norm multiplication, quadratic norm, trace kernel, rank-seven theorem. The rank theorem has `StrongRankCondition`; the ℂ applications meet it. No zero-ring generalization was inferred from the word “rank”. |
| Triality automorphism and cube | TauCeti/Algebra/Lie/D4/Tripled/Triality/Basic.lean:155,197; root action :161. Names exist, old file locator does not: R08. |
| Local Weil group and degree | TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:91,181,235. Native local Weil group and arithmetic degree exist; this alone supplies neither G₂ parameters nor smooth representations. |
| Semisimple representation | Mathlib/RepresentationTheory/Semisimple.lean:34. The predicate means a complemented lattice of subrepresentations; it is a native mathematical condition, not a free Prop surrogate. |

The G₂ short-root construction in Tau Ceti is not already identified with the full Chevalley G₂ and does not by itself supply the missing LLC carriers. Conversely, the explicit octonion algebra prevents claiming that the elementary automorphism-group model needed for Griess is unavailable.

### Supplier direction, ownership and overlaps

The instructed dependency check was run against the package and the supplied order/content checkout. Its complete output was:

```text
depcheck: 236 roadmaps, 2147 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No forbidden supplier is introduced by the package. R05's repair cites an existing earlier supplier already used by this package, adding §2.43 rather than a new direction of supply.

I used `roadmaps show` and object searches through `roadmaps grep`, read the supplied board-packages index before absence claims, and inspected the overlap results. No dropped cited ID, conflicting head, revision-only ID or missing old-to-new mapping was listed. The closest open scopes were also read: ExceptionalThetaCorrespondencesForG2 (#1736) owns the exceptional theta and relative-model infrastructure; AutomorphicLFunctionsAndLocalFactorsPartII (#1756) owns generalized factors; TwistedAutomorphicDescents (#1758) owns classical Bessel descents; GanGrossPrasadUnitaryGroups (#1404) owns unitary periods; ModularityAndLanglandsExtensions (#1180) owns the Arthur/Xu and potential-automorphy inputs. No second owner of this package's G₂ LLC, triality spin transfer, weak Spin₇ parameter construction or Spin₇ unacceptability was found. The Griess-algebra search hits concern the Monster, not the G₂ conjugacy theorem.

Resolved citations, with representative actual README line locators at the inspected heads (all files below are TauCetiRoadmap/<name>/README.md unless a main-branch path is given):

| Supplier and head | Sections resolved; representative line evidence |
|---|---|
| ExceptionalThetaCorrespondencesForG2 #1736 | §§0.6–0.9, 1.8; Layers 5–10, including the specifically named outer signs, theta dichotomy, tempered tables, quaternion stabilizers/periods and global nonvanishing. §0.6 begins :248, §0.7 :269, §0.8 :296, §0.9 :319, §1.8 :457. Spin-factor and real-unitarity contracts at :112 and :120 use the same earlier suppliers. |
| ModularityAndLanglandsExtensions #1180 | §§3.5,3.8,3.15,3.17,3.19,3.27 at :1792,1850,2015,2047,2081,2253. Xu self-twist stabilizer equality is present. The trace-formula hypotheses are retained by this package's contract. Missing import of §2.43 at :1490 is R05. |
| EndoscopicTransferAndUnitaryTraceComparison #999 | §§1.13,4.7a,4.8,10.1,10.26,10.30,10.31 at :504,1872,1893,3597,4125,4208,4224. §4.7a imports Jacquet–Langlands from its earlier owner; §10.30 retains monodromy. |
| MetaplecticAutomorphicForms #1063 | §§3.10,3.34,3.41,3.42,6.13,6.14 at :786,1026,1108,1116,1714,1722. Existing isometry/nonarchimedean statements do not eliminate the declared complex, similitude-table and Rallis contracts. |
| AutomorphicLFunctionsAndLocalFactors #924 | AL.3 at :1430, AL.4 at :2278; AL.3.7 strong multiplicity one at :1784 onward. Rankin–Selberg functional equations and boundary nonvanishing are present. This is not the owner of the missing Shahidi spin construction. |
| AutomorphicLFunctionsAndLocalFactorsPartII #1756 | Layer 6 at :1060 supplies generalized local factors; the explicit spin-factor extension remains a named contract. |
| SmoothRepresentationsOfLocalGroups #1688 | SR.2.1–2.3 at :1916,2045,2205; SR.3.1 at :2571, SR.3.3 at :2875; classical LLC normalization inside SR.5.2 at :4763–4777. |
| SmoothRepresentationsOfLocalGroupsPartII #1815 | SRU.1.1,1.7–1.10,3.8,3.10,4.7–4.8 at :422,542,578,592,606,867,893,1015,1027. Correct isolated-occurrence statement is present. §4.7's rank restriction matters in R04. |
| AutomorphicFormsOnReductiveGroups #1037 | §§2.4,2.5,4.2,4.3 at :416,446,644,662; the existing Hilbert-space/Whittaker interfaces do not prove the stronger globalization claims in R03–R04. |
| AutomorphicSpectralTheory #925 | §§6.16,6.18,6.19 at :3148,3176,3196. Shin's precise density theorem remains a declared gap. |
| AutomorphicGaloisRepresentationsPartII #1006 | AG2.2, AG2.5, AG2.6 at :1263,1818,2149. Full coefficient-prime comparison is conditional at :2453 and :3226: R05. |
| Main-branch suppliers | TauCetiRoadmap/ClassFieldTheory/README.md, Layers 5 and 9 (:1054,:1576); TauCetiRoadmap/ReductiveGroups/README.md, Layer 9 (:3029); RepresentationTheory/SpinRepresentations, Layers 2,4,5,6,8; Completed/OrthogonalSpinGroups/README.md, Layers 1–2; GlobalQuadraticForms; Completed/Chebotarev/README.md, Layer 10. The cited mathematical constructions occur there. |

The searches were by objects as well as names: octonion automorphisms, elementwise/global conjugacy, spin and vector representations, local/global theta, weak containment and isolated occurrence, generic converse, all-places compatibility and its irreducibility input. I did not independently inspect every other named open pull request without a supplied relevant file/head. No universal absence claim about those uninspected files is used as a finding.

### Supplier gaps and sources manifest

All eleven gap slugs occur both under Exact supplier contracts and in the plan's top-level gaps list; all have named earlier suppliers. None is reported merely for not yet existing in its supplier.

| Gap | Precision/minimality check |
|---|---|
| spin-pole-global-converse | GS20 line 44 restricts Theorem 1.1 to ℚ; the totally real extension is a real missing contract, not supplied by that locator. |
| gln-generic-local-converse | Twists through r ≤ n and monodromy are retained; the parameter use is bounded. No pinned generic-converse theorem found. |
| pgsp6-similitude-theta-tables | Proper-Levi tables, lower-tower JL and quadratic twisting are the specific missing similitude interface. |
| pgsp6-pgso8-complex-theta | Separate complex-place matching, as required at GS line 789; does not pretend the nonarchimedean tables apply over ℂ. |
| pgsp6-similitude-rallis | Generic global parameter, local nonvanishing, L-value and first-occurrence cuspidality hypotheses are stated. |
| pgsp6-shahidi-spin-factor | Correct earlier Part II owner; extends the same Shahidi spin construction rather than duplicating it. |
| relative-generic-isolation | Fixed second-place supercuspidal and selected globally generic spectrum are stated. ILM lines 1231,1259–1272 support the classical starting point; PGSp₆ is explicitly requested from the supplier. |
| poincare-weak-containment | Both declarations exist, but the Whittaker formulation needs R07; its consumers also overclaim level and archimedean control, R03–R04. |
| regular-real-unitarity | Separate quantified C and exactly G₂(ℝ), PGSp₆(ℝ); does not supply arbitrary-group genericity. |
| automorphic-plancherel-density | Shin Definition 3.5, Corollary 4.12 and Theorem 5.8 hypotheses are included; λ_t has the required growth, computed below. |
| kret-shin-gspin-galois | Totally real field, Steinberg twist, cohomological infinity and spin regularity are included; KS lines 2962–2978 support the irreducibility clause. |

The manifest contains twelve works, eleven certified and Griess settled as uncertified. No new work was needed, no duplicate key was added and no existing manifest entry was changed. The source excerpts were read in the operator's cache and were not copied into the repository. Original statements and Checks in the sampled passages were compared with sources; no copied source passage was found.

### Seeded locator verification

This checks the stated theorem, hypotheses and page, not merely the presence of a similar phrase. Lines refer to the supplied cached extractions. The author's source cautions were also inspected; the non-read original Griess article remains explicitly uncertified.

| Sampled target | Text opened and result |
|---|---|
| 0.7 Weak equivalence and elementwise conjugacy | GS Definition 12.1/Lemma 12.2, p.34, lines 1444–1450; CG Lemma 3.10, p.9, lines 350–363 and Proposition 3.12, p.10, lines 372–393. Compact-form input is correctly distinguished from the complex/WD extension the target proves. Semisimple traces alone do not discard the unipotent part. |
| 1.3 Poincaré series and weak containment | GS proofs of Propositions 10.5/10.7, pp.28–30, lines 1184–1197,1221–1237; SV Theorem 16.3.2, printed p.245, lines 11075–11080; Remark 16.4.1, lines 11239–11246. R03, R07 and R10. |
| 1.4 Globalization with a quaternion period | GS Proposition 10.5, pp.28–29, lines 1179–1197: finite and real prescriptions, nonzero period, no claimed unramified-outside-S conclusion. R03. |
| 2.1 Three triality maps over F | GS §4.1, pp.16–17, lines 687–710; lower-tower/spinor-norm comparison, pp.38–39, lines 1618–1627. Three central quotients and direction of pullback match; native file locator is R08. |
| 3.3 Split PGL₃ description | GS §3.2, p.11, lines 462–475; HD §8, p.25, lines 907–935 and Theorem 8.5, pp.27–28, lines 1017–1029. Duality orbit, outer-extension sign and discrete exceptions match. |
| 3.13 Gamma-factor characterization | GS Main Theorem (x), p.4, line 176; §3.4, p.13, lines 587–591. Tempered comparison first, generic GL₇ converse with N, and Griess are the required inputs; the latter now has a target. |
| 3.14 Theta-diagram characterization | GS Main Theorem (v), p.4, line 145 and the two diagrams, pp.3–4, lines 101–138. Dichotomy plus parameter injectivity gives uniqueness, without enhancement data. |
| 4.2 Non-self-dual A₂ packets | GS Proposition 3.2, p.14, lines 603–608, proof pp.14–15, lines 626–667. Corrected p = 3 injection direction and conditional surjectivity match. |
| 4.3 Self-dual A₂ packets | Same GS locator; HD Theorem 8.5, lines 1019–1025, and p.25, line 932. Three S₃ labels and the special p = 3 subregular case match. |
| 5.5 Siegel-induced spin identity | HD Theorem 15.2, pp.52–53, lines 2021–2031; GS Main Theorem (vi), p.4, lines 146–159. Generic tempered middle term is required; it need not be discrete series. |
| 5.6 Every generic discrete series of G₂ | The preceding HD table plus GS Corollary 5.3, p.21. The club Siegel branch and diamond discrete branch together give the dimension-eight spin identity. |
| 6.1 Diamond surjectivity | GS Proposition 6.1 and proof, pp.21–22, lines 889–918. Spin-pole comparison and quadratic untwisting are used, not unconditional generic surjectivity for every Spin₇ parameter. The package route inherits R01. |
| 6.6 One full Xu packet | GS Proposition 8.2 and argument, p.24, lines 999–1010; conclusion p.25, lines 1062–1067. One-in-all-in plus nonempty fibre identifies the entire distinguished packet; declared global spin-pole gap is needed. |
| 10.2 Temperedness and discreteness | GS Theorem 12.6 and proof, p.38, lines 1598–1613. Boundedness/discreteness of the constructed weak parameter follow with the stated direction. |
| 10.4 Lower-tower twists | GS §12.7, pp.38–39, lines 1614–1628. The source omits some detailed lower-tower verifications; this package explicitly assigns those tables/twist identities to a supplier gap. |

### Computed adversarial table

The final report table is restricted to the seeded targets, headline constructions, repairs and findings, as requested. These are explicit tests, not proofs of the deep theorems. Degenerations outside the standing characteristic-zero local-field universe (q = 1, the zero ring, positive-characteristic local F) were not silently treated as admissible instances. Residue characteristics 2 and 3 remain admissible and were tested in the packet cases.

| Statement | Instances tried | Values computed on the two sides / wrong-model control | Result and required change |
|---|---|---|---|
| §0.0 Griess; R02 | Trivial Γ; Γ cyclic of order 5; principal SL₂ | Identity action is conjugated by 1. For t = (ζ,ζ,ζ³), t² = (ζ²,ζ²,ζ), the seven-dimensional ζ-multiplicities are 2 and 1; adding the scalar line leaves 2 and 1. Principal action has dimensions 7 versus 1+7 on octonions. | The eight-dimensional native formulation retains the intended discrimination. State it in Lean. |
| §0.1 dual-group conventions | Diagonal SL₃ element (2,3,1/6), central −1 | v-spectrum = {1,2,3,1/6,1/2,1/3,6}, determinant 1; s∘i adds one eigenvalue 1, dimension 8. Central −1 has vector trace 7, spin trace −8. | Correct. A doubled Std₃ would have different eigenvalues. |
| §§0.2–0.5 conjugacy and rigidity | A₂ dual pair; nontrivial central χ; subregular vs principal | v∘jτ = 1⊕τ⊕τ∨ = v∘jτ∨. q(χ)=1; s(χ) = χ Id₈. Principal spin invariants have dimension 1; subregular spin invariants dimension 2. | Correct distinction; Griess is now owned, and the spinor must be nonisotropic. |
| §0.6 and sampled §0.7 | Central 1 versus −1; principal unipotent versus identity | Vector traces both 7; spin traces 8 versus −8. Principal unipotent spin Jordan sizes (7,1), identity sizes (1,1,1,1,1,1,1,1); traces both 8. | Need both representations and full conjugacy, not traces of one unipotent element. Present formulation keeps this. |
| §0.8 / existing Lean headline | Γ = (ℤ/4)², V weights (1,0),(1,2),(0,1),(2,1), η=(0,2) | Sum=(4,4)=0 mod4, det=1. ηV={(1,2),(1,0),(0,3),(2,3)}; V∨={(3,0),(3,2),(0,3),(2,3)}. ηV equals neither V nor V∨. For any (x,y), x,y or x+y is even. | Matches CG Example 1 and the global obstruction with elementwise conjugacy. Complexification preserves it by compact-form conjugacy descent. Not padding. |
| §§0.9–0.10 and §3.15 Galois comparisons | Principal Sym⁶; finite quotient S₃ | Dimension 7, determinant 1; Chebotarev densities for identity/transpositions/3-cycles are 1/6,3/6,2/6, sum 1. | Correct use of semisimple reconstruction; coefficient-prime input needs R05. |
| §§1.1–1.2 relative spectra | V⊕V with functional W₀(v₁)+W₀(v₂) | On (v,v): 2W₀(v); on (v,−v): 0. Orthogonal complement of zero-coefficient copies is the diagonal, not the full two-copy isotypic space. | Definitions discriminate correctly; no free isotypic replacement. |
| Sampled §1.3, R07 | ψ(n)=−1, f(g)=1 | Whittaker f(ng)=−1; ordinary quotient f(ng)=+1. | Contract needs the twisted space and fixed σ. |
| Sampled §1.3, R10 | St⊕⨁1 | St multiplicity 1 in the sum, 0 among its trivial summands. | Example refutes subsequence inference, not summand existence. Reword Check. |
| Sampled §1.4, R03 | Auxiliary finite z outside S; S empty | Declared allowed bad-place count is 1; claimed count is 0. Empty S permits the constant representation, period vol([G_D])>0. | Empty-set Check does not justify no extra ramification. Carry permitted place and real prescriptions. |
| §1.6, R04 | Wrong-sign real D_k, k arbitrarily large | dim Hom_N(D_k,ψ_wrong)=0; global ψ-genericity requires a nonzero functional, dimension at least 1. | Add real ψ-genericity and isolation; distance to walls cannot change 0 to 1. |
| §1.7 spin-regular globalization | t=1 and t=0 | h=(11,6,3) gives {±10,±7,±4,±1}; h=(3,2,1) gives two zeros. λ_t sum=14t even; simple positive pairings 4t,2t tend to infinity. | Correct lattice and regularity, including the negative control t=0. |
| Sampled §2.1 | Three nontrivial order-two subgroups in μ₂² | Their count is 3; triality permutes them cyclically and its third iterate is identity. Standard/spin dimensions both 8, with restriction 1+7. | Correct three-quotient construction; fix only pinned path R08. |
| §§2.2–2.3 spin transfer | Lift from G₂ | Spin rank 8 = 1+7, so transfer 1⊞A has two summands, not one cuspidal rank-eight term. | Definition correctly allows isobaric noncuspidal transfer. |
| §2.4, R01 | One/two repeated local components | 2·(1/2)=1 and 2²·(1/4)=1, but 2≠1. | Extra ratio is not cancelled. New owned input needed. |
| §§2.4–2.5 normalisation | Steinberg; χ=-1; change ψ to ψ_a | Spin weights 6,4,2,0,0,−2,−4,−6 = weights(Sym⁶⊕1), dimension 8; χ negates all eight eigenvalues and det remains (−1)⁸=1; ψ_a exponent is 8(s−1/2) on both factors. | Correct parameter and twist rules; not Sym⁷/St_GL₈. |
| §3.2 trivial vs Steinberg | Arithmetic Frobenius q=5 | Both semisimple lists 5^−3,…,5³; N=0 versus N of rank 6. Absolute value=1/5, ω=5. For χ(ϖ)=2, geometric parameter at arithmetic Frobenius is 1/2, its dual 2. | Convention transport and retention of N discriminate the two representations. |
| Sampled §3.3 | τ not self-dual vs τ∨; τ=St_PGL₃ | jτ and jτ∨ have the same standard sum 1⊕τ⊕τ∨. For St, φτ=Sym² has dimension 3 and trivial-summand multiplicity 0. | Duality orbit and the two self-dual extensions are correctly distinguished. |
| §§3.10–3.12 gamma construction | Rank-r twist and two maximal Levis | dim(vφ⊗τ)=7r; determinant contribution det(τ)^7. Levi dimensions: 2+2+1+1+1=7 and 2+2+3=7. | Matches GF Theorem 2.4; normalization is not arbitrary scalar data. |
| Sampled §3.13 | Principal bounded WD versus trivial bounded WD | Principal SL₂ has N rank 6 and one Jordan block of length 7; trivial parameter has rank 0 and seven blocks of length 1. | Monodromy-sensitive converse is needed; stated supplier gap retains it. No semisimplified-only substitute. |
| Sampled §3.14 | Spade duality, heart standard comparison | jτ and jτ∨ give one parameter class, not two; injectivity of v gives one class from the heart diagram. The dichotomy covers two disjoint loci with union Irr(G₂). | Correct uniqueness at the level of unenhanced parameters. |
| §3.15, R05 | n=7, universal irreducibility input | “Density-one primes” has density 1, while the empty set has density 0; hence each eligible CM form has at least one irreducible member. One fixed Π gives no witnesses for the other forms. | §2.43 discharges the exact universal premise; cite it. |
| §4.1 opposite algebras | D₁ and D₂ | inv(D₁)=1/3, inv(D₁^op)=−1/3=2/3. Self-dual τ gives one division lift, non-self-dual τ and τ∨ give two potentially distinct lifts. | Correct dual/opposite convention. |
| Sampled §4.2, p=3 | Zero, one or two nonzero division lifts | Fibre sizes 1,2,3; target Irr(μ₃) has size 3. Correct map is fibre→labels, image sizes 1,2,3. | Repaired injection valid; surjectivity requires both division members. |
| Sampled §4.3, p=2 and p=3 | Self-dual discrete τ; S₃ labels | dim irreducibles 1,1,2; squares sum 6. std₂ restricted to μ₃ has trace ζ+ζ⁻¹=−1. At p=3, χ²=χ³=1 forces χ=1 for a St twist; self-dual supercuspidals occur only at p=2. | At p=3 only the complete Sym²/subregular case remains. Corrected statement matches sources. |
| Sampled §5.5 | τ=St_PGL₃ | Spin parameter 1⊕1⊕Sym²⊕Sym² has dimension 1+1+3+3=8, invariant multiplicity 2. | Intermediate generic Siegel constituent is tempered, need not be discrete series. Corrected diagram retained. |
| Sampled §5.6 | Principal generic St_G₂; subregular generic | Principal gives 1⊕Sym⁶, dimension 8 and invariants 1; subregular gives the preceding 8-dimensional sum, invariants 2. | Club and diamond branches both fit the exceptional spin identity. |
| Sampled §6.1 | Generic supercuspidal diamond; principal diamond | Supercuspidal SL₂ factor trivial; spin invariant line contributes L(s,1), pole order at least 1 at s=0. Principal spin=1⊕Sym⁶ also has invariant multiplicity 1. | Correct spin-pole mechanism; gamma comparison depends on R01. |
| §§6.2–6.3, §7.3 | Trivial vs nontrivial quadratic twist; quotient stabilizers | q(χφ)=qφ since χ²=1; spin twists by χ. Orbit size is [X:Stab], not automatically #X; quotient by central μ₂ removes its enhancement contribution. | No free-action assumption introduced; Xu stabilizer equality is supplied. |
| Sampled §6.6 | Principal singleton; full packet with more than one member | Principal distinguished fibre/packet sizes both 1. In a larger packet, one-in-all-in makes membership indicators all 1 once one is 1, not just one selected member. | Source argument establishes equality of whole sets; conditional on declared global converse. |
| §7.1 assembled headline | Discrete A₂ at p=3; unramified trivial input | Fibre cardinalities ≤3 vs 3 enhancement labels; trivial and Steinberg have same semisimple spectrum but N ranks 0 and 6. | Finite fibres and qualified enhancement survive assembly; no false p=3 bijection. |
| §7.2 generic supercuspidals | Non-generic discrete member; generic supercuspidal | Whittaker dimension 0 excludes first; generic multiplicity one gives dimension 1 for second. A parameter with nontrivial SL₂ is outside the supercuspidal parameter locus. | No extension of HKT to arbitrary nongeneric supercuspidals is asserted. |
| §8.2, R09 | Cocharacter factoring through principal PGL₂ | Zero weight multiplicity 2 in Sym⁶⊕1 versus regular allowed multiplicity 1. Global spin-regular h=(11,6,3) has eight distinct weights, while a finite St component still has repeated zero. | Separate global Hodge regularity from local monodromy; replace Check. |
| §§9.2–9.3 extended transfer | Lower tower Sym³; proper standard Levis of C₃ | Λ²Sym³=Sym⁴⊕1: 6=5+1; vector extension 1⊕1⊕Sym⁴ dimension 7, spin Sym³⊕Sym³ dimension 8. Proper standard Levi subsets count 2³−1=7. | Correct lower-tower dimensions and all-proper-Levi scope. |
| Sampled §10.2 | Principal parameter and trivial parameter | Centralizer modulo centre is finite for principal SL₂; trivial parameter centralizer has dimension 21. q has kernel order 2 and both source/target rank 3, so proper-Levi containment and boundedness are preserved. | Discreteness and temperedness do not depend on a choice of representative of the weak class. |
| Sampled §10.4 | φτ with eigenvalues 2,3,5,1/30; χ=-1 | Λ² eigenvalues {6,10,1/15,15,1/10,1/6}; χ²=1 leaves them unchanged. Spin φτ⊕φτ∨ eigenvalues are all negated. For μ²≠1 exterior square gains μ². | Quadratic-only rule is essential; full spin data retained. |
| §§10.7–10.9 weak fibres | Central twist of iφ, φ diamond discrete | Vector unchanged; invariant multiplicity in 1⊕vφ is 1. Matching twisted spin data forces the G₂ rigidity condition, giving one conjugacy class on this locus. | Singleton assertion is restricted to the justified diamond image, not all Spin₇ parameters. |

Other computed rows from the first review were rechecked against unchanged formulas (the diagonal torus, period multiplicity, opposite algebras, Levi factorization and lower-tower exterior square). Its uncomputed summaries were not treated as proofs. The tests above deliberately distinguish finite weak-containment data from global level control, trace equality from monodromy, central twists from trivial twists, and fixed-split component groups from raw centralizers.

## Not verifiable

- Griess, Basic conjugacy theorems for G₂, Theorem 1: original text is settled as uncertified/paywalled. I did not request it again or pretend to read it. The claimed form is attested at HKT line 913 and C line 2239; R02 tests its statability independently.
- Arthur's book, Xu's papers and other works owned solely by named suppliers were not newly fetched: this review resolves the supplier statements and their hypotheses, not their eventual proofs. No missing-source request is warranted for those indirect references.
- The Whittaker extension of SV's anisotropic spherical theorem and the other ten declared supplier gaps are contracts, not results proved in the cached text merely by citing it. Their absence in today's suppliers is not a finding. R07 identifies an actual wrong specification of one contract.
- Ownership against every open pull request named without a relevant supplied file/head was not checked individually. The supplied overlap leads, the closest scopes, board package index, main roadmaps and object searches at available heads were checked as described above.

## Source issues

- **Gap** in GS at Proposition 4.1(i), proof, pp.18–19: the source says Proposition 10.7 permits every unprescribed finite component to be spherical; it should be a globalization or auxiliary-factor argument handling its permitted exceptional place; affects the proof.
- **Error** in GS at Main Theorem (vi), p.4: the source says the intermediate PGSp₆ representation is generic discrete series; it should be generic tempered, including the Siegel-induced partners of the club locus; affects a stated result.
- **Error** in GS at Proposition 3.2, proof, p.14: the source says the discrete A₂ centralizer always has order three; it should be μ₃ in the non-self-dual case and S₃ in the self-dual case; affects the proof.
- **Gap** in GS at Lemma 8.3, proof, p.25: the source says the cited spin-pole converse applies over its totally real field; it should be a separately justified totally real extension of GS20 Theorem 1.1, which states the result over ℚ; affects the proof.
- **Gap** in HKT at Lemma 4.6, proof, p.21: the source says stabilizers of nonzero spinors are G₂; it should be stabilizers of nonisotropic spinors, with complete reducibility used to choose a nonisotropic invariant vector; affects the proof.
- **Misprint** in Shin at Theorem 5.8, proof, author PDF p.27: the source says Proposition 4.12 supplies the limit; it should be Corollary 4.12; affects nothing.
- **Misprint** in GS at Main Theorem (ix), p.4: the source says the gamma factor closes before the tensor product; it should be the gamma factor of the tensor product with φ_τ, as in §3.4; affects nothing.
- **Misprint** in GS at §1.2, p.5: the source says the globalization appendices are sections 9 and 11 and misspells Griess; it should be sections 10 and 11, and Griess; affects nothing.
- **Misprint** in GS at §3.1, p.10: the source says Theorem 2.1(i) supplies the theta dichotomy; it should be Theorem 2.1(ii); affects nothing.
- **Misprint** in GS at §3.3, p.11: the source says the totally definite octonion algebra is over the local field F; it should be over the totally real number field k; affects nothing.
- **Misprint** in GS at §4.4, p.19: the source says the functional-equation comparison concerns representations of G₂(F); it should be PGSp₆(F); affects nothing.
- **Gap** in GS at Theorem 9.1(ii), p.27: the source says the enhanced PGSp₆ compatibility applies to every irreducible G₂ representation; it should be restricted to the diamond discrete range where the enhanced PGSp₆ correspondence has been constructed; affects a stated result.
- **Gap** in GS at Lemma 10.1, proof, p.27: the source says vanishing of the open-orbit coefficients implies Howe rank exactly two; it should be rank at most two, with lower ranks excluded separately; affects the proof.
- **Error** in GS at Proposition 11.6, p.33: the source says weak containment in an indexed sum gives convergence along a subsequence of its summands; it should be membership in the Fell closure of their set, allowing an isolated summand to occur only once; affects a stated result.
- **Gap** in GS at Lemma 12.4, proof, p.37: the source says Shin Theorem 5.8 gives spin-regular archimedean weights; it should be an application of Corollary 4.12 along a specified growing spin-regular weight sequence; affects the proof.
