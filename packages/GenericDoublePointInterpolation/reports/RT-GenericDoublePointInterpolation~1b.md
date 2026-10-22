<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/144#issuecomment-6336042486 -->
Red team round 1 pass b (claude) of 6c7939f

Verdict: needs_changes

1. **F01** (P3) Nine sorried statements close in one tactic from the pinned Mathlib

   **Location:** `packages/GenericDoublePointInterpolation/Suggested.lean:61`, also 281, 310, 518, 547, 650, 660, 676, 688: “sorry”.

   **Claim:** `coefficientCoordinates_ext`, `doubleQuotient_mul`, `wellPoised_iff_surjective`, `coefficientCoordinates_isometry`, `minorCoordinateDegree`, `evaluationPrime_asIdeal`, `evaluationSchemePoint_over`, `principalOpen_membership` and `homogeneousEuler` are stated as targets but each is one tactic from Mathlib (or, for `minorCoordinateDegree`, one tactic from `minorTotalDegree`), so they are API consequences of the definitions, not targets. `homogeneousEuler` is the pinned Euler identity (pass a F06 asks for its deletion; the proof below only confirms that).

   **Witness:** A probe copy of the file with the proofs below in place of the nine `sorry`s elaborates with no error at any of those declarations (the Euler proof needs `import Mathlib`, which the file must use anyway).

   **Exact repair text:** Replace the nine proof bodies by, respectively:
   `exact (coefficientCoordinates d).injective.eq_iff.symm`;
   `exact map_mul _ _ _`;
   `exact Iff.rfl`;
   `exact AddMonoidHomClass.isometry_of_norm _ (fun _ => rfl)`;
   `simpa [nsmul_eq_mul, map_natCast] using MvPolynomial.IsHomogeneous.sum_X_mul_pderiv ((MvPolynomial.mem_homogeneousSubmodule _ _).mp f.2)` (then delete the declaration per pass a F06);
   `exact (MvPolynomial.degreeOf_le_totalDegree _ _).trans (minorTotalDegree d cols)`;
   `rfl`;
   `rw [evaluationSchemePoint, Spec.algebraMap, ← Spec.map_comp, ← Spec.map_id]` newline `congr 1` newline `ext a` newline `simp`;
   `simp [PrimeSpectrum.mem_basicOpen, RingHom.mem_ker, MvPolynomial.eval_map, MvPolynomial.aeval_def, algebraMap_int_eq]`.
   Keep `wellPoised_iff_surjective` and `evaluationPrime_asIdeal` only if they are wanted as `simp`/`rfl` API; drop the other seven from the README's target lists and list them as proved API.

2. **F02** (P3) `evaluationPrime` is admitted data not covered by pass a F01

   **Location:** `packages/GenericDoublePointInterpolation/Suggested.lean:655`: “⟨RingHom.ker (MvPolynomial.eval (fun z : Fin n × Fin r => P z.1 z.2)), by sorry⟩”.

   **Claim:** The abbreviation's `IsPrime` field is `sorry`, so `evaluationPrime`, and every statement mentioning it (`evaluationPrime_asIdeal`, `evaluationSchemePoint_image`, `principalOpen_membership`, `principalOpen_wellPoised`, `genericAffinePrincipalOpen`), rests on admitted data; pass a F01 lists twelve admitted definitions and omits this one.

   **Witness:** Over a field the kernel of a ring homomorphism into a domain is prime: `RingHom.ker_isPrime` in `Mathlib/RingTheory/Ideal/Maps.lean` at the pin; the probe copy with the repair below elaborates without error.

   **Exact repair text:** `⟨RingHom.ker (MvPolynomial.eval (fun z : Fin n × Fin r => P z.1 z.2)), RingHom.ker_isPrime _⟩`

3. **F03** (P3) LaTeX display mathematics in the README

   **Location:** `packages/GenericDoublePointInterpolation/README.md:15`, also 101–102, 139–140, 845, 851–852: “$$m=n(r+1)\le N(r,d)=\binom{r+d}{d}.$$”.

   **Claim:** The roadmap repository's house style forbids `$…$` and `$$…$$` delimiters; mathematics is Unicode with ASCII inside code spans, and a display formula becomes an inline code span or an indented code block. Five display blocks use `$$` with `\le`, `\binom`, `\operatorname`, `\qquad`, `\mathrm`.

   **Witness:** `packages/GenericDoublePointInterpolation/README.md:15`, 101, 139, 845, 851 (the only `$$` lines in the file; no `\(`, `\[` or inline `$` elsewhere).

   **Exact repair text:** Line 15: `m = n(r+1) ≤ N(r,d) = choose(r+d, d).` Lines 101–102: `A(r,d) = {α : Fin r →₀ ℕ | |α| ≤ d}, where |α| = Σ_j α_j.` Lines 139–140: `d = 2 with 2 ≤ q ≤ r, and (r,d,q) = (2,4,5), (3,4,9), (4,3,7), (4,4,14).` Line 845: `ru + e = q(r+1) − N(r,d−1), 0 ≤ e < r.` Lines 851–852: `AH(r−1,d,u), AH(r,d−1,q−u), AH(r,d−2,q−u−e)`. Each as its own paragraph (or an indented code block), no `$`.

