<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13142#issuecomment-6849392231 -->
Red team round 2 pass a (claude) of 7d09c8d

Verdict: needs_changes

1. **F01** (P2) `gap:perfection-covers` asks the supplier for statements in vocabulary owned after it, and not for what §6.2 uses

   **Location.** `packages/SchemeAndStackFoundationsPartII/README.md:129` and the same `needs` in
   `design/plan.json`: "perfection preserves faithful flatness and ind-fppf maps, so perfecting a
   pro-fppf cover over a perfect base again gives a cover."

   **Claim.** PrismaticCohomologyPartIII §6.0 can supply this sentence, and it is the input of §6.2.

   **Witness.** (i) Pro-fppf covers are owned by §0.1 here, and ind-fppf maps by PerfectoidQuotientsPartII
   §Q7.1; `merge-order/ORDER.txt` has PrismaticCohomologyPartIII at line 85, PerfectoidQuotientsPartII
   at 220 and this roadmap at 257, so the supplier would need two upward edges. (ii) The only consumer
   is §6.2 (line 747), whose step (CS24 lines 3379–3389) perfects A′ when only
   A/^L(a₁,…,a_r)→A′/^L(a₁,…,a_r) is faithfully flat; A→A′ need not be flat, so the gap's sentence does
   not cover it.

   **Repair.** Replace the `needs` (README line 129 and the plan's `gaps` entry, same slug, supplier and
   section) by:

   "For a perfect 𝔽_p-algebra A, a finite tuple a₁,…,a_r of A (possibly empty) and an ordinary A-algebra
   A′ such that A/^L(a₁,…,a_r)→A′/^L(a₁,…,a_r) is flat, respectively faithfully flat, the colimit
   perfection A′_perf of A′ has the same property: A/^L(a₁,…,a_r)→A′_perf/^L(a₁,…,a_r) is flat,
   respectively faithfully flat. (CS24 Lemma 4.1.6, pp.37–38; proof of Theorem 5.7.2, pp.80–81.)"

   and add to the API list of §0.1 the cover form, which belongs to the owner of pro-fppf covers:
   "Over a perfect 𝔽_p-scheme S, if {X_i→S} is a pro-fppf (respectively fpqc) covering family then so is
   {X_i^perf→S}: locally X_i^perf is the colimit along Frobenius of copies of X_i, each in the class of
   stages over S because Frobenius of S is an isomorphism, the class of stages is closed under filtered
   colimits (`CategoryTheory.MorphismProperty.ind_ind`, Mathlib/CategoryTheory/MorphismProperty/Ind.lean:133),
   and X_i^perf→X_i is a universal homeomorphism, so images are unchanged (CS24 Lemma 4.1.6, pp.37–38)."
   Add `CategoryTheory.MorphismProperty.ind_ind` to the Mathlib table and to the *Needs* of §0.1.

   Tested. Empty tuple, A=𝔽_p, A′=𝔽_p[t]: A′_perf=𝔽_p[t^(1/p^∞)]=colim 𝔽_p[t^(1/p^n)], free hence
   faithfully flat. Non-empty tuple: the n-th Frobenius copy of A′ reduces to A′/^L(a^(1/p^n)), which is
   the base change of the flat A′/^L(a) along A/^L(a)→A/^L(a^(1/p^n)) (x↦y^(p^n) on ℤ[x]→ℤ[y]), so each
   term and the filtered colimit are flat; Spec(A′_perf/a)=Spec(A′/a) gives faithfulness. a=1: both
   sides are the zero ring. The new sentence names no object owned after the supplier.

