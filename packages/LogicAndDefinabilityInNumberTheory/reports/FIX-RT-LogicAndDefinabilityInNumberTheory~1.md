# FIX-RT-LogicAndDefinabilityInNumberTheory~1

Repair round for red-team round 1 (reviews `~1a` and `~1b`). There are 16 findings in 14 sections. Twelve findings are applied or applied differently, one is partly applied (`1b/F07`) and one is disputed (`1a/F06`). Files changed: `packages/LogicAndDefinabilityInNumberTheory/README.md`, `Suggested.lean`, `sources.toml` and `design/plan.json` (top-level `gaps` only).

## RT-LogicAndDefinabilityInNumberTheory~1a/F01 (P1) — applied

The doubled-origin line has q+1 residue points but its image in X(F) has volume 1 (GWZ Theorem 1.4 measures the set X(O_F), lines 142–145).

§2.9: "X smooth … over O_F" → "X separated smooth finite-type", so X(F) is Hausdorff and X(O_F)↪X(F). New Checks: 𝔸¹, 𝔾_m, doubled-origin negative control. §2.11 notes that Néron models are separated.

## RT-LogicAndDefinabilityInNumberTheory~1a/F02 (P1) — applied

On the split Tate curve over ℚ₃, ker[2] on 𝒜° has order 4 generically and is μ₂ on the special fibre.

§2.10(a): "étale isogeny 𝒜°→ℬ°" → "φ étale; étale isogeny 𝒜°_k→ℬ°_k on special fibres; no finiteness over O_F". The proof sketch derives it. The Tate case is now a Check (point counts 2=2 over 𝔽₃). §2.11 cites the étaleness of φ.

## RT-LogicAndDefinabilityInNumberTheory~1a/F03 (P1) — applied

The cycle was real: the uniform h/G clause of §2.4 used §§3.7 and 3.9, and §3.9 needs §2.4.

That clause and its CGH §4.5 proof move to the end of §3.9, with three Checks. §2.4 keeps the fixed-field theorem and the uniform cell integral (Pas Lemma 5.2). §3.9 *Needs:* gains §2.5.

Same pattern: §2.6's uniform route becomes Pas Theorem 5.1. No id moves.

## RT-LogicAndDefinabilityInNumberTheory~1a/F04 (P1) — applied

Gao defines U as the weight −2 part (Definition 2.1, lines 233–251; Notation 2.8, lines 311–315), and W is a central extension of V by U (line 389).

§7.7: "W with centre U" → "weight −2 subgroup U, normal in P, central in W, Lie U=W₋₂(Lie P)". The universal-elliptic-curve Check now shows Z(W)=W≠U=0. There is no other occurrence.

## RT-LogicAndDefinabilityInNumberTheory~1a/F05, RT-LogicAndDefinabilityInNumberTheory~1b/F06 (P1) — applied

CTV §4 (lines 496–515) defines X_u as a fibre of 𝒳 over k[u,1/u], built from B=A[v]/(v^p−du), with d and P from Proposition 3.4.

§4.29(c) now uses that family: K_u is an étale algebra and split fibres are rational. The field-case Brauer computation of (a) is used only on field fibres. New: the u=d⁻¹ Check and the CTV §4, p.14 locator.

## RT-LogicAndDefinabilityInNumberTheory~1a/F06 (P2) — disputed

Neither statement is a headline; both are README targets.

- **Quadratic nonnorms (§4.27).** This is Koenigsmann's Proposition 21(e) (`koenigsmann_defining_z` line 712), a lemma consumed in the proof of Corollary 22 (lines 894–897). Corollary 22 is the stated headline `one_universal_variable`. The nonsquare clause of §4.27 is the stated headline `nonpowers_diophantine` at k=ℚ, r=2, since ℚ∖ℚ²=ℚ×∖ℚ×².
- **Th(ℚ) not model complete (§4.32).** This is Remark 24 (lines 956–964). Its four-line proof uses only that ℤ is definable in ℚ and that Diophantine sets are r.e., and both inputs are headlines already (`universal_integers`, `Diophantine.mrdp`).

Stating either would be padding under the acceptance-test rules. Review `1b` reached the same verdict on §4.32.

## RT-LogicAndDefinabilityInNumberTheory~1a/F07, RT-LogicAndDefinabilityInNumberTheory~1b/F05 (P3) — applied

Computed Checks were added in the README only:
- §4.12: P(11,4)=95 codes (1,2); P(5,2)=17 keeps the positive remainder 5; P is a bijection.
- §4.31: fields fail at ℚ⊂ℚ(√2); ACF₀ is model complete; ℚ⊂ℝ lies outside Th(ℚ).
- §4.33: F=0 at (1,1,0); the guard at a=−1; at a=b=3, t=1/2 is rejected and 1/5 accepted.
- §3.11: the images of 𝔾_m and ℙ¹; inverses in M_loc; the Euler-characteristic control.

## RT-LogicAndDefinabilityInNumberTheory~1a/F08 (P2) — applied

