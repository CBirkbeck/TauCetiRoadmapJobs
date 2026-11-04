<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1174#issuecomment-6394876187 -->
Review (claude) of d33be20

Verdict: needs changes

1. **F01** (P1) The lifting headlines rest on an open problem that this roadmap assigns to itself

   **Location.**
   - `packages/GlobalGaloisDeformationsPartII/README.md` lines 47–51 and 769: "The arithmetic construction is the internal obligation gap:auxiliary-field-independence."
   - Line 17: "Section 3.2 owns the additional quantitative selection argument".
   - `design/plan.json`: gap `auxiliary-field-independence`, supplier `GlobalGaloisDeformationsPartII`, section `§3.2`.

   **Claim.** The README treats §3.2's arithmetic estimate as an internal target. On that basis it states §§3.4 and 3.6, Layers 4–6 and §§6.3–6.5, 7.6, 8.5, 8.7, 9.2–9.5 and 10.1–10.3 as unconditional theorems.

   **Witness.**
   - The only published route is FKP22 Lemma 3.7. Its proof uses that inertia at v generates each factor separately, not that it generates the product (FKP22 lines 682–690). The same step recurs on p.18 (FKP22 lines 804–816).
   - README §2.9 gives counterexamples under C1–C4: repeated constituents, as in the F₄ images of FKP19 Proposition 7.8 and Remark 7.9. I re-verified them.
   - No erratum exists on the authors' publication page. The §3.2 proof route covers only the elementary bound (1−ε)ˢ, and the repair report itself says the arithmetic construction is unproved.
   - The dependency chain is: §3.4 needs §3.2 (line 809); §3.6 needs §3.4; §4.6 needs §3.6; §5.3 needs §4.6 and §5.4 needs §5.3; §6.3 needs §§3.6 and 5.5.

   **Repair.** Choose one of two routes; a human may prefer to decide between them.
   - **(a) Prove it.** Give §3.2 a complete proof route whose every input is a target, a supplier section or a pinned declaration, and whose arithmetic step is checked by a reviewer. It is then an ordinary target, and the self-supplied gap is removed from the README and the plan.
   - **(b) Make the dependence explicit.** Add, as an explicit hypothesis, "the conclusion of §3.2 holds for this datum" to §§3.4 and 3.6, the Layer 4–6 targets that use §3.6, and §§6.3–6.5, 7.6, 8.5, 8.7, 9.2–9.5 and 10.1–10.3. Then:
     - keep the generality unchanged;
     - route §6.6 through FKP19 Theorem 6.11, which proves it independently;
     - say in the Summary and Scope that the unconditional reducible theorems await §3.2;
     - delete the self-supplied gap, since a gap names another roadmap.

   **Tested.** Take the §2.9 example (F=ℚ, M*=𝔽_p(κ̄)³). Under (b), its hypothesis is not met, so no unproved conclusion is asserted. Under (a), the reviewer must be able to check every step of the new route on the same example.

2. **F02** (P2) Two gaps created by the repair ask LocalGaloisDeformationRings for what it already states

   **Location.**
   - Line 192 (gap:full-torus-ordinary-character): "imposing the values of a Z-basis of X*(T) fixes θ itself, including its central part".
   - Line 194 (gap:fixed-similitude-local-components): "export that locus as a union of generic components of framed dimension dim Gᵈᵉʳ+[F_v:ℚ_p]dim Flag(G⁰)" and "a smooth Steinberg point".

   **Witness.** All three statements are already at LocalGaloisDeformationRings head 11b2c65:
   - §6.5 imposes torus equations for a basis of the character lattice besides the root equations, and notes that the root equations alone fail for GL₁.
   - §6.17 makes the ordinary locus a union of components of dimension dim G+[K:ℚ_p]dim Fl_G, and says that fixing the quotient into G/Gᵈᵉʳ replaces dim G by dim Gᵈᵉʳ.
   - §2.28 shows that a Steinberg lift at the specified trivial prime is smooth.
   - README line 186 already consumes §§6.5 and 6.17.

   **Repair.** Delete both gaps from the README and the plan. Cite LocalGaloisDeformationRings §6.5, §6.17 and §2.28 by name in the Needs lines of §§8.5 and 10.1.

   **Tested.** For Gₘ, inertia values 1 and 4 in ℤ₃^× satisfy the same (empty) root equations. They differ on the basis character, which §6.5's torus equations already detect. For fixed-determinant GL₂ over ℚ_p, §6.17 gives 3+1=4, the value the gap requests.