2. **F02** (P2) `gap:complete-torsor-effectivity` names part of its content only by reference, under a name the source does not support

   **Location.** `README.md:107` and the plan's `needs`: "with the H⁰ Mittag–Leffler comparison of CS24
   Lemma 5.6.4 and without a Noetherian hypothesis."

   **Claim.** The supplier can tell from the sentence what second statement it owes.

   **Witness.** CS24 lines 3058–3073 (end of the proof of Lemma 5.6.4) use no Mittag–Leffler condition:
   they prove the exact sequence (5.6.4.3), whose first term lim¹_n G(A/a^n) is kept, not shown to
   vanish. §4.3 and §4.6 (line 567) consume exactly that sequence.

   **Repair.** Replace the clause by: "…are equivalent to compatible systems over C/a^n; consequently
   0→lim¹_n G(C/a^n)→H¹(C,G)→lim_n H¹(C/a^n,G)→0 is exact, the first map sending a sequence of
   transition isomorphisms between trivial torsors, modulo change of trivializations, to the torsor it
   defines; no Noetherian hypothesis." (README line 107 and the plan's `gaps`.)

   Tested on C=ℤ_p, a=p, G=μ_p, p odd: μ_p(ℤ/p^n)={1+cp^(n−1)} has zero transition maps, lim¹=0, and
   H¹(ℤ_p,μ_p)=ℤ_p^×/p=ℤ/p=lim_n (ℤ/p^n)^×/p. For C=𝔽_p[[t]], G=α_p: α_p(C/t^n)={x: x^p=0}=(t^⌈n/p⌉)/(t^n),
   the image of level m in level n is 0 for m≥pn, so lim¹=0, and H¹=C/C^p=lim_n (C/t^n)/(C/t^n)^p
   because C^p=𝔽_p[[t^p]] is closed.

3. **F03** (P3) §3.1 uses the stage-class stability of §0.1 and does not list it

   **Location.** `README.md:439–441` (§3.1 route and *Needs*), `README.md:491` (Layer 3 Dependencies).

   **Claim.** "the henselian refinement remains ind-fppf" follows from PerfectoidQuotientsPartII §§Q7.1,
   Q7.3 and the other listed inputs.

   **Witness.** R_n→R_n^h is ind-étale but not faithfully flat when IR_n⊄Jac(R_n): for R=ℤ_(p), I=(p),
   the factor ℤ_(p)[x] of R₁ gives a maximal ideal containing px−1, comaximal with p, missed by
   Spec R₁^h. So §Q7.3's composition of ind-fppf maps does not apply; one needs composition in the
   class of §0.1 and then the criterion of §Q7.3.

   **Repair.** In the route of §3.1, after "insert I-henselization at each step when I⊂Jac(R)", add:
   "R_n→R_n^h is a filtered colimit of étale algebras and need not be faithfully flat; R→R_n^h is a
   filtered colimit of flat finitely presented R-algebras by the composition statement of §0.1, and it
   is faithfully flat because every maximal ideal of R contains I and R_n^h/IR_n^h=R_n/IR_n, so it is
   ind-fppf by the criterion of PerfectoidQuotientsPartII §Q7.3." Add "§0.1 the pro-fppf site (stability
   of the stages under composition)" to the *Needs* of §3.1 and to the Layer 3 Dependencies. In "How to
   read the build" this is a Layer 0 input, so the sentence "Layers 1, 2 and 3 use none of one
   another's targets" stays true. Tested on the witness: ℤ_(p)→ℤ_(p)[x]^h_(p) is flat, its fibre over
   (p) is 𝔽_p[x]≠0, hence faithfully flat over ℤ_(p) although not over ℤ_(p)[x].

