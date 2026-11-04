<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1232#issuecomment-6389711831 -->
Review (claude) of 99fbf6f

Verdict: needs changes

1. **F01** (P2) `Suggested.lean` computes the determinant of a free-standing matrix

   Location: `packages/FunctionFieldArithmeticPartII/Suggested.lean` lines 104–116, docstring: "The matrix of the root-chart comparison in the source monomial and target character bases"; theorem `rootChartComparisonMatrix_det`.

   Claim: the file presents this as the determinant of the root-chart comparison.

   Witness: `rootChartComparisonMatrix` is a `def` whose body never mentions `rootChartComparison`, and no declaration links the two. The theorem is a closed-form determinant of an explicit monomial matrix, which README §1.124 already lists with its own Checks.

   Repair: delete `rootChartComparisonMatrix` and `rootChartComparisonMatrix_det` from `Suggested.lean`. No other declaration uses them. Keep §1.124 in the README and drop its sentence "The headline signature uses …". The README statement remains true: I recomputed the determinant for n=1…5 at f=3 and got 1, −3, 27, 729 and 59049, matching (−1)^((n−1)E) f^E.

2. **F02** (P2) `exteriorPower_koszul_invariants` restates Tau Ceti and is not a headline

   Location: `Suggested.lean` lines 120–131, and docstring line 22: "Its linear Koszul-invariant input is stated below."

   Claim: a Layer 7 headline.

   Witness: the first conjunct is exactly Tau Ceti `exteriorPower.toTensorPower_injective (h : IsUnit (n.factorial : R))` (TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:204). The second follows from `exteriorPower.range_toTensorPower` (:242), because d!·t = Σ sgn(σ)σt. V is an arbitrary module, and no object of this roadmap occurs in the statement.

   Repair: delete the theorem and docstring line 22. README §7.9 should cite both Tau Ceti lemmas by name and keep only the invariant-image consequence as a target. Test: for d=2 and V=K², the invariants are span(e₁⊗e₂−e₂⊗e₁), which is the image of α₂.