3. **F03** (P2) Three gap requests remain compound or lack their hypotheses (the F04 pattern)

   **Location.**
   - Line 110 (gap:finite-image-semisimplification): three exports (Levi projection and uniqueness of G-semisimplification, residue-field behaviour, the m/u/u⁻ filtration), with no field, characteristic or group named.
   - Line 112 (gap:uniform-finite-field-root-position): two exports in one sentence.
   - Line 98 (gap:large-prime-unipotent-exponential): P, U and the base field are not named.

   **Witness.**
   - The phrase "a root vector outside any proper prime-field subspace" is false if the torus is fixed. In sl₂ over 𝔽_p, W=kE₁₂⊕kE₂₁ is proper and contains every root vector of the diagonal torus.
   - The source quantifies over all split maximal tori (FKP22 line 575). The root vector of the torus conjugated by [[1,0],[1,1]] is [[−1,1],[−1,1]], which is not in W.

   **Repair.** Give one slug per export, with its hypotheses inline. Example: "for split connected reductive G over a finite field k of characteristic above a bound depending only on the root datum, and any proper 𝔽_p-subspace W of Lie(Gᵈᵉʳ)_k, there are a split maximal torus T, a root α and X∈g_α with X∉W". Name the parabolic P=MU and the field for the exponential. Record the new slugs in the plan.

   **Tested.** On the sl₂ example, the corrected sentence is true via the conjugate torus. The fixed-torus reading is excluded.

4. **F04** (P2) `Suggested.lean` declares a statable lemma to be an unstatable headline

   **Location.** `packages/GlobalGaloisDeformationsPartII/Suggested.lean` line 26: "The stable-lattice segment and fixed-weight-level finiteness: the arithmetic action on the lattice tree and the newform attachment interface are missing."

   **Claim.** The §8.9 segment theorem is a headline that the pins cannot state.

   **Witness.**
   - §8.9 concerns an arbitrary group acting on E² over a complete discrete valuation field. It needs no newform interface.
   - In apartment form ("stable lattices are exactly the homotheties of Oe₁⊕ϖˢOe₂ with a≤s≤b") it is statable with Mathlib's `IsDiscreteValuationRing`, `Submodule` and `Representation`. IntegralHeckeAndGaloisDeterminants states a lemma of the same kind (§1.4, `classical_ribet_lattice`, head 1383569).
   - It is also an input of §8.10 (FKP22, proof of Proposition 7.7), not an end theorem: README line 3 does not list it.

   **Repair.** Remove "The stable-lattice segment" from the docstring's list and keep §8.10 with its missing carrier (newform Galois attachments and their lattices). Add no declaration, since an input lemma would be padding.

   **Tested.** With the corrected list, every remaining item names a carrier that I confirmed is absent at the pins. Tau Ceti has reductive group schemes over rings (`TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38`) and derived group schemes (`…/Derived/Basic.lean`). It has no topology on G(O), no local deformation spaces, and no Galois representations of newforms or automorphic representations.

5. **F05** (P2) §8.9 restates IntegralHeckeAndGaloisDeterminants' classical Ribet lattice without citing it

   **Location.** Line 1396: "The endpoint reductions are nonsplit extensions in the two opposite orientations". Line 14 (Scope) claims ownership.

   **Witness.**
   - IntegralHeckeAndGaloisDeterminants §1.4, "Classical Ribet lattice" (head 1383569, Lean name `classical_ribet_lattice`), already proves the overlapping part. For compact G, irreducible ρ and distinct residual characters, it gives a stable lattice whose reduction is nonsplit in a prescribed orientation, and the other orientation by swapping.
   - That roadmap is line 29 of the merge order, so it is an allowed supplier.
   - §8.9's Needs line (1407) and the Scope do not cite it.

   **Repair.**
   - Cite IntegralHeckeAndGaloisDeterminants §1.4 "Classical Ribet lattice" for the existence of nonsplit reductions in each orientation.
   - Add one clause saying what §8.9 adds: the segment shape, splitting at the interior vertices, and the endpoint classes being invariant under coefficient extension.
   - Add the citation to the Scope and to §8.9's Needs.

   **Tested.** With bounds min v(b)=2 and min v(c)=1, the segment has s=−2,…,1. The two endpoint orientations are exactly the supplied lemma's two outputs. The four vertices and the split interior remain §8.9's own content.

6. **F06** (P3) The Whitehead part of gap:semisimple-lie-cohomology-vanishing duplicates a roadmap on main without citing it

   **Location.** Line 164: "Whitehead vanishing in degrees one and two for every finite-dimensional module".

   **Witness.** AffineLieAlgebras (main), §A1 "Currents and continuous cohomology", plans H¹(g,M)=H²(g,M)=0 for finite-dimensional modules over a complex simple g.

   **Repair.** Name AffineLieAlgebras §A1 in the contract as the owner over ℂ. Say in one clause how the request differs: the ArithmeticLocallySymmetricSpaces ALS.F.5 complex, semisimple Lie algebras over p-adic coefficient fields, and all-degree vanishing without invariants.