4. **F04** (P3) the *Needs* line of §4.5 omits two inputs of its route

   **Location.** `README.md:561–563`.

   **Claim.** The route needs only the listed inputs.

   **Witness.** CS24 lines 3149–3160: the right-hand side Rlim_n RΓ(A/^La^n,G) descends along A→A^• by
   fpqc hyperdescent (Theorem 5.5.2), since A/^La^n→A^•/^La^n is faithfully flat and not finitely
   presented; and "no nonsplit étale covers" passes from the a-adic completion of π₀ to its square-zero
   extension and to the quotients through henselian pairs (SP 09XI, 04D1). Neither
   PurityForFlatCohomology §3.6 nor SchemeAndStackFoundations §0.14 is in the line.

   **Repair.** Append to the *Needs* of §4.5: "PurityForFlatCohomology §3.6 (fpqc hyperdescent, for the
   quotients A/^La^n); §4.1 derived completeness implies henselianity; SchemeAndStackFoundations §0.14
   `henselian_pair_characterisations` (étale covers split over a henselian pair when they split modulo
   the ideal)". All three already occur in the Layer 4 Dependencies, so no layer edge changes. Tested:
   for A=ℤ_p, a=p, the Čech nerve of ℤ_p→(ℤ_p^nr)^∧ reduces modulo p^n to that of ℤ/p^n→W_n(𝔽̄_p), ind-étale
   and not finitely presented, so fppf hyperdescent (§3.2) does not suffice.

5. **F05** (P3) page of CS24 Lemma 5.4.1

   **Location.** `README.md:473`: "(CS24, Lemma 5.4.1, pp.62–63)".

   **Witness.** CS24 lines 2591–2607 (statement and proof) end before the p.63 marker at line 2609;
   line 481 of the README already says "p.62" for the proof.

   **Repair.** "(CS24, Lemma 5.4.1, p.62)" at line 473, and "§§5.1–5.7 pp.49–81" in the References is
   unaffected.

Two P2 findings (S01, S02), both on the wording of declared supplier contracts, and three P3 findings
(S03–S05). No P1: no statement of `packages/SchemeAndStackFoundationsPartII/README.md` or of
`packages/SchemeAndStackFoundationsPartII/Suggested.lean` was refuted by an instance, and every
cross-roadmap citation and pinned declaration resolves where it is cited.

## Round 1 findings at this head

Ids are those of the round 1 repair report. Line numbers are of `README.md` at `7d09c8d`.

| Round 1 finding | Status | Witness at this head |
| --- | --- | --- |
| 1a/F01 (DJ locator for torsor limit descent) | repaired | Line 105 ends "(CS24 Lemma 5.3.1, Claim 5.3.5.3 and Corollary 5.2.10, pp.57–59)"; DJ is now cited only at line 29 for "DJ Theorem 1.1, p.1" (DJ line 10: Br′=Br with an ample sheaf). CS24 lines 2378, 2408, 2459 are on pp.57–59. |
| 1a/F02 (Tor spectral sequence unowned) | repaired | Line 147 declares `gap:animated-tensor-spectral-sequence` (EnhancedDerivedSheaves, E5:animation.4); lines 255, 257 and 343 name it; the plan's `gaps` has the same slug, supplier, section and needs. |
| 1a/F03 and 1b/F01 (Weil-restriction smoothness asked of a supplier) | repaired | Line 109 ends at "…with the smooth affine commutative group-scheme category."; rows at lines 84–86 cite `TauCeti.Algebra.WeilRestriction.instSmooth` (Smooth.lean:60), `LaurentPolynomial.instSmooth` (Laurent/Smooth.lean:35) and `multiplicativeGroupPoints` (Basic.lean:65), all present at the pin. |
| 1b/F02 (stability of pro-ppf stages attributed to §Q7.3) | repaired | Line 185 states the criterion and the stability as a target of §0.1, with `ind_iff_exists` (Ind.lean:140), the cobase-change instance (Ind.lean:124) and `ind_of_preIndSpreads` (Ind.lean:186) read at the pin; SP Tags 00QO, 07C3, 05N9, 02JO read in the cached algebra chapter (lines 14610, 14640, 14744, 21653). |
| 1b/F03 (converse "pro-fppf singleton ⇒ ind-fppf") | repaired | Line 193: "conversely, if A→A′ is faithfully flat and A′ is a filtered colimit of flat finitely presented A-algebras, then A→A′ is ind-fppf", which is §Q7.3 of the PerfectoidQuotientsPartII package (its line 887). |
| 1b/F04 (§4.2 *Needs*) | repaired | Line 521 lists `henselian_pair_permanence`, `smoothGroup_fppf_etale_comparison`, `finite_pushforward_exact`, ReductiveGroupsPartII §RG2.0a and the three pinned names; Kummer is gone from §4.2. |
| 1b/F05 (page of Corollary 5.6.12) | repaired | Line 685: "(CS24, Corollary 5.6.12, p.77)"; CS24 lines 3223–3235 lie between the p.77 and p.78 markers. |
| 1b/F06 (process vocabulary) | repaired | Line 315 names "the henselization of the pair (A,I) of SchemeAndStackFoundations §0.12"; line 177 says "flat cohomology of ordinary algebras on the pinned carriers". |
| 1b/F07 (*Needs* of §§3.2–3.4, 4.7) | repaired | Lines 455, 469, 483, 591. The rewritten route of §3.4 (line 481) was recomputed step by step against CS24 lines 2596–2607 (table below); `DerivedDeRham.ordinaryQuotientCompletion_of_boundedTorsion` is in DerivedModuleAlgebra §1.5 on main for I=(f) with bounded f-power torsion. |
| 1b/F08 (slice-site comparison credited to a Mathlib definition) | repaired | Line 60 describes the definition only; line 87 cites `CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH` (Over.lean:141, `F : Sheaf J AddCommGrpCat.{v}`) with the universe caveat; line 610 states the comparison one universe up as an API item. |