CTV Theorem 3.1(i) (lines 274–277) asks that the algebraic closure of k(M) in the function field be abelian. "Contains an abelian extension" is vacuous.

§4.29(b) now uses CTV's condition and verifies it: the closure is k(M), or K⊗k(M), cyclic of degree p since Q and R have no zero in K. Also new: the S₃ negative Check, and the Hasse principle for "smooth" fibres.

## RT-LogicAndDefinabilityInNumberTheory~1a/F09 (P3) — applied

The finding is correct. `mvPolynomialEquiv` is absent from `hilbert10_polynomial_bridge`, whose declarations are at lines 555–669. NormalForm declares `dioph_iff_exists_fin_mvPolynomial` (line 623) and `dioph_iff_exists_finite_mvPolynomial` (line 693), not `exists_finset_right_rename`.

The `sources.toml` locators are now "toDiophPoly; toDiophPoly_apply; exists_mvPolynomial" and "dioph_iff_exists_fin_mvPolynomial; dioph_iff_exists_finite_mvPolynomial". The README's citations already used these names.

## RT-LogicAndDefinabilityInNumberTheory~1b/F01 (P1) — applied

B2.6, read at its head, states only the arc theorem (#π₂(Σ)≤1 at b=0) and gives its decomposition in one clause, with no count.

Declared `gap:block-family-covering` (Pila 2009 Theorem 3.5(1)–(2), lines 265–273) in the README contract and in `design/plan.json`. §6.13 aligns with Pila Definition 3.2. §6.14 applies the covering. The gap is added to *Needs:* of §§6.14–6.16, to Layer 6 Dependencies and to Scope.

## RT-LogicAndDefinabilityInNumberTheory~1b/F02 (P2) — applied differently

ShimuraVarieties §3.5d states only `definable_chow`. Its proof plan does construct the "extension arguments" (PS Theorem 4.4), so owning that theorem here would plan it twice, and §3.5d is earlier.

Declared `gap:definable-remmert-stein` (§3.5d) in the README and in `plan.json`. §6.8 imports the smooth case and owns only the singular ambient. E need not be definable. New Check: A={1/n}.

## RT-LogicAndDefinabilityInNumberTheory~1b/F03 (P2) — applied differently

The criticised passage was the smooth-case proof, which `gap:definable-remmert-stein` now assigns to the supplier, so it is deleted rather than rewritten.

§6.8 keeps only its singular-to-smooth reduction (Y⊆W). Dropped: the citations of PS Theorems 3.2 and 4.1, and the *Needs:* entries §6.4 and ShimuraVarieties §3.4d.

## RT-LogicAndDefinabilityInNumberTheory~1b/F04 (P3) — applied

`rational_nonintegers_diophantine` is the negation of `universal_integers` (via `eval_map`), and `rationalDiophantine` had no other use. A roadmaps grep finds no consumers.

Both are deleted from `Suggested.lean`, together with the phrase in the module docstring. The docstring of `universal_integers` records the equivalent form. README §4.17 now states the specialization in prose, and §4.24 names `universal_integers` only.

## RT-LogicAndDefinabilityInNumberTheory~1b/F07 (P3) — applied differently

- **CL locator: applied.** Corollary 7.5.4 is on p.45 (`cluckers_loeser_2008` lines 1849 and 1867); README §2.5 now reads "pp.43–45".
- **Pas locator: disputed.** Scan page 1 of `pas_1989` is the GDZ cover. Line 288 heads printed p.144, and §3.6 starts at line 299. "§§3.6–3.8, pp.144–155" is therefore correct and is kept.

## Checks run

- **Elaboration.** `lake env lean packages/LogicAndDefinabilityInNumberTheory/Suggested.lean`, run from the content checkout: 11 "declaration uses `sorry`" warnings and no errors. The TauCeti module object file was present.
- **Binder check.** `#check @name` for all 16 declarations, in one scratch file elaborated once. Every elaborated type matches its README statement and no binder was lost. The only change is the removal of the two deleted declarations.
- **Dependency check.** Output:

  ```
  depcheck: 239 roadmaps, 2174 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver.** `roadmaps resolve` on the README: none found nowhere, for both cross-roadmap citations and Lean names.
- **Gate failures.** None were listed for this round.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §2.9 Weil volume | 𝔸¹, dx | vol 1; q/q=1 | agree | Check |
| §2.9 | 𝔾_m, dx/x | 1−q⁻¹; (q−1)/q | agree | Check |
| §2.9 | doubled origin | image volume 1; count (q+1)/q; chart-glued (1−q⁻¹)+2q⁻¹ | fails without separatedness | hypothesis added |
| §2.10(a) | Tate E/ℚ₃, [2] | kernel 4 (generic), 2 (special) | not finite over O_F | special-fibre isogeny |
| §2.10(b) | same, k=𝔽₃ | #𝔾_m(𝔽₃)=2 on both sides; #H¹(𝔽₃,μ₂)=2=#μ₂(𝔽₃) | agree | Check |
| §3.9 uniform clause | φ=ab−c | h=ab−c vanishes exactly on c=ab; G=0 | agree with §2.4 negative control | moved |
| §3.9 | one-cell of order a | L^(−a−1)↦q^(−a−1); inverse convention gives q>1 at a=0 | inverse convention excluded | Check |
| §3.9 | 1_(O_F) | Σq^(−n)(1−q⁻¹)=1 | agree | Check |
| §2.6 uniform route | Pas 5.1 | rational in p^(−s), degrees bounded in p | supports clause | route cited |
| §3.11 | 𝔾_m, ℙ¹ | [ℚ(1)]−1, 1+[ℚ(1)] | agree | Check |
| §3.11 | χ of the ℓ-adic realization | [ℚ(n)]↦1, so 1−[ℚ(−1)]↦0 | not a unit before localization | Check |
| §4.12 | P(11,4) | T(13)+4=95; 11≡1 mod 5, 11≡2 mod 9 | codes (1,2) | Check |
| §4.12 | P(5,2) | T(5)+2=17; 5 mod 5 → 5 | positive remainder | Check |
| §4.12 | P bijective | P(1,1)=1, P(2,1)=2, P(1,2)=3; diagonal s fills T(s)+1..T(s+1) | single-valued | Check |
| §4.29(c) | p=2, k=ℚ, u=d⁻¹ | K_u≅ℚ×ℚ; Ξ₁Ξ₂=P(x), dim 2=p | split fibre rational | restated |
| §4.29(b) | S₃ constant field L | contains k(M) (abelian); closure L not abelian | old wording vacuous | Check |
| §4.29(b) | zero M of Q | K⊗k(M) a field iff Q has no zero in K; cyclic of degree p | condition holds | proof sketch |
| §4.31 | ℚ⊂ℚ(√2) | ∃x,x²=2: false, then true | fields not model complete | Check |
| §4.33 | a=b=1, t=0, u=(1,0,0,0), v=0 | A=1, B=C=0; brackets 0, 4−4=0; F=2·2·0=0 | agree | Check |
| §4.33 | a=−1, u=(1,0,0,0) | a+A=0 ⇒ F=0 for all b, t, v | guard works | Check |
| §4.33 | a=b=3 | (3,3)₂=−1 (ε(3)=1); (3,3)₃=(−1/3)=−1; Δ={2,3}; T=ℤ_(2)∩ℤ_(3); 1/2∉, 1/5∈ | one pair is insufficient | Check |
| §6.8 | A={1/n} in ℂ∖{0} | closure A∪{0}, not analytic at 0; A not definable (infinite discrete) | hypothesis needed | Check |
| §6.8 | Y={xy=0}⊂W=ℂ² | closure in W is {y=0}⊆Y | agree | reduction kept |
| §6.14 via gap | X_t=(0,1) | one block family; 1≤cT^ε fibre; dim 1 ⇒ in X_alg; count 0 | agree with first Check | gap |
| §7.7 | universal elliptic curve | W=V=𝔾_a², Z(W)=W, U=0 | U≠Z(W) | restated |
| gap:block-family-covering | n=0 | fibre ∅ or one point; 1≤c | consistent with §6.14 Check 3 | — |

## Ownership and suppliers

- **gap:block-family-covering.** Supplier is AbelianSchemesAndArithmeticModuliPartII B2.6, read at the head of its open pull request. It is earlier in the merge order (line 155) than this roadmap (line 326).
- **gap:definable-remmert-stein.** Supplier is ShimuraVarieties §3.5d, read at its open head; it is at merge-order line 105.
- **Other candidate owners.** A by-object search (`Peterzil`, `basic block`, `block famil`) finds no other owner of either statement. ComplexComparisonPartII Layer C4 owns only the classical, non-definable Remmert–Stein theorem.
- **Moved uniform clause.** It goes from §2.4 to §3.9, inside this roadmap; no id changes.

## For the maintainer

- **New supplier requests.** The suppliers must state the two new gaps: B2.6's block covering, and the closure theorem of §3.5d. The authors of AbelianSchemesAndArithmeticModuliPartII and ShimuraVarieties should be told.
- **Deleted Lean names.** `rationalDiophantine` and `rational_nonintegers_diophantine` are deleted. No roadmap cites them.
- **Consumer to check.** §2.9 now assumes separated models and §2.10(a) asserts only the special-fibre isogeny. TopologicalMirrorSymmetryForHitchinSystems cites §§2.7–2.9 and 2.11; it should confirm that its models are separated. §2.11's conclusion is unchanged.
- **Diverged roadmap pull request.** The roadmap-repository pull request carrying LogicAndDefinabilityInNumberTheory (listed in `overlaps.md`) has a head that differs from this package in about 28 lines. At that head:
  - §4.29(c) and the §4.33 interface and Checks are revised differently;
  - §6.2 takes R_an,exp from ShimuraVarieties §3.5a;
  - Scope gains a ComplexComparisonPartII Layer C4 bullet.

  The two change the same targets, so that pull request must be rebased on this package before either merges. Its §6.2 and ComplexComparisonPartII changes would then be reapplied on top.
- **Review text.** No passage in the reviews was an instruction to act outside this job.