3. **F03** (P2) Layer 2 builds a second finite root stack beside SchemeAndStackFoundations §1.21

   Location: README line 4370: "extend the supplied scheme-base finite root stack by defining √[n]{(L,s)/X} on T→X as the groupoid of root objects"; line 4524: "compare the native root stack R_n(X;L,s) with the already owned upstream rootStack".

   Claim: Scope and ownership (line 9) says finite root stacks, affine charts and nonreduced branch fibres are imported.

   Witness: on main, TauCetiRoadmap/SchemeAndStackFoundations/README.md lines 2972–2988 define `rootStack n (L,s)` with `.baseChange`, `.one`, `.affineChart` and `.isDeligneMumford_of_invertible`, and `test_fibre_nonreduced`, `test_char_p` among its Checks. §§2.1, 2.9, 2.11, 2.12, 2.15 and 2.18 re-derive these.

   AlgebraicModuliForArithmeticGeometry (#853), line 2096, assigns root stacks with a section to "FunctionFieldArithmeticPartII:key/root-stacks". That makes three claimed owners.

   Repair:
   - Make §1.21's `rootStack` the only carrier. Delete §2.7 and the second definition in §2.1.
   - Restate §§2.9–2.18 as properties of `rootStack`, keeping only what §1.21 lacks: algebraic-stack base, §2.13 (wild smooth atlas), §2.17 (regularity), §2.18 (exact DM locus) and §2.16 (coarse space, through gap:finite-diagonalizable-coarse).
   - The maintainer should repoint AMAG's line 2096 to SchemeAndStackFoundations §1.21.

   Test: for n=1, and for (O,0) over a field, `.one` and `test_fibre_nonreduced` give §2.1's Checks 1 and 3 without a second carrier.

4. **F04** (P2) two owners for ℓ-adic sheaves on Deligne–Mumford stacks

   Location: README line 13221: "Develop the lisse adic category on normal Deligne–Mumford stacks … Construct proper pushforward for the ordered root-divisor map, rational coarse pushforward, nilpotent invariance and Leray".

   Witness: board package GlobalShtukasAndFunctionFieldLanglands (#146, head e5b7994), §GS.1.4, owns the constructible derived category on the lisse-étale site of finite-type algebraic stacks over finite fields: pullback and pushforward, base change, and the comparison with the étale site on DM stacks. It sits at #171 in the merge order; this roadmap is placed at #169.

   Repair: keep one owner. This roadmap comes earlier, so it should state here, as numbered targets, only what Layers 7–8 use:
   - lisse rank-one sheaves by atlas descent;
   - degree-zero proper base change for tame DM maps (ACV01 Theorem A.0.8);
   - coarse pushforward with finite stabilizers.

   Scope and ownership should then say that GlobalShtukas §GS.1.4 imports these. The maintainer coordinates the change in GlobalShtukas.

5. **F05** (P2) gerbe-limit inputs are owned by AlgebraicModuliForArithmeticGeometry, which is never cited

   Location: README line 5975: "Apply the imported affine fpqc limit-gerbe theorem."; lines 5976 and 11854: "Use/Apply the imported neutralization equivalence"; line 5166: "Apply the imported limit-stack-descent theorem". The *Needs:* line of §3.62 lists only SchemeAndStackFoundations §§1.18–1.23 (six times) and §3.36.

   Witness: SchemeAndStackFoundations README (main) line 2067 says "banded gerbes and their H² classification are AlgebraicModuliForArithmeticGeometry". AMAG (#853, merge order 37) has:
   - §4.3: a neutralization gives F≃BA;
   - §4.4: `GerbeLimitFamily`;
   - §4.23: a limit of finite-stage gerbes is an affine fpqc gerbe.

   Repair:
   - Add a "From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry" contract (§§4.3, 4.4, 4.23 and `rootGerbe`) and cite it at §§3.15, 3.62, 3.409, 3.413, 3.418 and 3.427–3.428.
   - Add §3.13 to §3.62's *Needs:*; §3.62 is §3.13(f),(g) at T = Spec k.
   - In §3.13, say in one clause how it differs from AMAG §4.23: arbitrary base T and explicit torsor towers.

   Test on ℝ: AMAG §4.3 with the trivial system gives the two Kummer families of §3.14's Check.

6. **F06** (P2) supplier tags and ownership placeholders that resolve nowhere

   Location: line 13292: "local systems on 𝒳 are continuous representations of it (gap the corresponding supplier or local construction)"; line 13295: "(IG.1/tame-and-prime-to-p, IG.1/decomposition-inertia)"; line 11390: "The TOWER-AFF contract".

   Witness: the README has 13 placeholders reading "the corresponding supplier or local construction" and 92 explorer tags (IG.*, EDC.2/…, ST-LISSE, ST-OPS, TOWER-AFF, NORM-2EXACT, FA-APPROX, ROOT-COARSE, GC1-*, GC.0–GC.5, SF.1/…, SF.3/…, AC.12, JAC-A, RS.*). `roadmaps grep` finds none of them on main or at any open head, and none is a declared gap.

   Repair: replace each placeholder or tag by its owner, or declare a gap in plan.json and the README. Owners:
   - Layer 7 "Stack coefficient interfaces": lines 13292, 13546, 13561, 13599, 13677 and §8.11;
   - §3.13: TOWER-AFF;
   - EtaleCohomologyFoundations §0.11: EDC.2 curve duality;
   - EtaleCohomologyFoundations §F.3a: IG.1;
   - EtaleCohomologyFoundations §F.0.2: IG.5;
   - SchemeAndStackFoundations §1.18 `limit`: "limit-stack-descent".

   Test at §7.3: after these replacements every input has an owner.

7. **F07** (P2) declarations called "existing" or "native" that do not exist at the pins

   Location: line 9073: "The local bialgebra is the existing factorialBialgebra A; its Hopf structure is the existing factorialHopfAlgebra A."; line 12333: "This is the native RootPicardSectionData i_S", and on the same line "imported native tensorSection operation"; line 12244: "RootPicardData i_S".

   Witness: the pinned Mathlib and Tau Ceti contain none of `factorialBialgebra`, `factorialHopfAlgebra`, `factorialRootScalars`, `FactorialAffineColimit`, `RootDivIndex`, `RootPicardData`, `RootPicardSectionData`, `tensorSection`, `normalizationPastingIso` or `FramedNativeRoot`. The word "existing" occurs 740 times and "native" 1,915 times.

   Repair: name the owning target instead. Examples: "the bialgebra of §3.233", "the groupoid of §4.8", "AlgebraicVectorBundles L0A's tensor of sections (gap:invertible-section-coordinates)". Use "existing" only for declarations present at the pins, in backticks.

8. **F08** (P2) §10.30 asserts no proposition

   Location: line 14982, §10.30: "Any Picard-stack exactness statement must specify the connecting maps, coherent norm trivializations and effectiveness obstructions"; line 14990: "this remaining source gap is NORM-2EXACT, and is not treated as a proved theorem."

   Witness: §10.30 states no theorem. §§10.26–10.29 already state the two fibre sequences, their connecting maps and the obstructions, and §10.31 refutes the naive reading of YZ19 (A.11).

   Repair: delete §10.30, moving its Check to §10.29 or §10.31, or replace it by the exact statement assembled from §§10.26–10.29. Test on ν: ℙ¹→ℙ¹, t↦t²: §10.29 already gives q_*[O(1)] ≠ 0 while j_*q_*[O(1)] = 0.

9. **F09** (P2) two declared gaps are compound or not minimal

   Location: line 53: "(gap:coherent-site-universe-lifts): Provide coherent universe enlargement of the scheme site, native invertible sheaves, sections, tensor products and pullback"; line 67: "(gap:completed-lattice-root-dictionary): Compare completed local lattices and their residue root frames with rationally framed line bundles".

   Witness:
   - The first gap bundles five objects and asks SchemeAndStackFoundations §1.18 (stacks and stackification) for sheaf-of-modules data, which belongs to AlgebraicVectorBundles L0A–L0B and Tau Ceti `InvertibleSheaf`.
   - The second asks AlgebraicCurves for residue root frames, which §6.5 of this roadmap already constructs.

   Repair:
   - Split coherent-site-universe-lifts into (a) universe enlargement of the scheme site (SchemeAndStackFoundations §1.18) and (b) its compatibility with invertible sheaves, sections, tensor product and pullback (AlgebraicVectorBundles L0A–L0B).
   - Restrict completed-lattice-root-dictionary to: completed local lattices ↔ rationally framed line bundles, with weighted degree and the sign π_x⁻¹ ↦ O_X(x). Keep the root frames local in §6.5.

   Test on O_X(x): lattice π_x⁻¹O_x, coefficient π_x⁻¹, degree [κ_x:k]; no root data is needed.

10. **F10** (P3) size, internal duplication and a recommended split (for the maintainer)

   Location: the whole README.

   Measured:
   - 15,083 lines; 1,657,838 bytes; 220,429 words.
   - 852 level-3 headings: 824 targets (including two layer preambles), 8 supplier subsections, 10 Examples and 10 Dependencies.
   - Layers 1–3: 688 targets on 12,072 lines (Layer 1: 242 on 4,278; Layer 3: 428 on 7,401). Layers 4–10: 136 targets on 2,853 lines.
   - 2,063 duplicated non-blank lines: standing-hypothesis paragraphs repeated up to 49 times, and 46 Check bullets repeated in two to five sections.
   - Targets that restate other targets: §§1.9–1.12 restate §1.2's API bullets, §1.16 restates §1.4's and §§1.21–1.22 restate §1.5's; §§1.218, 1.228 and 1.237 are one fact; §3.62 is §3.13 over a field. Some section titles are Lean names ("3.261 Tmul").

   Recommendation: split at the Layer 3/4 boundary.
   - **Part A, Layers 1–3** (infinite root stacks, fpqc Kummer towers, DVR gerbes). This is the direction of stack foundations, not of FunctionFieldArithmetic; a natural home is a SchemeAndStackFoundations Part II (board package #420, which I could not read). Compress it by folding API-level subsections back into their parent targets.
   - **Part B, Layers 4–10** (the quadratic geometric class field theory of YZ19 Appendix A). It keeps this roadmap's name. It uses only §§2.1, 2.3, 2.8 and 2.10 from Part A (eight citations), which SchemeAndStackFoundations §1.21 plus gap:finite-diagonalizable-coarse can supply.

11. **F11** (P3) blanket and non-supporting locators

   Location: "TV17 line 630" occurs 309 times with "§3.1 pp. 14–16"; "YZ19 line 6912" occurs 135 times; 446 citations end in "coordinate deduction" and 18 in "literature context only".

   Witness:
   - TV17 line 630 is printed p. 13, the sentence before Proposition 3.4; §3.1 starts at line 668.
   - YZ19 line 6912 is the start of Appendix A (p. 514); Lemma A.5 is at line 7248 (p. 518).
   - §1.41 cites the Stacks literature-guide entry 04V8 for an algebra identity.

   Repair: point each citation at the line of the cited item:
   - TV17: Proposition 3.4 at line 631, §3.1 at line 668, Proposition 3.10 at line 738, Corollary 3.13 at line 778.
   - YZ19: Lemma A.5 at line 7248, A.3.3 at line 7850.

   For elementary deductions, cite a standard statement (for example STACKS-KUMMER line 1442 for finite free root charts).

   In sources.toml, `cited_for` uses explorer node ids ("RS.0", "GC.3", "key") rather than README sections. MILNE-CFT and MILNE-LEC have `licence_class` "open-repository" although they are author pages. Keys containing "-codex-…" are process ids, but keys are permanent, so this is noted only.

12. **F12** (P3) process narrative and invented vocabulary

   Witness:
   - Counts: "actual" 2,742; "native" 1,915; "existing" 740; "inherited" 564; "underlying" 265, used for the explorer ("the underlying’s divisor/idele dictionary"); "codex" 208; "promoted" 6.
   - Single occurrences: "the omission ledger" (line 11400), "source gate G4" (line 12713), "as recorded in ." (line 13057), "this node", "native native".
   - Subsections repeat their opening paragraph at the end with "; Retain …" (§§1.4, 1.15, 1.20, 1.41).
   - `Suggested.lean` docstring: "native root-chart … carriers" and "native finite-root stack".

   Repair: delete process words and the repeated paragraphs, and replace "underlying" by the cited target.

13. **F13** (P3) house style and name spelling

   Witness:
   - ASCII mathematics in Layers 5 and 8–10, on 106 lines ("alpha", "epsilon", "Qbar_ell", "mu_2", "rho"), with capitalised emphasis such as "OPEN SCHEMES" and "NOT".
   - Library names written as words: line 45 "from Tensor Power …"; line 47 "reindex Repr" (the actual name is `PiTensorProduct.reindexRepresentation`, TauCeti/RepresentationTheory/Symmetric/TensorAction/Basic.lean:48); "nat Card nsmul eq zero"; *Needs:* entries "eq Locus", "pow Monoid Hom", "Dual Number".
   - Line 5706 cites `AddCircle.exists_mem_torsionBy_rat` and `AddCircle.exists_zsmul_eq_of_mem_torsionBy` as if from Mathlib. They are Tau Ceti declarations (TauCeti/Algebra/AddCircle.lean:438, :173), and that module is missing from the Tau Ceti contract.
   - Duplicate *Needs:* entries.

   Repair: Unicode mathematics, exact names in backticks, and add TauCeti/Algebra/AddCircle.lean to "From Tau Ceti".

14. **F14** (P3) supplier sections that drift (the owners exist)

   Witness:
   - Line 77, "§§0.9 and F.6's curve and smooth-scheme duality": EtaleCohomologyFoundations §0.9 is cycle classes (its README line 1120); curve duality is §0.11 (line 1157).
   - Line 49, "§§2.10–2.11's torsors, H¹": torsors and H¹ are SchemeAndStackFoundations §§1.15 and 2.3.
   - Line 71, "§§4.1–4.5's local Artin and norm-quotient comparisons": FunctionFieldArithmetic §§4.3–4.4 are about Schmid–Witt symbols and conductors.
   - Line 15024 says GlobalShtukasAndFunctionFieldLanglands consumes this roadmap, but its README at e5b7994 never cites it.

   Repair: repoint to §0.11, §§1.15/2.3, and FunctionFieldArithmetic §§0.1, 4.1–4.2, 4.5. Keep the consumer sentence only once GlobalShtukas cites this roadmap.

15. **F15** (P3) the README and `Suggested.lean` use different carriers for H

   Location: README line 242: "H=A[Multiplicative(ZMod n)], using the native Hopf group algebra"; `Suggested.lean` line 46: `rootChart A f n →ₐ[A] (rootChart A 1 n) ⊗[A] (rootChart A f n)`.

   Witness: the Lean H is A[X]/(Xⁿ−1). The second Check of §1.7 evaluates through `TauCeti.RootsOfUnityGroup.pointsMulEquiv`, which is defined on the group algebra (TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Basic.lean:124), not on `rootChart A 1 n`.

   Repair: use `MonoidAlgebra A (Multiplicative (ZMod n))` as the coaction target in `Suggested.lean`, or say in §1.7 that the Lean signature models H as A[X]/(Xⁿ−1). Test at n=2: e₁² = 1 holds in both carriers.

16. **F16** (P3) the kernel and cokernel theorems are refinements, not headlines

   Location: `Suggested.lean` lines 87–102.

   Witness: both are true. In seven instances, (n, |A|, f) ∈ {(2,4,2), (2,8,4), (3,4,2), (2,4,0), (3,2,0), (2,5,3), (2,9,3)}, the brute-force sizes match |Ann f|^E and |A/(f)|^E: kernel 2, 4, 8, 4, 8, 1, 3 and cokernel the same. But they measure the defect of the Layer 1 comparison; the roadmap's headlines are YZ19 Lemma A.4–Proposition A.12 and TV17 Proposition 3.10.

   Repair (maintainer's choice, not blocking): keep the injectivity and surjectivity criteria as the Layer 1 statement and move the kernel and cokernel to README §§1.196–1.197.

17. **F17** (P3) gap:quadratic-root-residue-character asks for a normalization FunctionFieldArithmetic already fixes

   Location: line 73: "identifying … the inverse-uniformizer value away from ramification with geometric Frobenius".

   Witness: FunctionFieldArithmetic §0.1 (at its pull-request head) fixes arithmetic reciprocity, uniformizer ↦ arithmetic Frobenius. So an inverse uniformizer already corresponds to geometric Frobenius.

   Repair: reduce `needs` to: the unit character of a ramified quadratic extension (tame, odd characteristic) is the residue quadratic character. Cite FunctionFieldArithmetic §0.1 for the Frobenius normalization.

18. **F18** (P3) a construction without Checks

   Location: §3.61 (line 5946), "The transition as an iterated monic quotient": it has an API and no Checks.

   Repair: add three Checks. For example: over 𝔽₂ with f=0 and n=m=2, U↦t₄ and U²↦t₂ is a nonzero nilpotent; m=1 gives the identity; the zero ring.

Eighteen findings, nine blocking (P2). No P1: no false statement, false Check or vacuous theorem was found. The Lean file elaborates, and all ten of its declarations are mathematically true. The blocking findings concern padding in `Suggested.lean`, ownership (SchemeAndStackFoundations §1.21, AlgebraicModuliForArithmeticGeometry Layer 4, GlobalShtukasAndFunctionFieldLanglands §GS.1.4), unresolvable supplier tags, false claims that declarations are "existing/native", one non-statement target, and two compound gaps. Padding is graded P2 because the maintainer's instructions make padding blocking; the brief's default would be P3. Size is reported for the maintainer in R10 and is not a reason for the verdict.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean` took about 11 s: no errors, and six "declaration uses sorry" warnings, one per theorem.
- `#check @` of all ten declarations in a scratch copy: the types are as in the README, apart from the carrier of H (R15). Every binder is explicit, so no section variable is lost.
- One-tactic probe: `simp` makes no progress on any of the six theorems. `exact?` with Mathlib alone fails on the Koszul injectivity conjunct, which Tau Ceti `exteriorPower.toTensorPower_injective` closes (R02).
- Form: one import line (`import Mathlib`), no `set_option`, no `lemma`, no sorry'd data, a docstring on every declaration, and the eleven non-statable headlines named in the module docstring. I agree with each "not statable" claim: algebraic stacks, the root Picard stack and stack lisse sheaves are absent at the pins.

**The ten Lean statements are true.**
- The injectivity criterion n=1 ∨ (f·) injective, and the surjectivity criterion n=1 ∨ f a unit, hold on the seven brute-force instances and on the zero ring.
- The kernel and cokernel statements hold with index sets W={(i,j): n≤i+j} and L={(i,k): k<i}, each of size n(n−1)/2.
- The determinant formula holds for n=1…5.

**Library names.** I `#check`ed 320 backticked Mathlib-style names at the pinned Mathlib: 318 exist, and the other two are Tau Ceti declarations (R13). All 16 backticked Tau Ceti names exist; those I relied on, with their locations:
- Tau Ceti exterior powers and representations: `exteriorPower.toTensorPower_injective` (TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:204), `range_toTensorPower` (:242), `fromTensorPower_comp_toTensorPower` (:186), `PiTensorProduct.reindexRepresentation` (…/TensorAction/Basic.lean:48), `groupCohomology.natCard_nsmul_eq_zero` (…/Corestriction.lean:438).
- Tau Ceti algebraic geometry and roots of unity: `TauCeti.AlgebraicGeometry.InvertibleSheaf` (LineBundle/Basic.lean:112), `tensorTrivialRightIso` (LineBundle/TensorProduct.lean:230), `RootsOfUnityGroup.pointsMulEquiv` (RootsOfUnity/Basic.lean:124), `Divisor.exists_le_degree_add_nsmul_ofPoint` (FunctionField/Divisor/Basic.lean:254).
- Mathlib: `exteriorPower.toTensorPower` (Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:29), `Finset.card_product_filter_lt` (Mathlib/Data/Finset/Prod.lean:367), `Nat.choose_two_right` (Mathlib/Data/Nat/Choose/Basic.lean:110), `MonoidAlgebra.single_pow` (Mathlib/Algebra/MonoidAlgebra/Defs.lean:720), `AdjoinRoot.eval₂_root` (:255), `AdjoinRoot.liftAlgHom` (:317), `AdjoinRoot.powerBasis'` (:737).

**Supplier citations resolved.**
- SchemeAndStackFoundations (main): §0.9 (line 848), §1.1 (2071), §1.15 (2502), §1.18 (2745), §1.21 (2951), §1.23 (3021), §§2.10–2.11 (3631, 3656), §§3.3–3.7 (4713–4937), §4.13 (5643).
- AlgebraicVectorBundles (main): L0A–L0C (lines 215, 228, 254).
- AlgebraicCurves (main): Layer 12 (line 1085).
- JacobianChallenge (main): Layers A–D.
- EtaleCohomologyFoundations (main): §§F.0.2, F.0.A1, F.0.A2, F.3a, F.2.1, F.2.6, F.2.7, F.4.1–F.4.6, F.6, F.8; the §0.9 citation is wrong (R14).
- ProfiniteCohomology (main): Layer 10 (line 1549).
- RepresentationTheory/SchurWeyl (main): Layer 8.
- FunctionFieldArithmetic (#1474 head): §0.1, §2.1, §§4.1–4.10. Its §4.8 sends b↦O(D(b)), and the README's comparison a↦b=a⁻¹ checks: a=2 over 𝔽₅ gives b=3, with inverse rigidification 2, matching FunctionFieldArithmetic §4.8's Check (λ=2 gives 3).

**Gaps.** All five declared gaps have the same slug in plan.json and in the README, in the form "What X must provide (gap:slug)". gap:finite-diagonalizable-coarse is precise, and its claim holds (degree-zero invariants commute with any base change for diagonalizable groups). gap:invertible-section-coordinates is acceptable. For the other three, see R09 and R17.

**Supplier order.** The gate output, verbatim:
`moved: FunctionFieldArithmeticPartII moved in the merge order from #16 to #169, right after its last supplier FunctionFieldArithmetic (EtaleCohomologyFoundations also came after it); checked as moved (the worker moves it there when it submits)` / `depcheck: 34 roadmaps, 311 edges, 0 problem(s)`.
There is no UPWARD and no CYCLE line. AlgebraicModuliForArithmeticGeometry (order 37), which R05 adds as a supplier, sits before #169.

**Duplication audit.** I searched by object with `roadmaps grep` (root stack, infinite root stack, root Picard, lisse sheaves on DM stacks, tame symbol, gerbes), read GlobalShtukasAndFunctionFieldLanglands at e5b7994, and read AMAG at #853. The overlaps are R03, R04 and R05; I found no other duplication. The root Picard stack, the root symmetric powers, the signed adelic groupoid and the character sheaf (Layers 4–10) are owned here: no other roadmap states them.

**Sampled locators.** I checked all 15 sampled targets against the cached texts.

| Target | Locator, as read | Supports the statement as written? |
|---|---|---|
| 1.12 | TV17 line 630 (p. 13; §3.1 begins at line 668, p. 14); STACKS-KUMMER line 1442, Lemma 59.28.3 (040N) | No: both are context only. The Fin-arithmetic equivalence is true (checked at n=2: (1,1)↦(1,0)). Line pointer wrong. |
| 1.41 | FramedNormalizationArrows line 664: literature-guide entry 5.13 (04V8) | No, as the README itself says ("literature context only"). The statement holds: (ζ⁻¹T_p)ⁿ=ζ⁻ⁿu_p=u_q. |
| 1.65 | FramedFppfCover line 837: Definition 7.1 (021M) | Yes for the fppf-cover notion. Flatness of B[T]/(Tⁿ−u), which is free of rank n≥1, is elementary. |
| 1.211 | NormalizationThree line 1383: §17, Definition 17.1, Lemma 17.2 (01JO, 01JP, 01JQ) | Context only (fibre products). Pasting is categorical; the ℤ/4→ℤ/2 Check holds. |
| 1.213 | AGV08 line 2404 (B.1–B.2, pp. 52–54; base change on line 2417); TV17 Proposition 3.4 | Yes. Coordinates ψ(u), ψ(y); the ℤ/4→ℤ/2 Check holds. |
| 3.9 | TV17 line 702 (p. 15): grading by (1/n)P^gp/P^gp | Yes, with P=ℕ, (1/n)ℤ/ℤ⊂ℚ/ℤ. Checks c₆[3]=[1/2], c₃(7)=[1/3] recomputed. |
| 3.20 | TV17 Remark 3.6 (line 663, p. 14): cofinal systems | Yes for the use of factorial indices; n∣(n+1)! is trivial. |
| 3.76 | AffineRootPointGroupoid line 966: §10, Definitions 10.1–10.2, Lemma 10.3 (022Y, 022Z, 07S2) | Context only; the statement is associativity of composition. |
| 3.98 | TV17 §3.1 | Context. B_{nm}=B_n[U]/(U^m−t_n) is free of rank m (checked). |
| 3.142 | Stacks-finite-root-projections line 46: Lemma 2.1 (01YW) | Context. Naturality is a deduction. |
| 3.239 | TV17 lines 702 and 630 | Context. The antipode giving inverse points is a standard Hopf fact. |
| 3.299 | TV17 line 630, "coordinate deduction" | No source support; naturality holds. |
| 3.374 | TV17 line 702 | Context. Recomputed: the projection to χ_{d_i}(k) keeps c_k t^k. |
| 3.383 | TV17 Definition 3.8 (line 714), Proposition 3.10 (line 738), Corollary 3.13 (line 778), pp. 15–16 | Yes, for P=ℕ, the chart A[x]/(xⁿ−f); the cited line 630 is wrong. |
| 6.2 | YZ19 Lemma A.5 proof (line 7255, p. 518); §6.2.3 (line 5736, p. 498) | Yes. G_R is the partially framed version of the proof's groupoid; the 𝔽₅ Check holds. |

No locator was flagged unverified by the author. B24 is settled as uncertified and was not used in the sample.

**Checks.** I scanned all 709 Check bullets and recomputed about 120 numeric values in every layer; none is false. 174 of 175 constructions have at least three Checks (R18). There are no LaTeX delimiters.

**Adversarial pass.** Each row gives the instances and the values computed.

| # | Statement | Instances and computed values | Result |
|---|---|---|---|
| 1 | Lean `…Matrix_det` | n=1…5, f=3: det 1, −3, 27, 729, 59049; formula gives the same | true; R01 |
| 2 | Lean `_injective_iff` | (2,ℤ/4,2): kernel of size 2, 2 a zero-divisor ⇒ both false. (2,ℤ/5,3): kernel trivial, 3 regular. n=1: iso. Zero ring: both true | true |
| 3 | Lean `_surjective_iff` | (2,ℤ/9,3): cokernel of size 3, 3 not a unit. (2,ℤ/5,3): cokernel 1, 3 a unit | true |
| 4 | Lean `_kernel` / `_cokernel` | seven instances: kernel and cokernel sizes = \|Ann f\|^E and \|A/(f)\|^E (2,4,8,4,8,1,3) | true; R16 |
| 5 | Lean `rootChartCoaction` | t↦h⊗t; elaborates. At n=0, rootChart A f 0=A[X]/(1−f): the theorems require 0<n | ok |
| 6 | Lean Koszul | d=2, V=K²: invariants = span(e₁⊗e₂−e₂⊗e₁), dim 1 = C(2,2). V=K: 0. ℤ/2 excluded by hd | true; R02 |
| 7 | Convention n=2, β′=−β | (−β)(t)=−β(t); zero-section automorphism labelled −1 | ✓ |
| 8 | Bound B=ρ+max(2g−1,1) | g=0, ρ=1, d=2: B=2, n=3, a=2, weights (2,2,1). g=1, ρ=1, d=2: (a,n,ρ)=(1,2,1) | ✓ |
| 9 | Sign π_x⁻¹↦O(x) | O(x): lattice π⁻¹O_x, a_x=τ_η∘τ_x⁻¹=π⁻¹, E=−x, deg=[k(x):k] | ✓ (YZ19's printed ratio gives π: Source issues) |
| 10 | Norm sign | det[[c,ad],[d,c]] = c²−ad²; c=0, d=1 gives −a; at a=0 it is c² | ✓ |
| 11 | §1.1 | 𝔽_p[ε]/ε²: (1+ε)^p=1+pε=1 | ✓ |
| 12 | §1.2 | n=3: σ⁻¹(2,0)=(2,1); truncated subtraction gives (2,0) | ✓ |
| 13 | §§1.4/1.15 | ℤ/4, f=3: (−1)·1²=3; unit squares {1}; z²=3 has no solution. ℤ/9: 3w=0 has no unit solution | ✓ |
| 14 | §1.20 | ℤ/7: (1,1)→(2,2) with label 2: 2·4=8=1; ζ⁻¹=4; (4T)²=16=2 | ✓ |
| 15 | §1.26 | ℤ/8, f=4, n=2: cokernel ℤ/4, z=1: 2z≠0, 4z=0. ℤ/4, f=2: Θ(2x⊗x)=4e₁⊗1=0 | ✓ |
| 16 | §1.124 | n=3: +f³, whereas (−1)^E f³=−f³. ℤ/2, f=1: det −1=1 | ✓ |
| 17 | §1.206 | 𝔽₅, v=2: E⁻¹(e₁⊗1)=x⊗3x, since Θ=e₁⊗3x²=e₁⊗1 | ✓ |
| 18 | §1.237 | f=0: ranks 3/1 (n=2), 10/6 (n=4); brute force (3,𝔽₂,0): kernel 2³ | ✓ |
| 19 | §2.13 | ℂ, f=1, n=2: V≅𝔾_m connected, W = 2 points | ✓ |
| 20 | §2.17 | D=(x²), n=2: z²=x² is a node. 𝔽_p, x, n=p: atlas 𝔽_p[z,q^±1] regular | ✓ |
| 21 | §2.18 | ℤ, s=2, n=3: 3=1 in 𝔽₂ ⇒ DM. s=p=n: not DM above p | ✓ |
| 22 | §3.6 | (−1 at index 1): (−1)²=1; 6→2 cube 1≠−1 | ✓ |
| 23 | §3.13 | μ_m→μ_n: ℤ[x]/(x^m−1) free of rank m/n over ℤ[y]/(yⁿ−1); kernel μ_{m/n} | ✓ |
| 24 | §3.14 | ℝ: K_n = ±1 (n even) or 1 (n odd), identity transitions ⇒ 2 families; lim¹ of finite μ_n(ℝ) = 0 | ✓ |
| 25 | §3.30 | ℤ/4: 3²=1, 3·2=2 | ✓ |
| 26 | §3.330 | d₂=6: u₂² has character [2/6]=[1/3]; u₂⁶=f invariant | ✓ |
| 27 | §3.404 | ℤ₃, π′=−3: −1 not a square mod 3 | ✓ |
| 28 | §4.4 | 𝔽₅, L=O: (1,2): 4≠1, not an arrow; (4,2): 4=4, an arrow | ✓ |
| 29 | §4.6 | u=2: γ′=4, 4⁻¹·2²=1; γ′=2: 3·4=2≠1 | ✓ |
| 30 | §4.10 | ι∈{1,2} over 𝔽₅ needs v²=3: no solution | ✓ |
| 31 | §4.12 | one branch point: {(c,u): u²=c}≅𝔾_m; α=(1,0), r=2: μ₂ | ✓ |
| 32 | §§5.8/5.22 | μ₂²→μ₂ has kernel {(1,1),(−1,−1)}; three factors: swap 0↔1 gives ((ζη)⁻¹,η) | ✓ |
| 33 | §5.23 | ideal (s²+t², s²t², st) = (s²+t², st); s≠0, s³=0; stabilizer diagonal μ₂ | ✓ |
| 34 | §5.13 | k[ε]/ε³, a=ε², α=ε: α²=a; fibre value 0 ⇒ T_eff=∅ | ✓ |
| 35 | §5.18 | ℙ¹, R={0,∞}, α=(0,1): ev(a)=(a,a)≠(0,1) ⇒ empty | ✓ |
| 36 | §6.9 | ℙ¹/𝔽₃, R of degree 2: \|𝔽₉^×/□\|=2, \|μ₂(𝔽₉)\|=2 | ✓ |
| 37 | §6.11 | 𝔽₅: A_R≅C₄ via v; (4,2): 2²=4=4⁻¹, order 4; (q^d−1)/(q−1) ≡ d mod 2 | ✓ |
| 38 | §6.12 | degree-2 x: π_x⁻¹ gives E=−x, O(x) of degree 2 | ✓ |
| 39 | §7.2 | ℤ/2[G]→ℤ/2 sends 1+g to 0; invariant 1 not hit | ✓ |
| 40 | §§7.14/7.18 | ℙ¹, R={0,∞}, quadratic Kummer: χ_c(𝔾_m)=0, H⁰_c=H²_c=0 ⇒ all cohomology 0 | ✓ |
| 41 | §7.15 | R=∅, ℙ¹: S_d-invariants of (ℚ⊕ℚ[−2])^⊗d = dims 1 in degrees 0,2,…,2d = H*(ℙ^d) | ✓ |
| 42 | Layer 7 examples | dim H¹=2: ∧^d dims 1,2,1,0 | ✓ |
| 43 | §§8.1/8.5 | d=2g−2+ρ: L(−R)=ω, H¹≠0, so the threshold is strict | ✓ |
| 44 | §8.6 | (x,y)↦(x²,y) has weights (2,1); (a,ρ)=(2,1): rank 4 | ✓ |
| 45 | §8.12 | g=0, ρ=2: B=3. g=1, R=∅, d=1: Q_b=ℙ⁰, fibre 𝔾_m | ✓ |
| 46 | §9.6 | degree-2 P, d=−5, B=3: 4[P] gives 3≥3, 3[P] gives 1<3 | ✓ |
| 47 | Layer 9 examples | D=2x, deg 4: scalars a², a⁻²; d=−3 plus 6 gives 3 | ✓ |
| 48 | §10.5 | d=3, a=2: trace 2, not 8 | ✓ |
| 49 | §10.9 | u=−1: Nm=1, residue −1 ∉ ker N | ✓ |
| 50 | §10.31 / worked example | 𝔽₅, t↦t²: 2·2·2=8 root units, 4 norms; (1,1,−1) has order 2; O(1) has degree 1 ∉ 2ℤ | ✓ |
| 51 | Worked example ℝ | ζ_n=ζ_{2n}²=1; two Kummer families | ✓ |
| 52 | Worked example Kummer | a=2, n=3: Isom class [1/2], coframe class [2], ratio 4 not a cube; λ↦3λ gives [3/2] | ✓ |
| 53 | Worked example factorial | 720/5=144=6·24 | ✓ |
| 54 | §6.5 frame action | (u⁻¹τ_x mod m)∘ι=(v⁻¹t_x)² ⇔ ū=v²; coefficient f·a_x·u_x | ✓ |
| 55 | §10.14 | inert x of degree 2: η(π_x⁻¹)=−1, matching §10.11's trace −1 | ✓ |

**Coverage.** Layers 4–10 (136 targets and two preambles) were read in full. Layer 2 (18 targets) was read in full. For Layers 1 and 3 (670 targets) I scanned every Check bullet and read every sampled or headline target in full (§§1.1–1.27, 1.41, 1.65, 1.124, 1.211–1.215, 1.218, 1.228, 1.237; §§3.9, 3.13–3.15, 3.20, 3.61–3.62, 3.76, 3.98, 3.142, 3.239, 3.299, 3.374, 3.382–3.384, 3.404, 3.409, 3.413). The other Layer 1/3 targets were not given individual rows.

## Not verifiable

- B24 (Bresciani, 2024) is paywalled and settled as uncertified. The B24 locators in §§3.14, 3.62, 3.404, 3.409, 3.413, 3.427–3.428 and in the worked examples were not read.
- I could not read the READMEs of board packages SchemeAndStackFoundationsPartII (#420) and VStackSheavesAndLisseCategoriesPartII (#441): the index refs returned HTTP 404. Ownership against them was not checked; #420 is the likely home of Layers 1–3 (R10). Other board packages were checked only through `roadmaps grep` over the content pull requests, not read one by one.
- Global Stacks chapter numbers (26.17, 34.7, 39.10, 112.5.13): the chapter PDFs number theorems within the chapter. I verified the tags, not the global numbers.
- Layers 1 and 3: about 600 targets were scanned but have no individual adversarial row (see Coverage).
- No Lean proofs were attempted.

## Source issues

- **Misprint** in YZ19 at the proof of Lemma A.5, printed p. 518: the idele of a framed line is printed as τ_x∘τ_η⁻¹, which sends O_X(x) with its natural frames to ϖ_x; it should be τ_η∘τ_x⁻¹, so that ϖ_x⁻¹ ↦ O_X(x)♮ as the lemma states; affects nothing.
- **Misprint** in YZ19 at the proof of Lemma A.5, printed p. 518: the extra data is written (K_R, ι, τ_R), with the line-frame letter; it should be (K_R, ι, t_R), the root frames; affects nothing. Already recorded by the author as E9.
- **Gap** in YZ19 at A.3.3, display (A.11), printed p. 525: the four-term sequence of Picard stacks is called exact without saying in what sense, and on isomorphism classes it fails at Pic_X′ (for t↦t² on ℙ¹, O(1) is σ-invariant but not a pullback); it should specify the connecting maps and obstructions; affects a stated result. Already recorded as E8.
- **Misprint** in AGV08 at Appendix B.2, item (3), printed p. 53: the section equation raises τ to the power m, while d-th roots are being constructed; it should be φ(τ^d)=σ; affects nothing. Already recorded as E12.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "99fbf6f", "job": "REV-PKG-FunctionFieldArithmeticPartII", "model": "opus", "worker": "fable-rev69"} -->