No repair introduced a false statement. One residue of the repairs is S03 (the new stage-class
target of §0.1 is now the input §3.1 needs for its henselized refinement, and §3.1 does not list it).

## Verified sound

**Counts.** Declarations of `Suggested.lean` read: 6 of 6 (4 definitions, 2 theorems). README target
sections read: 31 of 31, with the Conventions, the 20 gap contracts, every *Needs* and Dependencies
line, the Examples and the Worked examples. Check bullets evaluated: 110. Source locators read
against the cached texts this round: 52 (CS24 35, BC22 6, SP 9 across the three cached chapters, of
which five statements were read and four located, DJ 1, R70 1; BG80 Proposition 2.2.1 located at its
page marker). Pinned rows checked by file and line: 37 of 37 (20 Mathlib lines, 17 Tau Ceti lines,
including the secondary lines 124, 173, 198, 232, 89). Sibling citations resolved this round: SchemeAndStackFoundations (10 names,
18 sections, main), EnhancedDerivedSheaves (5 names, 8 ids, main), DerivedModuleAlgebra (15 sections,
1 name, main), ReductiveGroupsPartII Layer RG2.0a (main), PurityForFlatCohomology §§0.2, 0.3, 2.1,
3.2–3.6, 7.10 (open head, read in full against README line 133), PrismaticCohomologyPartIII §6.0
(open head: three named targets with the stated hypotheses), ArcTopologyAndDescent §§11.2, 11.5, 12.7
(open head), HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison` (open head),
DerivedDeRhamCohomology §1.22 `DerivedDeRham.completionExchanges` (open head), PerfectoidQuotients
§§0.1, 0.4–0.6 (open head), PerfectoidQuotientsPartII §§Q7.1–Q7.3 (board package). The six leads of
the citation resolver are names of supplier README targets or the board package; none is missing.

**Dependency check.** Output of the brief's command:

```text
depcheck: 206 roadmaps, 1903 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. PurityForFlatCohomology (open head lines 204, 209, 3466) and
PerfectoidQuotientsPartII (package line 1672) name this roadmap as a consumer only;
PrismaticCohomologyPartIII and ArcTopologyAndDescent do not name it.

**Gaps.** The 20 contracts of the README and the 20 entries of the plan's `gaps` agree in slug,
supplier, section and needs (compared mechanically). None has supplier `none`. The four contracts on
PrismaticCohomologyPartIII §6.0 are not already provided: at its open head §6.0 names only
`perfectDieudonneComparison`, `pContinuity`, `excision` and `Prismatic.Gm.reductionCech`; the Bégueri
resolution and the deformation triangle occur in its proof route only. S01 and S02 concern wording.