4. **F04** (P3) The affine endpoint is narrowed to algebraically closed fields although its proof gives every characteristic-zero field

   **Location:** `packages/GenericDoublePointInterpolation/Suggested.lean:382`, also 389, 635, 697: “theorem genericAffineMinor {k : Type u} [Field k] [IsAlgClosed k] [CharZero k]”; `packages/GenericDoublePointInterpolation/README.md:12`, 1162, 1174: “Let k be an algebraically closed field of characteristic zero”.

   **Claim:** The four GI.5 signatures `genericAffineMinor`, `integerGridSpecialization`, `maximalMinor`, `genericAffinePrincipalOpen` and the README statements at lines 12, 1162 and 1174 assume `IsAlgClosed k`, but every conclusion is about an integer polynomial Δ ∈ ℤ[T] (nonzero as an element of ℤ[T] once it is nonzero at one point over any field) and about tuples over k with Δ(P) ≠ 0: the integer-grid target supplies such a tuple over every characteristic-zero field, and `principalOpen_wellPoised` needs no closure. Algebraic closure is used only inside the proof (the projective theorem over k̄); the file's own `integerGridForMinor` (line 710) and `parameterPullback` (line 718) already state the same conclusions with `[CharZero k]` alone, so the four signatures are at a different generality from their siblings and from the source, whose box argument produces rational integers (COU line 245–248) and is applied over ℚ (COU line 214–216).

   **Witness:** `packages/GenericDoublePointInterpolation/Suggested.lean:710–716` (`integerGridForMinor`, `[Field k] [CharZero k]` only) proves the k-point and well-poisedness claims of `genericAffinePrincipalOpen` from `selectedMinor d cols ≠ 0`, which is a statement in `ℤ[T]`; nothing in the conclusions of lines 382–394, 635–641 and 697–708 mentions k̄.

   **Exact repair text:** Delete `[IsAlgClosed k]` from the signatures at lines 382, 389, 635 and 697. README line 12: “Let k be a field of characteristic zero”; line 1162: “For a field k of characteristic zero, r≥1, d≥5, n≥1 and n(r+1)≤N(r,d), …”; line 1174 unchanged; add to the proof paragraph of “Nonzero maximal minor” the sentence “The witness is taken over an algebraic closure of k; since Δ has integer coefficients, Δ ≠ 0 in ℤ[T] and the integer-grid target returns a point over k itself.”

## Verified sound