7. **F07** (P3) Citation labels that do not exist at the supplier heads (the F08 pattern)

   **Location.**
   - Line 1552: "ModularityAndLanglandsExtensions ML.2/potential-automorphy-with-steinberg-place".
   - Line 1565: "ML.2/compatible-system-from-potential-automorphy".
   - Line 1335: "OrdinaryAutomorphicFormsAndModularityLifting §5.2/theorem-a-over-q" and "GL2ModularityLifting §10.15/pan-residually-reducible-fontaine-mazur".

   **Witness.**
   - ModularityAndLanglandsExtensions (head 2d70821) uses "Layer 2" and §§2.28 and 2.48; "ML.2" occurs nowhere.
   - Neither slash identifier occurs at heads faca0d2 or 1e734ab. The sections §5.2 and §10.15 do exist.

   **Repair.** Cite "ModularityAndLanglandsExtensions §2.28", "§2.48", "OrdinaryAutomorphicFormsAndModularityLifting §5.2" and "GL2ModularityLifting §10.15".

8. **F08** (P3) Repeated Checks, copied Examples and formatting left by the repair (the F10 pattern)

   **Location and repair.**
   - §1.11, lines 576–577: both bullets compute the scalar point (cI,c²) with χ=1 and det=c². Merge them.
   - The `### Examples` paragraphs of Layers 1 and 3–10 copy Check bullets verbatim; for example, line 841 repeats lines 792, 807 and 835. Replace each with one new worked example, or with a pointer.
   - Lines 116 and 118 are two consecutive `**Checks.**` blocks under the ReductiveGroupsPartII contracts. The first holds a §8.9 apartment check that belongs in §8.9.
   - §8.8, lines 1374–1390: API-style bullets about Mathlib's `ShortExact` have no lead-in, and a blank line splits the Checks list.
   - §7.8, line 1251: the δ-dependence sentence appears twice.
   - Line 1537: "Theorem5.2" lacks a space.

9. **F09** (P3) §10.4 states no theorem

   **Location.** Line 1576: "compare §6.3 with the lifting part of FKP22 Conjecture D under precisely the residual and local hypotheses of that theorem."

   **Witness.** Rule 11 (Interfaces) requires a promised comparison to be a target with hypotheses. There is no conclusion to test.

   **Repair.** State the implication. If ρ̄ is an L-homomorphism satisfying §6.3's hypotheses and μ has Zariski-dense image in the central torus G⁰/Gᵈᵉʳ, then §6.3's lift is Zariski dense in G and satisfies the first bullet of Conjecture D (FKP22 pp.4–5). Otherwise delete the section.

   **Tested.** For GL₂ with finite determinant, the derived closure has dimension 3 and the central image dimension 0. The hypothesis excludes this case, as it should.

10. **F10** (P3) `design/plan.json` was edited beyond adding gaps

   **Location.** Comparing the package commit with the repair commit:
   - seven gap entries removed: `all-coefficient-place-monodromy`, `good-characteristic-centralizers`, `large-prime-reductive-group-inputs`, `polarized-coefficient-convention`, `positive-characteristic-duality-contract`, `small-dimensional-finite-group-input`, `small-dimensional-finite-images`;
   - three existing entries modified;
   - `auxiliary-field-independence` lost its `detail`, `neededBy` and `title` fields, which documented the proof gap and its dependants.

   **Witness.** The package stage may add gaps; nothing else in `plan.json` changes after the design. The first-round review also said that removal belongs to the intake or a human.

   **Repair.** The maintainer either accepts the removals at intake or restores the entries. Restore G1's `detail` and `neededBy` fields in either case; they are the record behind R01.

11. **F11** (P3) Notation and manifest details

   - **ω has two meanings.** Lines 196 and 1307 use ω for the finite p-power correction character, while line 232 uses ω for the mod-3 cyclotomic character. Rename the correction character, for example to ω₀.
   - **Two owners for fibre stability.** §4.7 lists fibre stability and the cardinalities of L^α_r as its own API (lines 952–954), while gap:root-cocycle-lattices asks LocalGaloisDeformationRings to export them. Mark them as imported from the contract.
   - **FKP19 manifest DOI.** `sources.toml` records the arXiv DOI 10.48550/arXiv.1904.02374, while the README cites Duke Math. J. 170 (2021). Add the published DOI 10.1215/00127094-2021-0003 next to the arXiv locator, with the existing version note. The FKP22 locator text "corrected applications" is process wording; replace it with "applications".