**Ownership.** `roadmaps grep` by object (pro-fppf site, henselian nonunital rings, CS24 Corollary
5.6.9, Theorems 5.6.6 and 5.7.2, the four definition names): no second owner on main or at an open
head. The PurityForFlatCohomology text on the board differs from its open head (it still has a
"pro-fppf site" section 2.3); the open head, which the README cites, has moved that material to
PrismaticCohomologyPartIII §6.0 and has no such section.

**Policy.** The pull request changes only files under `packages/SchemeAndStackFoundationsPartII/`.
No pull-request number, process word, `lemma`, `set_option`, `#eval`, sorry'd data or algorithm in
the README or the Lean file; imports are Mathlib and two existing Tau Ceti modules.

**Headlines and padding.** Headlines: §4.5, §5.2, §5.3, §6.2. §5.2 and §5.3 are stated; §4.5 and §6.2
are named in the module docstring with the missing carriers (animated rings, their flat cohomology,
supports). The four definitions have real bodies and each is used by a stated headline. One-tactic
probe: neither theorem follows from a library lemma (no `flatCohomology` API exists at the pin), and
neither hypothesis set contains its conclusion. No padding.

### Lean declarations

No `variable` block; every binder is in the declaration. Elaborated types are those of the worker's
signature file (no Lean was run in this read-only pass).

| Declaration (line), README § | Binders and instances | Instances and values | Result |
| --- | --- | --- | --- |
| `pointsAddFunctor` (52), §5.0 | `R : Type u`, `CommRing R`, `G` over `CommRingCat.of R` | G trivial: one point, group 0. μ₂ at ℤ/4: T↦1,3, C₂. α₂ at 𝔽₂[ε]: T↦0,ε, C₂. | covariant in A through `AlgHom.mapValue`; agrees |
| `coefficientSheaf` (72), §5.0 | same; values `AddCommGrpCat.{u+1}` | lift applied to values before sheafification; α₂ over 𝔽₂[t] has H⁰=0 | agrees |
| `flatCohomology` (83), §5.0 | plus `HasExt.{w}` on the sheaf category, `n : ℕ` | n=0: Hom(ℤ[h_A],F)=F(A)=G(A). Trivial G: 0 in all degrees. `opOp` then `(…).op` gives covariance in A | agrees |
| `flatCohomology_henselian_invariance` (97), §5.2 | `I : Ideal R`, `[HenselianRing R I]`, `G`, `n` | n=0: both implications vacuous. I=0: identity. I=⊤: 1∈Jac forces R=0, groups 0. (ℤ₂,2), μ₂: n=1 is (ℤ/2)²→0, onto, not injective; n=2 is 0→0. (𝔽_p[[t]],t), α_p: n=1 is 𝔽_p[[t]]/𝔽_p[[t]]^p→0 | CS24 lines 3190–3194; no Noetherian or finiteness binder, as in the README |
| `IsHenselianNonunitalSubring` (114), §5.0 | `B : Type u`, `CommRing B`, `B' : NonUnitalSubring B` | ⊥: y=r=0, value 1^N·0+0=0. pℤ_p: holds. ⊤⊂ℤ: x=1 needs 2(1+y)=1. ⊤⊂B: x=−1 gives 0=1, only B=0. 3ℤ_(3): N=1, a₀=−3, a₁=0 gives T²−T−3, discriminant 13. Sum over `Fin (N+1)` gives a₀…a_N | equals SP 09XI (5) (cache lines 1380–1383), which includes Jacobson containment; BC22 line 217 |
| `flatCohomology_algebraization` (125), §5.3 | `UniformSpace B`, `IsUniformAddGroup B`, `IsTopologicalRing B`, `HasExt`, `B'`, three hypotheses, `2 ≤ n` | Discrete B: B′=⊥, J=⊥, B̂=B, identity. Coarse topology of a henselian (A,I): J=I, B̂=A/I, statement is §5.2 for n≥2. 𝔽_p{t}: H²(μ_p) is 0→0; n=1 would be countable→uncountable. (ℤ_(3),3ℤ_(3)): excluded by the root clause; Br(ℤ_(3))[3]≠0=H²(𝔽₃,μ₃) | CS24 lines 3209–3212; the basis consists of ideals of B′, as in BC22 lines 458–460 |

