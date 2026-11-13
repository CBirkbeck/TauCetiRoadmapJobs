<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6856721870 -->
Red team round 1 pass b (claude) of 5082d6d

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §§6.14–6.17 consume a block-covering statement that B2.6 does not make

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:1724`, "Apply the parameter-uniform
   block decomposition of AbelianSchemesAndArithmeticModuliPartII B2.6 with no unrestricted coordinates
   (b=0)"; also lines 9, 12, 112, 1738, 1750–1752, 1767–1769.

   Claim: B2.6 supplies, for a definable family, at most C·T^ε blocks (in the sense of §6.13) covering
   the rational points of height at most T of each fibre.

   Witness: AbelianSchemesAndArithmeticModuliPartII README lines 1516–1541 at its open head. The only
   quantified statement of B2.6 is the arc theorem under `#π₂(Σ)>c_ε T^ε`; at b=0, `#π₂(Σ)≤1`, so it is
   vacuous. The decomposition is one clause ("Also construct the parameter-uniform block
   decomposition"), with no count and no covering; "basic block" occurs nowhere in that README. The
   notion is defined only here, in §6.13, which is later in the merge order. This is not the settled
   finding F01 of `FIX-PKG-LogicAndDefinabilityInNumberTheory~4` (general o-minimal foundations, since
   resolved by ShimuraVarieties §§3.4b–3.4e): it concerns the statement B2.6 exports, not its inputs.

   Repair (declare the contract as a gap; the plan's `gaps` list gains the same slug):

   1. Under `### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII` add:
      "What AbelianSchemesAndArithmeticModuliPartII must provide (gap:block-family-covering): B2.6 must
      state the decomposition it constructs: for a definable family Z⊂ℝⁿ×ℝᵐ in an o-minimal expansion
      of the real field and ε>0 there are finitely many definable families whose fibres are basic
      blocks (Pila 2009, Definition 3.2) contained in the fibres of Z, and c>0, such that for every
      parameter t and every T≥1 the rational points of height at most T of Z_t lie in at most c·T^ε of
      those fibres."
   2. In `design/plan.json` add `{"slug": "block-family-covering", "supplier":
      "AbelianSchemesAndArithmeticModuliPartII", "section": "B2.6", "needs": <the sentence above from
      "for a definable family">}`.
   3. In §6.13 add: "A basic block is used here exactly as B2.6 uses it (Pila 2009, Definition 3.2);
      this section adds continuous semialgebraic images and the containment in X_alg."
   4. Add `gap:block-family-covering (AbelianSchemesAndArithmeticModuliPartII B2.6)` to the *Needs:*
      lines of §§6.14, 6.15 and 6.16, and in §6.14 replace "with no unrestricted coordinates (b=0)" by
      "in the form of gap:block-family-covering".

   Tested on the refuting instance: for X_t=(0,1) the contract gives one block family (the interval
   itself), the rational points lie in 1≤c·T^ε fibre, the block has dimension 1, so by §6.13 it lies
   in (X_t)_alg and the count of §6.14 is 0, as its first Check says. The b=0 reading of the stated arc
   theorem gives nothing for this instance.

2. **F02** (P2) §6.8 cites ShimuraVarieties §3.5d for a closure theorem that section does not state

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:1608`, "The manifold closure theorem
   used in the proof is imported from ShimuraVarieties §3.5d"; line 1610, "The manifold case is
   supplied by TauCetiRoadmap.ShimuraVarieties §3.5d"; *Needs:* line 1620.

   Claim: §3.5d provides the definable Remmert–Stein closure theorem in a complex manifold.

   Witness: ShimuraVarieties README line 997 at its open head: the target `definable_chow` is "a closed
   complex analytic subset W⊂S^an definable in an o-minimal expansion of R_an … is algebraic". No
   closure of an analytic subset of M∖E is stated. The inputs of the plan (Peterzil–Starchenko
   Theorems 3.2 and 4.1) are then owned by nobody.

   Repair (own the manifold case, with its two inputs as stated parts of the target):

   - Replace the last sentence of the first paragraph by: "The manifold case is proved here;
     ShimuraVarieties §3.5d states only the Chow theorem on smooth varieties."
   - Replace the opening of the second paragraph up to "Theorem 3.2 applied" by the text of R03, and
     state before it: "The target has three parts, for an o-minimal expansion of R_an and a definable
     complex manifold M. (i) Dichotomy: for an irreducible definable locally analytic A₁⊆M of complex
     dimension d and a locally analytic A₂⊆M, either A₁⊆A₂ or dim_ℝ(cl(A₁)∩A₂)≤2d−2
     (Peterzil–Starchenko, Theorem 3.2, p.10). (ii) Extension criterion: a definable locally analytic
     A⊆M with dim_ℝ fr_U(A∩U)≤dim_ℝ(A∩U)−2 for every open U has analytic closure (Theorem 4.1, p.10).
     (iii) Closure: for E⊆M closed analytic and A⊆M∖E closed analytic and definable, cl(A) is analytic
     in M (Theorem 4.4, p.12), and the same in a singular quasi-projective Y."
   - In the *Needs:* line delete "TauCetiRoadmap.ShimuraVarieties §3.5d" and keep §3.4d, §6.4, §6.7.
   - In "Scope and ownership" (line 24) change "§3.5d in §6.9" only if it also names §6.8: it does not,
     so no change there; in the ShimuraVarieties contract (line 104) no change.

   Tested on the Checks of §6.8: Y=ℂ, E={0}, A=ℂ∖{0}: (i) with A₁=A, A₂=E gives dim_ℝ(cl(A)∩E)=0≤2−2;
   (ii) gives cl(A)=ℂ analytic. The node {xy=0} with E the origin and A the punctured branch: embedded
   in W=ℂ², (iii) in W gives the branch {y=0}, inside Y.

3. **F03** (P2) the proof plan of §6.8 follows the source's proof clause by clause

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:1610`, "By the local criterion of
   Peterzil–Starchenko Theorem 4.1, it suffices that … for every open U; working locally with A
   definable, Theorem 3.2 applied to each connected component M_i of the regular locus …".

   Witness: `peterzil_starchenko_agc` lines 599–605 (proof of Theorem 4.4). The README sentence has the
   same five clauses in the same order with the same letters (U, A, M_i, E): reduction to the frontier
   inequality, localisation, components of the regular locus, the dichotomy, exclusion by A∩E=∅. The
   longest run of consecutive shared words is 4 ("for every open U"); the structure, not the wording,
   is taken over.

   Repair (the passage written again; it replaces the text from "By the local criterion" to "because
   A∩E=∅."):

   "The argument is a dimension count. Near a point of E, the smooth points of A split into finitely
   many connected pieces (§6.4); each is an irreducible locally analytic set and none lies in E, since
   A does not meet E. Part (i) then says that such a piece of real dimension 2d accumulates on E in a
   set of real dimension at most 2d−2. Adding the finitely many pieces, the frontier of A has real
   dimension at most dim_ℝ A−2 on every open set, and this is exactly what part (ii) needs to conclude
   that the closure is analytic."

   Tested on Y=ℂ, E={0}, A=ℂ∖{0}: one piece of real dimension 2, accumulating on E in a set of
   dimension 0=2−2; the frontier {0} has dimension 0≤2−2.

4. **F04** (P3) `rational_nonintegers_diophantine` and `rationalDiophantine` are padding

   Location: `packages/LogicAndDefinabilityInNumberTheory/Suggested.lean:81–85` and `94–96`.

   Claim: a headline separate from `universal_integers`.

   Witness (one-step probe, read not run): from `universal_integers` one gets `⟨n, p, h⟩`; then
   `⟨n, MvPolynomial.map (Int.castRingHom ℚ) p, fun x => by simp [rationalIntegers, h,
   MvPolynomial.eval_map]⟩` closes it after unfolding `rationalDiophantine`. The docstring says so
   itself: "Negation of the universal definition". The definition `rationalDiophantine` has no other
   use in the file.

   Repair: delete both declarations from `Suggested.lean`; in the module docstring delete "Diophantine
   rational nonintegers,". The README keeps the statement ("equivalently ℚ∖ℤ is Diophantine over ℚ",
   §4.24); in README line 1222 write "The acceptance signature is `universal_integers` in
   Suggested.lean.", and in line 1096 write the specialisation in prose, without the backticked name
   `rationalDiophantine` ("For unary subsets of ℚ this theory specialises to a single equation with a
   finite witness block; `rationalIntegers` is the actual embedded integer set.").

5. **F05** (P3) two definitions without Checks

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:1375–1385` (§4.33, the polynomial F,
   declared as `twoUniversalIntegerPolynomial`) and lines 798–808 (§3.11, M_loc and the realization).
   Neither has a **Checks.** block; three discriminating Checks per definition are required.

   Repair, §4.33 (values computed below in the pass table):

   - "At a=b=1, t=0: u=(1,0,0,0), v=0 gives B=C=0, u₁²−B−1=0 and (t−2u₁)²−4C−4=4−4=0, so F=0."
   - "At a=−1, any b and any t: u=(1,0,0,0) gives a+A(u)=0, so F=0 whatever the bracket is; the guard,
     not the bracket, discharges a≤0."
   - "At a=b=3 the algebra is division exactly at 2 and 3 ((3,3)₂=−1 for two units ≡3 mod 4;
     (3,3)₃=(−1/3)=−1), so T_(3,3)=ℤ_(2)∩ℤ_(3): t=1/2 has no u,v with F=0, while t=1/5 has. One pair
     (a,b) therefore neither accepts all of ℚ nor cuts out ℤ; the quantifier over all a,b does."

   Repair, §3.11:

   - "[𝔾_m]=𝕃−1 maps to [ℚ(1)]−1 and [ℙ¹]=1+𝕃 to 1+[ℚ(1)]."
   - "(1−𝕃⁻¹)⁻¹ maps to the inverse of 1−[ℚ(−1)], which exists in M_loc by construction and need not
     exist in TriangulatedK0(DM_gm(k,ℚ))."
   - "Sending 𝕃 to 1 (homotopy-invariant motives without compact supports) would send 1−𝕃⁻¹ to 0 and
     admit no extension to A; the compactly supported measure is the one used."

6. **F06** (P3) §4.29(c) defines X_u through (a) at parameters where (a) does not apply

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:1298`, "for u∈k× let X_u be the
   model of (a) for K=k((du)^(1/p)), defined in a smooth projective family over k[u,1/u]".

   Witness: u=d⁻¹ (or any u with du∈k×p): k[v]/(v^p−du) is k^p, not a field, and (a) assumes K a
   field with Q, R without zero in K. `le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres`
   lines 502–515 define the family first and X_u as its fibre, for the d and P of its Proposition 3.4.

   Repair: replace (c) by "(c) Suppose k contains a primitive p-th root of unity ζ, and let d and
   P=QR be as in (d). Put A=k[u,1/u], B=A[v]/(v^p−du), let 𝒰 over A be N_(B/A)(Ξ)=P(x)≠0 and 𝒳 a
   smooth projective A-scheme containing 𝒰 as a dense open subscheme; for u∈k× write X_u for its
   fibre, which contains U(k[v]/(v^p−du)/k,P) as a dense open subset. When du is a p-th power, X_u is
   k-rational and unobstructed (the first Check). The set of u∈k× with X_u(𝔸_k)≠∅ and
   X_u(𝔸_k)^Br=∅ is a finite union of classes of k×/k×p." Tested at u=d⁻¹: X_u is defined (a fibre),
   rational, so not in the set.

7. **F07** (P3) two page locators

   - `packages/LogicAndDefinabilityInNumberTheory/README.md:455`: "CL Theorem 7.5.3 and Corollary 7.5.4,
     pp.43–44". Witness: `cluckers_loeser_2008` line 1867, Corollary 7.5.4 is on p.45 (line 461 of the
     README already has pp.43–45). Repair: "pp.43–45".
   - Lines 292 and 373: "proof in §§3.6–3.8, pp.144–155". Witness: `pas_1989` line 299, §3.6 begins on
     the ninth page of the article, p.145. Repair: "pp.145–155".

Files read in full: `packages/LogicAndDefinabilityInNumberTheory/README.md` (1951 lines) and
`packages/LogicAndDefinabilityInNumberTheory/Suggested.lean` (197 lines). No Lean was run; the
elaborated types are those of the worker's `signatures.md` (18 declarations), each compared with its
README statement. Seven findings: one P1, two P2, four P3.

## Declarations of Suggested.lean (18)

No `variable` or `include` block; every binder is in the declaration's own signature. Values are
computed by hand on each side.

| Declaration | Layer | Context | Instances and values | Result |
|---|---|---|---|---|
| `ax_kochen_ring` | 1 | `[Fact p.Prime]`, two `CompatibleRing` binders under ∃N | φ = ∃x, x²+1=0: p=2: ℚ₂ false, 𝔽₂((t)) true (x=1); p=3 both false; p=5 both true; so N≥2 exists and N=2 passes these | true, equals §1.5(a) for O=ℤ |
| `igusa_poincare_rationality` | 2 | O domain, char 0, DVR, finite over ℤ_p | n=0: 𝔪⁰=⊤, quotient trivial, count 1. m=0, f=c: counts 1 for n≤ord c, else 0, a polynomial; c=0: 1/(1−T). f=x, m=1: one solution (x≡0) at every level n, series 1/(1−T), P=1, Q=1−T | true; Q≠0 suffices in the domain ℚ[[T]] |
| `Diophantine.mrdp` | 4 | S ⊆ Fin n → ℕ | n=0: S⊆unit; both sides true for ∅ (1=0) and univ | true (MRDP) |
| `hilbert_tenth_integers` | 4 | none | n=0 would give a ↦ p(a)=0, computable; the ∃ lets n>0 | true |
| `rationalIntegers` | 4 | none | 0, −7 in; 1/2 out | real body |
| `rationalDiophantine` | 4 | none | ∅ by p=1 (m=0); {x≠0} by xy−1 | real body; padding with its theorem (R04) |
| `universal_integers` | 4 | none | n=0 impossible (p(t) would vanish on the infinite set ℚ∖ℤ, so p=0, which vanishes on ℤ too): the ∃ lets n>0 | true (Koenigsmann Prop. 18) |
| `rational_nonintegers_diophantine` | 4 | none | follows from the previous one by negation and `eval_map` | padding (R04) |
| `forall_exists_rational_undecidable` | 4 | none | k=0 would be existential (open): the ∃ lets k>0; route (P·w−1)·∏g=0: P=2, w=1/2 gives 0; integers z with P=0 give −1·∏≠0 | true |
| `one_universal_variable` | 4 | none | index type Fin (m+2) = cons t (cons x y) | true (Koenigsmann Cor. 22) |
| `twoUniversalIntegerPolynomial` | 4 | none | a=b=1, t=0, u=(1,0,0,0), v=0: (1+1)(1+1)(0²+0²)=0. a=−1: factor a+A=0 at u=(1,0,0,0) | matches `koenigsmann_defining_z` lines 268–272 term by term |
| `two_universal_integer_formula` | 4 | t : ℚ | a≤0: −a is a sum of four rational squares, guard vanishes; a,b>0: t∈T_(a,b); every prime ℓ lies in some Δ_(a,b) with a,b>0 ((a,b)≅(a,−ab)); (3,3): Δ={2,3}, t=1/2 rejected | true |
| `nonpowers_diophantine` | 4 | k number field, 1<r | ℚ, r=2: −1 in, 4 out, 0 out (0=0²); r=3: 2 in, −8 out | true (CTV Thm 4.3) |
| `IsOMinimalExpansion` | 6 | L, `[L.Structure ℝ]` | ℤ: frontier ℤ infinite, fails; (0,1): {0,1}; ∅: ∅; empty language: order not definable, fails | real body; equals §6.1 |
| `algebraicPart` | 6 | n implicit | X=(0,1): X; X={0}: ∅ (no non-subsingleton S); n=0: ∅ | real body |
| `rationalTupleHeight` | 6 | n implicit | −3/4: 4; (−3,2): 3; 0: max(0,1)=1; (): sup ∅=0, max 1 0=1 | real body |
| `pila_wilkie` | 6 | hL, hX, 0<ε | n=0: count ≤1≤C; X_t=(0,1): 0; singleton: ≤1; C independent of t, T (∃C before ∀t,T) | true (uniform Pila–Wilkie) |
| `bounded_degree_counting` | 6 | hL, hX, 1≤k, 0<ε | √2: degree 2, height √2: in for k=2,T=2, out for k=1; π: `absMulHeight₁`=1 (else-branch at the pin) and natDegree 0, excluded only by `IsAlgebraic` | true (Pila 2009, Thm 5.3) |

## Adversarial pass (README targets; one row per statement tested)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §1.2 ac under π′=επ | x=π | ac′(π)=res(π′⁻¹π)=res(ε)⁻¹; general factor res(ε)^(−ord x) | agree | none |
| §1.5 Check 3 | p=5, 13 | i≡2 mod (2−i): 1+ι=3 nonsquare, 4 square; p=13: ι=5,8, 1+ι=6 (nonsquare), 9 | agree | none |
| §2.1 unit shell | q | (q−1)·q⁻¹=1−q⁻¹ | agree | none |
| §2.5 Check 4 (𝔽₂((t))) | h=t^(2n), t^(2n+1) | s(h)=t·t^(2n), quotient t; s(h)=t^(2n), quotient t⁻¹; s∘s=id | agree | none |
| §2.6 tail identity | f=0, 1, x | 0=1+(T−1)/(1−T); T=1+(T−1); T(1−q⁻¹)/(1−q⁻¹T) both sides | agree | none |
| §2.10(c) | Φ=ℤ/3, σ=−1; S₃ on 𝔽₃³/diag | Φ^G=0, Φ/(σ−1)Φ=0; M^G=0 (class of (0,1,2) fixed by the 3-cycle only), (M*)^G = sum-zero diagonal, order 3 | agree | none |
| §2.10 Tate curve | ord Δ=n | #Φ(k)=n, #𝒜°(k)=q−1 | agree | none |
| §2.12 base-first sign | a=xy | da∧(−dx/x)=(x dy+y dx)∧(−dx/x)=dx∧dy | agree | none |
| §3.3 A₊ | L−2 | negative for 1<q<2 | agree | none |
| §3.11 | 𝔾_m, ℙ¹ | [ℚ(1)]−1, 1+[ℚ(1)]; supplier §4.20 has χᶜ(𝕃)=[R(1)] | agree; no Checks block | R05 |
| §4.8 negative control | q=u−v−1 collapsed | −1, no root; (1,0) is a root before collapsing | agree | none |
| §4.20 dyadic row | (1,1,1), (1,1,0) for a=6,b=15 | −6−15+90=69≡5 mod 8; −21≡3 mod 8 | agree | none |
| §4.21 Checks | R³₃, R³₅, R⁵₅, R⁷₇, R¹_(1,3) | Δ_(−1,−3)={3,∞}, Δ_(2,−3)={2,3}: ℤ_(3); Δ_(−1,−5)={2,∞}, Δ_(2,−5)={2,5}: ℤ_(2); Δ_(−2,−5)={5,∞}: ℤ_(5); Δ_(−1,−7)={7,∞}, Δ_(−2,7)={2,7}: ℤ_(7); Δ_(−2,3)=∅: ℚ | agree | none |
| §4.24 R̃ | S={3,5}, x=1/3 | x⁻¹=3∉5ℤ_(5), so x∈R̃; x∈ℤ_(5) | agree (union) | none |
| §4.25 single equation | P=2; integer root z | w=1/2 gives 0; (0·w−1)∏g = −∏g ≠ 0 | agree | none |
| §4.29(c) | u=d⁻¹ | K not a field; (a) not applicable | object undefined | R06 |
| §4.33 degree | monomial a²b²u₄⁸ | from A²·(ab u₄²)², coefficient 1; total degree 2+2+8=12 | agree; no Checks block | R05 |
| §5.4 | q | q²(1−q⁻¹)²(1/(1−q⁻¹)²−1)=q²−(q−1)²=2q−1 | agree | none |
| §6.5 Check 2 | t=2πk | sin(2πk x)>0 on (j/k,(2j+1)/(2k)), k intervals | agree | none |
| §6.8 import | ShimuraVarieties §3.5d | target is Chow only | not supplied | R02 |
| §6.14 route | B2.6 at b=0 | #π₂(Σ)≤1: stated theorem vacuous; covering not stated | not supplied | R01 |
| §6.16 Check 1 | √2 | coefficient height 2 ≤ 2²·(√2)²=8 ≤ 16 | agree | none |
| §6.17 exponents | lifts cD^δ, height CD^A | blocks ≤ C′(CD^A)^ε, Aε<δ | agree | none |
| §7.1 Check 1 | reduced (a,b,c) | |D|=4ac−b²≥3a²; H(Re τ)≤2a≤|D|; Im τ root of 4a²X²−|D| | agree | none |
| §7.5 Check 3 | 13 class-number-one values | list has 13 entries, 1 not among them | agree | none |
| §7.6 codimension | dim U>0 | codim U<dim X+dim Ď≤codim(X×Z)+codim W | agree | none |
| §7.7 δ | H≪N; H≪D^B | N^(1−ε)≥H^(1−ε); D^(1/b)≥H^(1/(bB)); δ=min(1−ε,1/b)/max(1,B) below both | agree | none |
| §7.7 Check 5 | 2-torsion over τ=i | N=2, H(1/2)=2, D=4 | agree | none |

## Dependency check

```
depcheck: 223 roadmaps, 1981 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` shows 15 files, all under
`packages/LogicAndDefinabilityInNumberTheory/`.

## Verified sound

- Declarations read: 18 of 18, each against its elaborated type and its README statement; the
  README names all 18 and no other name of its own. No `set_option`, no `lemma`, no sorry'd data,
  single `import Mathlib` plus one existing Tau Ceti module, which `algebraicPart` uses.
- Headline theorems: the module docstring lists the statable ones (all stated) and the not statable
  ones with the missing carrier. Non-model-completeness of Th(ℚ) (§4.32) is a remark in the source
  (`koenigsmann_defining_z` line 956), not a headline; no statable headline is absent.
- Targets read: all 93 numbered sections of Layers 0–7, with their 51 Checks blocks.
- Locators verified against the cached texts: 112. Koenigsmann (Observation 0, Theorem 1,
  Corollaries 2, 3, 3′, Definitions 4, 7, Propositions 6, 10, 16, 18, 21, 23, Corollaries 15, 22,
  Lemmas 17, 20, Remark 24, the p.79 formula); Colliot-Thélène–Van Geel (2.2, 3.2, 3.4, 4.1, 4.2,
  4.3); Pila 2009 (1.6, 3.2, 3.4, 3.5, 5.1–5.3); Peterzil–Starchenko (3.2, 4.1, 4.4, 4.5);
  Cluckers–Loeser 2008 (2.1.1, 2.1.2, 3.2.1, 3.3.1, (3.3.2), 4.4.1, 7.2.1, 7.5.2–7.5.4, 9.3.2,
  10.1.1, 12.1.1, 13.2, 14.1.1, 14.4.1, 15.1.1, 16.1.1, 16.4.1); the exponential paper (9.1.1,
  9.1.2, 9.1.5, 9.1.6, 9.2.1, 9.2.4); Cluckers–Gordon–Halupczok (2.1.3, 3.1.1, 3.1.5, 3.3.2, 4.3.1);
  Cluckers–Comte–Loeser (1.4.1, 1.4.2); Cubides–Darnière–Leenknegt ((HM1), 2.3); Cluckers
  (Theorems 2, 3); Lorenzini (4.3, Example 4.4); GWZ (1.4, 2.1, 2.4; 4.1–4.4); van den Dries–Miller
  (4.2, 4.3); Pila–Tsimerman 2014 (2.1, 2.3, 4.4, 6.1, 7.1–7.3, 7.7); Tsimerman (1.3, 5.2, §6);
  Gao (1.2, 4.3, 4.4, 12.2, 13.1, 13.3, 13.6); Lawrence–Sawin 6.3; Bakker–Tsimerman 1.1;
  Mok–Pila–Tsimerman 2.1–2.3; BKT (4.13, A.1, A.2); Masser–Zannier (pp.648–650); Poonen p.3;
  Pila–Tsimerman 2013 Theorem 3.1. Two are wrong by one page (R07).
- Checks tested by computation: the 27 rows of the pass table (about 45 individual values); the remaining Checks were read against their definitions without a recorded value.
- Sibling citations checked at main or at the open head: 41 section ids in 17 roadmaps
  (ShimuraVarieties 3.4b–3.4e, 3.5a, 3.5d, 3.6; NeronModelsAndSemistableAbelianVarieties 2.5, 4.6;
  MotivesAndAlgebraicCycles 4.20; HeightsRationalPointsAndObstructions 2.16b, 2.17, 2.20, 2.21, 5.1,
  5.6, 5.8; AdelicAlgebraicGroups 2.4 with both named bullets; WeilConjectures 5.29;
  ResolutionOfSingularitiesCharacteristicZero 6.2; StratifiedSpacesAndTameTopology 4.1, 7.1;
  AbelianSchemesAndArithmeticModuliPartII B2.6, B2.7, B2.14, B2.15, B2.18; ReductiveGroupsPartII
  RG2.3.7; SchemeAndStackFoundations 0.7, 2.20; DiophantineApproximationAndTranscendence 0.2, 0.3,
  5.6; QuadraticFormInvariants Layer 2, 6C; GlobalQuadraticForms 4.2, 4.3, 4.4 through its name map,
  5.5, 6.1; Chebotarev Layer 14; ClassFieldTheory Layers 5, 10–13; RealAlgebraicGeometry Layers 3,
  6; DifferentialGeometry "Boundary and corners"). All exist; two are cited for more than they state
  (R01, R02). The bridge `exists_oMinimalStructure_definable_iff` is in ShimuraVarieties §3.4b with
  the hypotheses the README quotes.
- Library declarations checked at the pins by grep: 31 Mathlib names and 8 Tau Ceti names of the supplier
  contracts, all present (the remaining names, such as `MvPolynomial.eval₂Hom`, `RingEquiv.ofBijective`,
  `Fintype.equivFin`, the scheme predicates and `MeasureTheory.Measure.addHaar`, were not opened in this pass). `NumberField.absMulHeight₁` returns 1 on non-integral input (its docstring
  says 0; the body's else-branch is 1), as the README says. `TauCeti.finite_setOf_absMulHeight₁_le`
  has the three hypotheses that `bounded_degree_counting` uses. Neither pin has an o-minimality or
  model-completeness predicate, so `IsOMinimalExpansion` duplicates nothing.
- Ownership by object (`roadmaps grep` over main and 449 open heads): no other roadmap states
  Pila–Wilkie counting, MRDP, Hilbert's tenth problem over ℤ, Ax–Kochen, the Koenigsmann results,
  Denef–Pas integration or Igusa–Poincaré rationality; no `Suggested.lean` declares any of the 18
  names.
- The declared gap `neron-pairing-perfect-finite-residue`: same slug in `design/plan.json` and in the
  README; precise; not provided by the supplier (its §4.6 says perfectness beyond the semistable
  case is not asserted); supported by `torsion_and_tamagawa_numbers` lines 1545–1559.
- Consumers: TopologicalMirrorSymmetryForHitchinSystems cites §§2.5, 2.7–2.9, 2.11, 2.12; no repair
  above renumbers a section.

## Not verifiable

- Davis (§§4.10–4.16), Bosch–Lütkebohmert–Raynaud §7.3 Proposition 6, Schneider Proposition 6.4,
  Hodges §5.3 and Denef 1984 Theorems 1.1–1.2: recorded as uncertified, no text. In particular I
  could not confirm that Denef's theorems are stated for finite extensions of ℚ_p and with the
  denominators 1−q^(−a)T^b that §2.6 attributes to them.
- Pila–Wilkie (Theorems 1.8, 1.10, Definition 1.4), van den Dries–Macintyre–Marker and van den
  Dries' book: waived, no text.
- The texts of the two `hilbert10` files and of the pinned `Dioph.lean` were not set beside
  §§4.1–4.9 line by line; the README names their declarations as sources.
- Truth of the Layer 7 input hypotheses and of Koenigsmann's Proposition 6 and Lemma 13 was not
  re-proved; the statements were compared with the sources and tested on the instances above.

Source independence: 21 passages compared with 7 sources, one shared in structure (R03, 4 consecutive words); largest share cluckers_loeser_2008, 37 of about 190 source mentions; contents compared with cluckers_loeser_2008: independent (its §7 cells sit in Layer 2 before its §§4–6 rings in Layer 3, §5.1 precedes §4 here, §§8, 9, 11, 13 and 15 have no section, and the order 3.5→3.6→3.7→3.8 is forced by the *Needs:* lines of §§3.5–3.8).

## Source issues

- **Misprint** in on_the_algebraic_points_of_a_definable_set at Definition 5.1 and Lemma 5.2, author pp.7–8: the source says a number of degree at most k is encoded by k coefficients and powers 0 to k−1; it should be k+1 coefficients and powers 0 to k, as its own root count uses; affects nothing.
- **Misprint** in peterzil_starchenko_agc at the proof of Theorem 4.4, p.12: the source says Theorem 3.2 is applied to M_i and A, and bounds the closure of M_i∩E; it should be applied to M_i and E, bounding cl(M_i)∩E, since A does not meet E; affects nothing.
- **Error** in cluckers_loeser_2008 at §15.1, p.83: the source says every affine open of a variety is isomorphic to an affine open subset of affine space; it should be a closed subvariety of affine space (an affine elliptic curve is a counterexample); affects the proof.
- **Gap** in le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres at Corollaire 3.2, p.10: the source says Q and R are irreducible of degree p and invokes Proposition 2.2(iii); it should also assume Q and R have no zero in K, as that proposition does; affects the proof.

## For the human reviewers

- **Licence.** README §§4.1–4.9 take their statements from the public formalisation cameronfreer/hilbert10 (`PolyBridge.lean`, `NormalForm.lean`), which README line 1914 records as Apache-2.0; `Suggested.lean` declares none of them. The licence was not read.
- **Licence.** The `tauceti_pin` entry of `sources.toml` names Tau Ceti tree `a91d3aaf` while the pin is `2fd255d9` (stated in the last repair report); every declaration was checked at the pin.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5082d6d245439523fa6e31226ab1fe55c8dd2a0a", "job": "RT-LogicAndDefinabilityInNumberTheory~1b", "model": "fable", "worker": "chris-x13"} -->