Eleven findings: one P1, four P2 and six P3. The repair applied every finding of the first round, and ten of them are fully repaired. Two problems remain. First, the repaired gap `auxiliary-field-independence` now names this roadmap as its own supplier for an estimate that no source proves, and every lifting headline depends on it (R01). Second, the F04 split introduced two gaps that ask a supplier for what it already states (R02), while the same compound pattern survives in three other gaps (R03).

## Status of the previous findings

| Id | Status | Repaired passage (README unless noted) | Remark |
|---|---|---|---|
| F01 (P1) | Repaired as asked; new defect | Line 49: "What GlobalGaloisDeformationsPartII must provide (gap:auxiliary-field-independence): Under C1,C3,C4, at §3.2 construct a uniform ε>0 and arbitrarily long finite cocycle Frobenius-test families …" | The plan entry now names this roadmap and §3.2. Self-ownership of an unproved estimate is R01. |
| F02 (P1) | Repaired | `design/plan.json`: 27 gaps, none of the five retired slugs | Done by deleting entries, which goes beyond the add-only rule (R10). |
| F03 (P2) | Repaired | Line 19: "AutomorphicLFunctionsAndLocalFactors §AL.3, “Leveled shtukas and ramified rank induction”, owns both directions …". Line 1563: "after quadratic-CM descent … by AutomorphicSpectralTheory §7.1" | Checked at head 5d22a23: the AL.3 target constructs both directions with finite-order determinant. Checked at head c5cfb92: §7.1 proves descent and the fibre theorem. |
| F04 (P2) | Partly repaired | Lines 100–108 and 129–135 split the centralizer and finite-image gaps, with their hypotheses | Gaps at lines 98, 110 and 112 remain compound (R03). Two gaps split off at lines 192 and 194 restate their supplier (R02). |
| F05 (P3) | Repaired | Line 628: "FKP19 §5.1, p.27 (FKP19 line 1189)" | FKP19 line 1189 is on p.27 and kills the dual Sha group by trivial primes. |
| F06 (P3) | Repaired | Line 773 "discussion preceding Proposition 5.12, p.34"; line 851 "p.45"; line 925 "p.46"; line 426 "For every split connected reductive G there is also n_G"; line 730 "pp.59–60 (FKP19 line 2653; FKP19 line 2676)" | All locators agree with the page markers of the cached text. |
| F07 (P3) | Repaired | Line 1396: "§1.3, Exercises 1.5–1.7 and 1.10, p.8"; manifest locator updated the same way | Ribet10 lines 221, 239, 243, 265, 308, 318 and 339 hold the cited items. |
| F08 (P3) | Repaired; pattern recurs | Line 57 names Ш¹_S of ArithmeticGaloisDuality R02.4.2–R02.4.3; lines 59 and 463 name `CompositionSeries.jordan_holder` | Other labels that do not exist at the heads: R07. |
| F09 (P3) | Repaired | Titles of §1.7, §7.7 and §7.8; line 806 "requiring equal coefficients is false for p≠3" | No process words remain (grep). |
| F10 (P3) | Repaired; pattern recurs | Line 884 is one code span; Needs lines write "gap:root-cocycle-lattices and gap:smooth-local-approximation"; line 1389 "between the representations for t and s forces t=s" | A new duplicate in §1.11, and Examples that copy Checks verbatim: R08. |
| R03 (P2) | Repaired | `Suggested.lean` holds only the module docstring and the namespace; §8.8 stays a prose target | The docstring has a new false claim (R04). |

## Adversarial table