Note (not a finding): `hB'_open` follows from `hB'_basis` with U the whole ring (B′ is a union of
cosets of an open J); it mirrors the source's wording and changes nothing.

### README targets

| Target | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| Conventions, V−1 | ℤ/p, μ_p over 𝔽_p | ℤ/p: V=1, fibre of 0 has H⁰=H¹=𝔽_p=ℤ/p, Hom(Gal,ℤ/p). μ_p: V=0, fibre of −1 is 0=μ_p(𝔽_p), 𝔽_p^×/p | CS24 lines 1495–1499; agrees with PrismaticCohomologyPartIII §6.0 and PurityForFlatCohomology §2.1 Checks |
| §0.1 definition and covers | id; k×k; ℚ/ℤ; ℤ[1/2] with ℤ_(2) | ℚ misses all closed points; D(2)∪{(0),(2)}=Spec ℤ | CS24 lines 1538–1546 |
| §0.1 stages | 𝔽_p[t,t⁻¹][x,y]/(x,y)²; ℤ→ℚ→ℚ[X]; ℤ→𝔽_p; A=0 | rank 3, socle dimension 2, a retract of a syntomic algebra would have cotangent amplitude [−1,0]; empty fibre at t=0; ℚ[X]=colim ℤ[1/n][X]; Tor₁^ℤ(𝔽_p,𝔽_p)=𝔽_p | holds; criterion is `ind_iff_exists` |
| §1.1 | k over k⊕k[1]; 0 over k and over 0; ℤ/4→𝔽₂ | π₁A⊗k=k≠0; 0 flat, faithful only over 0; Tor₁=𝔽₂ | CS24 lines 2200–2205 |
| §1.2 | (ℤ,ℤ_p,𝔽_p); (k,k,k[1]) | 𝔽_p in degree 0 both sides; k in degree 1 both sides | CS24 lines 2205–2214 |
| §1.3 | ℤ/4→𝔽₂, M=𝔽₂; ℤ→ℚ, M=ℤ/2 | reduction has all Tor_i=𝔽₂, not discrete; 0 after tensoring, nonzero before | CS24 lines 2216–2218 |
| §1.4 | ℤ/4; k⊕k[1] over k; A=k⊕k[1]→k; k×k | flat over discrete is discrete; π₁B′=π₀B′≠0 for faithfully flat B→B′; π₁A⊗k=k≠0=π₁k | CS24 lines 2241–2254, 2279–2296; restriction to flat objects is continuous and cocontinuous |
| §1.5 | I=0; I=(1); ordinary A; B with henselian π₀ | A; 0; ordinary henselization; Map_A(A_i,B)=Hom(π₀A_i,π₀B) for étale A_i, so the mapping space is contractible | CS24 lines 3088–3089, 2256–2270 |
| §1.6 | constant tower; τ≤n(k⊕k[1]); A=0 | RΓ(A,G) both sides; H^(−1)(G_a)=k; 0 | CS24 lines 2345–2352 |
| §2.1 | G_a(k⊕k[1]); 𝔾_m(discrete A); base change to S | π₀=π₁=k; A^×, discrete; B⊗_R S underived since B is flat | CS24 lines 2149–2158 |
| §2.2, §2.3 | G_a; 𝔾_m; μ_p/𝔽_p; μ_p/ℤ; p-power order | R; R·dlog; [𝔽_p→0 𝔽_p]; [ℤ→p ℤ], h=id is a null-homotopy of p; id∈H⁰RHom(C,C) dies in the localization, so p^k·id=0 | CS24 lines 2159–2170 |
| §2.4 | 𝔾_m, k[ε]→k; μ_p, 𝔽_p[ε]→𝔽_p; M=0 | fibre 1+εk; μ_p(𝔽_p[ε])=1+ε𝔽_p, μ_p(𝔽_p)=1, π₀ target Hom(H^(−1)C,𝔽_p)=𝔽_p not hit; equivalence | CS24 lines 2171–2192 |
| §3.1 | k algebraically closed; R=0; ℤ_(p), I=(p) | k itself; 0; henselized step faithfully flat over R, not over R₁ | CS24 lines 2408–2418; see S03 |
| §3.2 | ℤ→ℤ_p; a=1; a=0 | ℤ_p∩ℤ[1/p]=ℤ, ℤ_p+ℤ[1/p]=ℚ_p; A=A′×_(A′)A; A⊕A[1]≃A′⊕A′[1] forces A≃A′ | CS24 lines 2422–2431 |
| §3.3 | ℤ, p; ℤ/p², p; a=1 | π₁=0; π₁(A/^Lp^n)=A[p^n], transition is multiplication by p, two steps give 0, lim¹=0, π₀=ℤ/p²; 0 | CS24 lines 2433–2443 |
| §3.4 statement and route | A=A′; 𝔽_p→𝔽_p[t^(1/p^∞)]/(t), a=1; a=0; A=𝔽_p[x^(1/p^∞)]×𝔽_p, a=(x,0) | K=0; K∋t^(1/p), all quotients 0; K=0; A[a]=A[a²]=0×𝔽_p. Steps: a^n x=0⇒(ax)^n=0⇒ax=0; φ(a^nA)=a^(pn)A so Â is perfect; A′/a^n→(A′)^perf/a^n injective because the composite to A/a^n is an isomorphism | CS24 lines 2591–2607 |
| §4.1 | ℤ_p; 𝔽_p⊕𝔽_p[1], I=0; ℤ, (p) | henselian; henselian; not complete and p∉Jac | CS24 lines 2974–2980 with 2960–2966 (complete for every a∈I) |
| §4.2 | ℤ_p, μ_p; ℂ[[t]], μ_n; I=0; route for (ℤ_p,μ_p) | Pic=Br=0, H²=0 both sides, H¹=ℤ/p; 0, 0; identity; R′=ℤ_p^p, Br(ℤ_p)^p=0. Four-lemma: H¹(Q) onto, H²(H)_tors onto, H²(Q) injective give H²(G) onto | CS24 lines 2982–2994; BC22 lines 306–316 |
| §4.3, §4.4, §4.5 | a=1; empty tuple; ℤ_p, μ_p; ℤ/p² | A=0; constant system; lim (ℤ/p^n)^×/p=ℤ/p; A/^Lp has π₁=𝔽_p | CS24 lines 3000–3006, 3081–3085, 3138–3141; see S04 |
| §4.6 | ℤ_p, μ_p, p odd; I=0 | ℤ/p→0 onto; μ_p(ℤ/p^n)={1+cp^(n−1)}, transitions 0, lim¹=0 | CS24 lines 3162–3180 |
| §4.7 | 𝔽_p{t} and 𝔽_p[[t]] | (1+th₁(t^p))/(1+th₂(t^p))=u(t^p): exponents ≡0 give u=1, ≡1 give h₁=h₂; source countable | CS24 lines 3181–3186 |
| §5.0 | α_p/𝔽_p[t]; μ_p/ℤ_p, p odd and p=2; trivial G; four subrings | 𝔽_p[t]/𝔽_p[t]^p∋t; ℤ/p; (ℤ/2)² on −1, 5; 0; as in the Lean table | agrees |
| §5.1 | I=0; (ℤ_(p)^h,p), F(C)=C; constant F | identity; inclusion into ℤ_p; identity. Supplier `popescu_colimit_of_geometricallyRegular` asks Noetherian source and target and flatness: Â is Noetherian and flat by `AdicCompletion.flat_of_isNoetherian` | BC22 lines 253–257 |
| §5.2 | as in the Lean table; (ℤ_(p)^h)^×/p | u is a p-th power in ℤ_(p)^h iff in ℤ_p (the root is algebraic), 1+p is not, so ℤ/p | CS24 lines 3190–3205 |
| §5.3 | as in the Lean table | coarse topology is a ring topology: (a+I)(b+I)⊂ab+I | CS24 lines 3209–3221 |
| §5.4 | R=𝔽_p, μ_p; R=0 | t is a nonzerodivisor on R{t}; B̂=R((t)); Br[p]=ℤ/p both sides; both rings 0 | CS24 lines 3217–3218 |
| §5.5 | ℤ_(p)^h→ℤ_p; I=0; I=(1) | ℤ/p→ℤ/p; π₀A≃π₀A⊗^L_A A′ gives A′ flat with the same π₀ (§1.3), so A≃A′, U empty; zero ring | CS24 lines 3223–3228 |
| §5.6 | ℤ_(p)^h→ℤ_p, U=D(p) and U=Spec R; I=0 | ℤ/p→ℤ/p; 0→0; n=1 gives R≃R′ | CS24 lines 3239–3244 |
| §6.1 | M=A; M=A[1] over 𝔽_p; M=0 | discrete; reduction not flat over a discrete ring; 0 | CS24 lines 3261–3263 |
| §6.2 | I=(1); empty tuple; split cover; (t) and (t²) | 0 both sides; fpqc hyperdescent; contracted Čech object; same support, different Koszul quotients | CS24 lines 3288–3296; see S01 |
| Worked examples | ℤ/p²→𝔽_p; ℤ→ℤ_p | 𝔽_p⊗^L_(ℤ/p²)𝔽_p has every Tor_i=𝔽_p, condition fails; flat with equal reductions, holds | agrees with PurityForFlatCohomology §3.5 |