- Read all 1,263 README lines (77 anchored targets, 42 named Checks) and all 745 Lean lines (73 theorems, 55 examples, 13 definitions, 8 abbreviations, 3 instances).
- Elaboration of `Suggested.lean` as submitted in a probe copy: exit 0, 141 `declaration uses 'sorry'` warnings, no error and no other warning (the file's own `set_option linter.unusedVariables false` is in force; pass a F03 covers the `set_option`s and the `Mathlib.*` imports).
- One-tactic probes: of 11 candidates, 9 closed (F01, F02); `evaluationSchemePoint_image` did not close in two attempts (`Spec.map_apply` plus `PrimeSpectrum.ext`) and is left as a target; `cubicRemainderArithmetic`, `planeNumerics`, `exceptionScheduler`, `monomialCount` were not attempted (universal statements, or dependent on the admitted `Fintype` instance).
- Numerical Checks recomputed: `numericalTraceBound`, `numericalResidualBound`, `numericalQuarticBound`, `criticalDivision` and `exceptionScheduler` for all 2 ≤ r ≤ 25, 4 ≤ d ≤ 12, every q ≤ 3000 and the floor/ceiling counts (0 violations); `cubicRemainderArithmetic` for r < 2000; `planeNumerics` for d < 300 (only d ≤ 4 and d = 6 survive; the d = 6 equality forces q = 9, as BO line 275); the quartic schedule r = 5…11 reproduces (u,e) = (54,4), (55,5) at r = 9 and u = 30 at r = 7 exactly as BO lines 966–971; N(6,4) = 210, N(7,3) = 120, residual lengths 118/126; N(5,4) = 126 for 21 points; the 12 near-exception ranks equal min(N(r,d), q(r+1)); the sextic ranks 27, 28; the three cubic certificate ranks 56, 84, 120 equal N(5,3), N(6,3), N(7,3); Prop 5.4 counts r(r−1)/6 and (r+1)(r−2)/6 give 3, 7 on L and 6, 8 outside for r = 5, 7; the collinear rank 11 = 6 + 5; the Hermite rank min(d+1, 2n); the ordinary-Horace derivation, the overfilled partial length identity (q−e)(r+1)+ν(r+1)+(e−ν)r = N(r,d) with ν = N(r−1,d)−ru, the underfilled rank sum (r+1)(q−e)+2e, the quadric radical dimension choose(r+2−q, 2), and all 55 example statements under their stated hypotheses (the two zero-ring caveats are pass a F10).
- Locators verified against the cached legal copies (24): BO Theorem 1.1 line 22 with exceptions 34–38 (p.1); univariate remark 39–40 (p.1); Prop 2.1 line 127 and tangent computation 134–138 (p.3); Lemma 2.2 line 139 (p.3); Lemma 2.3 line 217 (p.5); Theorem 2.4 line 245, plane numerics 259–277 (p.6); §3 line 278, quadric cone dimension 279–292 (p.6), quartic exceptions 300–317; Theorem 4.1 line 374 (p.7), Castelnuovo sequence 407–412 (p.8); Theorem 5.1 line 481, Prop 5.2 line 486 and bases 490–497 (p.9), induction 500–508 (p.10); Prop 5.3 line 514 (p.10); Prop 5.4 line 539 (p.10), (i)/(ii) 543–549 and bases 550–559 (p.11); Lemma 6.1 line 628 (p.12); Lemma 6.3 line 765 (p.15); Theorem 6.4 line 798, Steps 1–2 at 807–830 (p.16); mixed family and rank sum 880–897 (p.17); second case 940–958 (pp.18–19); quartic bases 960–977 (p.19); §7.1 line 983–990 (p.19). COU §3 line 169 (printed p.491), matrix 195–199, AH citation 200–204; minors and integer box 242–248 (p.492); orthonormal monomial form and integer lattice 255–268 (p.493). Page markers agree with every printed page cited.
- Supplier citations checked: SchemeAndStackFoundations is on main (Layer 0 at README line 463, Layer 5 at 6535, §5.12 Bézout at 7336); AlgebraicModuliForArithmeticGeometry is not on main but is in `merge-order/ORDER.txt` (line 30), above the insertion point of this roadmap; the labels SF.0/SF.5/R09.1/R09.2 are pass a F05/F09, not re-raised. Mathlib declarations named in the supplier table all exist at the repository pin (`Matrix.rank_of_det_ne_zero`, `rank_submatrix_le`, `rank_eq_finrank_range_toLin`, `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`, `degreeOf_le_totalDegree`, `basisRestrictSupport`, `mem_restrictTotalDegree`, `monomial_mem_restrictSupport`, `Sym.equivNatSum`, `Sym.card_sym_eq_choose`, `TrivSqZeroExt.inr_mul_inr`, `Ideal.quotientInfRingEquivPiQuotient`, `MvPolynomial.lcoeff`, `pderiv_monomial`, `pderiv_X`, `pderiv_mul`, `eval_monomial`, `aeval_monomial`, `PrimeSpectrum.mem_basicOpen`, `Spec.map_apply`, `Spec.algebraMap`, `AffineSpace.SpecIso`, `homOverEquiv`); the Tau Ceti pin `a91d3aaf…` matches the manifest and `restrictTotalDegree_mono`, `restrictTotalDegree_eq_span`, `TauCeti.MvPolynomial.apply_mem_of_basis` exist there. The Mathlib revision in the README links is pass a F04.
- Policy: no `lemma`, no process words, no issue or PR numbers in the README; `set_option`, imports, docstrings, namespace and example cap are pass a F03/F02.
- Dependency check:

```text
NOT IN ORDER: GenericDoublePointInterpolation (insert it after its last supplier)
depcheck: 9 roadmaps, 71 edges, 1 problem(s)
```

  No UPWARD or CYCLE line; `grep -nx GenericDoublePointInterpolation merge-order/ORDER.txt` is empty (imported package, not a defect).
- Not re-raised (pass a, round 1): F01 admitted data, F02 admitted examples beyond the cap, F03 module shape and `set_option`, F04 Mathlib revision, F05 SF.0/SF.5 contract, F06 Euler duplication, F07 missing finite-base headlines, F08 missing `sources.toml`, F09 R09.1/R09.2 labels, F10 zero-ring Checks, F11 unmatched Lean names, F12 mixed-parameter families, F13 Castelnuovo generality, F14 transverse residual wording, F15 selected-minor page, F16 missing Checks, F17 ring/field generality; also the COU hypothesis `d > 5` (COU line 172, 201) versus the README's inclusive d ≥ 5 supported by BO Theorem 1.1, which pass a recorded as sound.

## Not verifiable

- `sources.toml` is absent from the package (pass a F08), so the cached copies were located by content: the arXiv `math/0701409v2` text (29 extracted pages; printed pages 1–19 cover §§1–7.1) and the Annals open-access PDF of COU; both were read from the sources cache, not from the network.
- The README is not in the `# Roadmap:` / `## Layer k` / `### Examples` / `### Dependencies` shape and uses `**API.**`, `**Tests.**`, `**Prerequisites:**`, `**Source:**` field lists; whether the TauCetiRoadmap shape applies to an explorer-imported package was not decided here, so it is recorded, not raised.
- `evaluationSchemePoint_image` was not proved in the probe (see Verified sound); its truth was checked by hand (the unique point of Spec k maps to the kernel of evaluation).
- The geometric targets of GI.2–GI.4 (restriction rank, residual/trace, flat families, moving supports) have no Lean signatures and no supplier declarations to pin; their statements were checked against BO as mathematics only.