Rows cover every passage the repair changed and the 15 sampled targets. For text the repair did not touch, the first round's table (85 rows, every row with computed values) stands; I checked its rows for §§0.1, 0.3–0.5, 1.1, 1.3, 1.6–1.9, 1.12, 2.1, 2.3–2.6, 2.8, 3.3, 3.5, 4.1–4.2, 4.4–4.5, 4.7, 5.1–5.5, 6.2–6.6, 7.1–7.7, 8.1–8.7, 8.10–8.11, 9.1–9.3 and 10.1–10.2 against the current text.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Internal target §3.2 / gap G1 | §2.9 example F=ℚ, M*=𝔽_p(κ̄)³; F₄ with multiplicity m≥2 | ζ_w(τ_w)=1−1=0 in finite H¹ → relation (1,−1,−1,1); tuple span W-multiplicity ≤dim W vs product ≥m·dim W | estimate unproved; dependants unconditional | R01 |
| §3.2 elementary bound | ε=1/2, s=4; repeated test; alternating a_j,b_j | (1/2)⁴=1/16<1/10; repeated 1/2; limsup 1,1 vs product 0 | sound | none |
| gap nilpotent-lie-centralizers | SL₂, p=7, X=E₁₂ and X=0 | C=[[a,b],[0,a]], a²=1: dim 1, in Borel; X=0: dim 3 | precise, sound | none |
| gap semisimple-lie-centralizers | X=diag(1,−1), p=7 and p=2 | dα(X)=2,−2, C=T dim 1; p=2: X=I central, dim 3 | sound | none |
| gap torus-centralizers-are-levi | SL₂ diag torus; S=1; SL₃ diag(t,t,t⁻²) | dims 1, 3, 4 (block type (2,1)) | sound | none |
| gap semisimple-group-centralizers | PGL₂, s=diag(−1,1); ratio ≠±1 | α(s)=−1, w·s=s mod centre: 2 components; generic: T, dim 1 | sound | none |
| gap bounded-power-levi-centralizer | same s | s²=1, C(s²)=PGL₂ (dim 3), a Levi; n=2 divides n_G | sound (FKP19 line 2791) | none |
| gap uniform-finite-field-root-position | sl₂/𝔽_p, W=kE₁₂⊕kE₂₁ | fixed torus: all root vectors in W; conjugate torus vector [[−1,1],[−1,1]]∉W | true only over all tori; compound | R03 |
| gap finite-image-semisimplification | [[a,b],[0,d]] → diag(a,d) | b=1 becomes 0 after projection | content sound; compound, no hypotheses | R03 |
| gap small-dimensional-adjoint-semisimplicity / h1 | SL₂(𝔽₁₁); C₂ by −1 on 𝔽₁₁; C₁₁ trivial | 11>2(3+1)=8; H¹=0 via 2⁻¹=6; dim H¹=1 but O₁₁≠1 | sound (FKP19 lines 2706, 2720) | none |
| gap small-dimensional-extension-splitting | (I+E₁₂)diag(1,−1)(I−E₁₂); unipotent C_p | [[1,−2],[0,−1]], complement k(e₁+e₂); Levi kernel order p, no complement | sound: an injective Levi projection forces O_p(Γ)=1, because a normal p-subgroup acts trivially on the irreducible blocks | none |
| gap larsen-pink-normal-series | C₃⊂𝔽₇^×; unipotent C₇; Γ=1 | factor orders (1,3,1), (1,1,7), (1,1,1) | sound (LP11 line 52, line 2613) | none |
| gap full-torus-ordinary-character | Gₘ, inertia ↦1 vs 4 in ℤ₃^× | 0 roots; basis character 1 vs 4 | already LocalGaloisDeformationRings §6.5 | R02 |
| gap fixed-similitude-local-components | fixed-det GL₂/ℚ_p; N=E₁₂ vs 0 | 3+1=4 vs 3+3=6; rank 1 vs 0 | already LocalGaloisDeformationRings §§6.17, 2.28 | R02 |
| gap gl2-local-determinant-normalization | r=2; unramified ζ≠1 | μ ↦ κ̄·χ̄κ̄⁻¹=χ̄; ω(Art p)=1 needed for global inflation | sound; not in §8.5 (determinant μ only) | none |
| AL.3 contract (F03) | both directions at head 5d22a23 | automorphic→Galois with finite-order determinant; reverse construction and uniqueness | cited target exists | none |
| AutomorphicSpectralTheory §7.1 (F03) | quadratic η, inert a=2; rank-two trace | 1 and η same base change; a²=4; t→−t, d→d | sound | none |
| ArithmeticGaloisDuality contract check | trivial place over 𝔽₃, trivial line | h⁰,h¹,h²=1,2,1, χ=0; unramified line 3; annihilator of u is u | sound | none |
| §1.2 n_G broadened (F06) | PGL₂ diag(−1,1) | square 1, centralizer whole group | sound | none |
| §1.4 Jordan–Hölder via Mathlib (F08) | Heisenberg group of order 27; central C₃ | 3 trivial factors; 1 factor | sound (`Mathlib/Order/JordanHolder.lean:454`) | none |
| §1.11 checks (F09) | (cI,c²); κ̄ of order 5 | χ=c²/c²=1, det=c²; orders 5 for a=−2..2; χ=κ̄, a=−1 gives 1 | sound; duplicate bullet | R08 |
| §2.9 F₄ locators (F06) | FKP19 lines 2653, 2676 | Prop 7.8 on p.59, Remark 7.9 on p.60 | sound | none |
| §3.4 check (F09) | p=5, 3, 2 | (−1,2)=(4,2); (2,2); 2=0 | sound | none |
| §8.8 after R03 | i(a)=(a,0), q(a,b)=b vs a; C₃² over 𝔽₃ | ranges/kernels L×0=ker q; q∘i=1; (9−1)/(3−1)=4 | true; format | R08 |
| §8.9 locators (F07) | min v(b)=2, min v(c)=1; e′=3 | s∈{−2,…,1}: 4 vertices; −6..3: 10 vertices | sound; uncited overlap | R05 |
| §9.x supplier repoint (F03) | 𝔽₉^× Teichmüller; 4∈ℤ₃^× | order divides 8; infinite order | sound | none |
| §10.3 descent repoint (F03) | ℓ=2,5 with v₀,v₁ over 5,2 | each ℓ has a place of other residue characteristic | sound | none |
| 0.2 oddness (sample) | diag(1,−1); I; Gₘ over imaginary quadratic | fixed dims 1=flag; 3≠1; 0=0 without total reality | sound (FKP19 line 107, p.3) | none |
| 0.6 abelian compositum (sample) | C₂²; S₃ over its quadratic subfield | commutator 1; (12)(123)(12)=(132) | sound (FKP22 line 445, p.10) | none |
| 0.7 cyclotomic layer (sample) | p=3, D=1 | intersection degree 1 or 3, never 9; −1 action ⇒ 1 | sound (FKP22 lines 477–486, 578) | none |
| 1.5 cyclotomic exclusion (sample) | trivial adjoint, κ̄ of order 2, p=3 | constituents 1 vs κ̄: values 1, −1 | sound (FKP22 line 2026, p.45) | none |
| 1.10 separation (sample) | blocks 2,4 | exponents (2,−1): c⁴c⁻⁴=1; (2,+1): c⁸ | sound (FKP22 line 2235, pp.49–50) | none |
| 1.11 zero exponents vs FKP22 Ex. A.17 | GL₂, n=1, χ=κ̄⁻¹ | ±1 tests reduce to κ̄≠1, κ̄³≠1 (pass); quotient χ⁻¹=κ̄ meets M*'s κ̄: C3 fails | README's "full D(n,1,N)" needed | source issue |
| 1.7/9.5 joint condition vs FKP22 Lemma A.9 | κ̄,ψ independent of order p−1; blocks κ̄ψ², κ̄ψ, 1 | pairwise indices p−1, p−1, (p−1)/2; joint 1; ψ⁻¹ in M and M* | README's joint form needed | source issue |
| 2.2 Sha killing (sample) | 1-dim Sha; inflated class | kernel dims 0 vs 1; restriction 0 on Γ_K | sound (FKP19 line 1189 p.27; FKP22 line 477) | none |
| 2.7 marked classes (sample) | two basis indices | values at t₁,t₂: (1,0),(0,1), rank 2; at w diagonal | sound (FKP22 lines 657–665, p.15) | none |
| 3.1 lift mod ϖ² (sample) | ε²=0 vs ε²≠0 | 1+ε(X+Y) vs extra ε²XY; local value 1≠0 | sound (FKP22 line 695, p.16) | none |
| 4.3 balance (sample) | orders 81, 27 | 81/27=3 on both sides | sound (FKP19 line 2028, p.45) | none |
| 4.6 Q_N (sample) | ℤ₃, M=2, N=8; 2I∈GL₂(𝔽₃); Gₘ | v₃(18)=2, v₃(108)=3; rank(2I−I)=2; empty | sound (FKP19 line 2077, p.46) | none |
| 4.8 smooth points (sample) | trivial GL₂ point, r=2 | 9³=729 vs 729·9=6561 | sound (FKP19 Prop 4.7(3), line 1045) | none |
| 6.1 finite set (sample) | n=3, M=2 | buffer at level 5, next retained level 4 | sound (FKP19 line 2386, pp.53–54) | none |
| 9.4 two blocks (sample) | n₁=1, n₂=3 | d=1, exponents (3,−1), c³c⁻³=1; Hom invariants 0,0 | sound (FKP22 line 1753, pp.38–39) | none |
| 9.5 direct sums (sample) | order-10 κ̄,ψ example | separate degrees 10,10,5; joint 1 | sound (FKP22 line 1796; joint form required) | none |
| 10.4 conjectural scope (sample) | GL₂ with finite determinant; Gₘ | derived dim 3 vs total 4; derived 0 vs centre 1 | no theorem stated | R09 |
| 8.3 determinant normalization | unramified ζ≠1 at Art(p) | a global character unramified outside p has value 1 at Art(p) | README's normalization needed | source issue |