## Not verifiable

- That `Ext` in `Sheaf (CommAlgCat.fppfTopology R) AddCommGrpCat.{u+1}` computes classical fppf
  cohomology independently of the universe of the coefficients: asserted in §5.0 through the
  slice-site comparison and the ordinary-algebra clause of `gap:animated-flat-cohomology`; standard,
  not checked in Lean.
- Elaboration: no Lean was run (read-only pass); the worker's six elaborated signatures were used.
- Printed page numbers of BG80 Proposition 2.2.1 and R70 Lemma 6.2.2: both statements were found
  (BG80 line 746, R70 line 978 under the running head of p.51); the OCR does not allow the BG80 page
  to be confirmed.
- The suppliers' future proofs of the 20 declared gaps: by the brief, not raised.
- Ownership against open pull requests was checked through the roadmap index and `roadmaps grep`
  only for the objects listed under Ownership; other heads were not read in full.

## Source issues

- **Gap** in CS24 at proof of Theorem 5.7.2, printed page 81: the source says that, A being perfect, replacing A′ by its perfection keeps faithful flatness modulo the Koszul reduction, with no argument and A→A′ not flat; it should reduce each Frobenius copy to A′/^L(a^(1/p^n)), a base change of the flat reduction; affects the proof.
- **Misprint** in CS24 at §5.2.1, printed page 53: the source says the graded homotopy of the tensor product equals a single unspecified degree of the other module tensored with π₀; it should have π_* on both sides; affects a stated result.
- **Misprint** in CS24 at Example 5.6.7, printed page 75: the source says the two-case statement is for degrees at least two; it should be introduced for degrees at least one, as its first case says; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7d09c8df6132f724460d511f7d792ed9de1cf82f", "job": "RT-SchemeAndStackFoundationsPartII~2a", "model": "fable", "worker": "chris-x13"} -->