## Verified sound

- **Principles.**
  - One `import Mathlib`, no `set_option`, no sorry'd data, no other-roadmap import.
  - No process words (grep for twelve patterns) and no machine paths in the package files.
  - No corruption: a scan for non-ASCII letters inside words found only Teichmüller, Bellaïche and one formula. There is no LaTeX.
  - No copied source passages in the passages I checked.
- **Elaboration.** `lake env lean` on `packages/GlobalGaloisDeformationsPartII/Suggested.lean`, run from the content checkout at the pinned Mathlib 6b7abb3c7686 and Tau Ceti a91d3aafa8cd, finished in 3.3 s with exit 0 and no messages. The file has no declarations, so the binder audit and the one-tactic probes have nothing to test.
- **Headlines.** Every headline is unstatable except as noted in R04. I re-checked against Tau Ceti's reductive and derived group schemes over rings (`TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38`, `…/Derived/Basic.lean`). The missing carriers are the topology on G(O), local deformation spaces and components, p-adic Hodge conditions, and newform and automorphic Galois attachments; none is at the pins.
- **Seeded sample.** All 15 targets read: 0.2, 0.6, 0.7, 1.5, 1.10, 2.2, 2.7, 3.1, 4.3, 4.6, 4.8, 6.1, 9.4, 9.5 and 10.4. Theorem numbers, pages and hypotheses agree; the rows are above.
- **Gaps.** All 27 slugs and needs sentences match `design/plan.json` word for word; every slug used in the README is in the plan and every plan slug is used. Findings are confined to R01–R03 and R06.
- **Dependency check.** Output (verbatim): `depcheck: 49 roadmaps, 574 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. Every cited roadmap is earlier than line 301 of the merge order.
  - Examples: LocallyAnalyticDistributionsPartII is line 300 and PotentialAutomorphyInfrastructurePartII line 89, both board design packages on board main. ReductiveGroupsPartII is line 25, in pull request #785.
  - ModularityAndLanglandsExtensions §2.28 mentions FKP Theorem E in its prose. Its Needs line does not cite this roadmap, and gap:ordinary-residual-potential-automorphy asks only for the seed, so there is no cycle.
- **Citations resolved at their heads.**
  - GlobalGaloisDeformations b0adf32: R04.3 §§3.3–3.8; G7 §§8.1–8.4.
  - ArithmeticGaloisDuality 09ad340: R02.4.2, R02.4.3, R02.4.5, R02.5.1.
  - ReductiveGroupsPartII 1383569: RG2.0.3, RG2.1, RG2.2.
  - ArithmeticGaloisRepresentations bef111d: §§7.4, 7.7.
  - AutomorphicLFunctionsAndLocalFactors 5d22a23: AL.3 "Leveled shtukas and ramified rank induction".
  - AutomorphicSpectralTheory c5cfb92: §7.1.
  - LocalGaloisDeformationRings 11b2c65: §§1.17, 1.20, 1.21, 1.22, 2.5, 2.14, 2.28, 2.30, 3.11, 6.5, 6.17, 8.5, 8.10.
  - GL2ModularityLifting 1e734ab: §10.15, still conditional on CC1–CC5 and LC, so that gap is needed.
  - OrdinaryAutomorphicFormsAndModularityLifting faca0d2: §§5.2, 5.3.
  - ModularityAndLanglandsExtensions 2d70821: §§2.28, 2.48.
  - FunctionFieldArithmetic f7a17ee: §5.8.
  - AutomorphicGaloisRepresentations 81e9d0f: Layers 1 and 5.
  - AutomorphicGaloisRepresentationsPartII fb0a94c: AG2.5–AG2.6.
  - AutomorphicFormsOnReductiveGroups c00e220: Layer 1, with no Whitehead content, so that gap is needed.
  - PotentialAutomorphyInfrastructurePartII (board design): PL.7 "The ANT lifting theorem with source primitivity".
  - LocallyAnalyticDistributionsPartII (board design): ND.0.
  - IntegralHeckeAndGaloisDeterminants 1383569: §1.4.
  - Main 4aeb1cc: AffineLieAlgebras §A1; ReductiveGroups Layers 7 and 7b.
- **Library declarations opened at the pins.**
  - `CompositionSeries.jordan_holder` (`Mathlib/Order/JordanHolder.lean:454`)
  - `CategoryTheory.ShortComplex.ShortExact` (`Mathlib/Algebra/Homology/ShortComplex/ShortExact.lean:34`)
  - `TopRep` (`Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`)
  - `IsAbelianGalois` (`Mathlib/FieldTheory/Galois/Abelian.lean:25`)
  - `groupCohomology.H1` (`…/GroupCohomology/LowDegree.lean:965`)
  - `continuousCohomology` (`…/ContCohomology/Basic.lean:131`)
  - `ContinuousCohomology.tateShafarevich` (`…/ContCohomology/Sha.lean`)
  - `ValuationSubring.decompositionSubgroup` (`Mathlib/RingTheory/Valuation/RamificationGroup.lean:29`)
  - `TauCeti.ContCohomology.H1` (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:712`)
  - `TauCeti.ContCohomology.explicitInfRes_exact` (`…/Inflation/Basic.lean:350`)
  - `TauCeti.reductiveCommHopfAlgPropertyOver` (`TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38`)
- **Ownership and duplication.** Checked by object, using `roadmaps grep` over main and all 353 open roadmap pull requests at their heads, and grep over the board packages. Patterns searched:
  - FKP, Fakhruddin, doubling, relative Selmer, Hamblen–Ramakrishna;
  - Ribet's lemma, stable lattices, Bellaïche–Chenevier;
  - Larsen–Pink, Guralnick, Whitehead;
  - torus and semisimple centralizers.

  Overlaps: R02, R05, R06. No other roadmap owns the doubling, relative-Selmer or finite-ramification machinery.
- **Counts.**
  - 11 previous findings checked;
  - 15 seeded targets read;
  - 27 gaps compared;
  - 19 supplier roadmaps resolved at their heads, listed above. For NoncommutativeAndEquivariantIwasawa, ArithmeticLocallySymmetricSpaces, ProfiniteCohomology, ProfiniteProPGroups, Chebotarev, ClassFieldTheory, ModularForms, AlgebraicModularFormsAndSerreWeights and ClassicalSerreModularity, whose citations the repair did not change, I rely on the resolver ("found nowhere: none") and on the first round's check at the same heads;
  - 11 pinned declarations opened;
  - 45 adversarial rows.

## Not verifiable

- **BC14** (Lemma 10, Proposition 11, Definitions 29–30, Proposition 32), **Gur99** (Theorem A) and **NSW08** (Theorems 8.6.7, 8.6.10, 8.7.9) are settled as uncertified (paywalled) and were not read. §8.9 rests on Ribet10 and FKP22, and the splitting gap on the argument above.
- **Not re-read this round.** Lazard65, BLGHT11, BLGGT14 Proposition 3.1.1 and Theorems 3.1.2 and 5.5.1, and ANT20 Theorem 1.1 lie outside the sample in text the repair did not touch.
- **The §3.2 replacement.** Whether it can be proved at all is a research question that a review cannot settle; R01 records that no proof is given.

## Source issues

- **Error** in FKP22 at Lemma 3.7, pp.15–16 (and the parallel separation step in the proof of Proposition 3.8, p.18): the source treats a generator of each factor as a generator of the product, so it concludes that all the fields are strongly disjoint. It should assume that the inertia tuple generates the product, which fails for repeated constituents. Affects the proof.
- **Error** in FKP22 at Lemma A.9(3), p.46 (used in Corollary 8.4, p.39): the source bounds each cyclotomic intersection pairwise. It should bound the intersection with the compositum of all the χ_ij fields; κ̄, ψ independent and blocks κ̄ψ², κ̄ψ, 1 give a counterexample to C3. Affects a stated result.
- **Error** in FKP22 at Example A.17, p.50: the displayed sufficient condition compares only exponents ±1. It should include the zero-exponent comparisons forced by the Levi part, as in Definition A.13; GL₂ with χ=κ̄⁻¹ fails C3. Affects a stated result.
- **Gap** in FKP22 at the proof of Corollary 8.3, p.39: the source infers non-injectivity of the Levi projection from non-splitness without argument. It should invoke complete reducibility of small-dimensional representations without normal p-subgroups, for p large. Affects the proof.
- **Gap** in FKP22 at the proof of Theorem 7.4, p.36: the source inflates the local correction character to Γ_ℚ by Kronecker–Weber. It should first make its value at Art(p) equal to 1 by an unramified twist, since otherwise no extension unramified outside p exists. Affects the proof.
- **Misprint** in FKP19 at the proof of Claim 6.14, p.54: the modifying class is written with dual adjoint coefficients. It should be a primal level-M adjoint class, as the fibre-stability step requires. Affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d33be20", "job": "REV-PKG-GlobalGaloisDeformationsPartII~2", "model": "opus", "worker": "fable-rev100"} -->
