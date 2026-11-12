<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13142#issuecomment-6791932709 -->
Red team round 1 pass b (claude) of f848ec1

Verdict: needs_changes

1. **F01** (P2) gap:classical-affine-group-adapter asks for what the pinned Tau Ceti already provides

   **Location.** `packages/SchemeAndStackFoundationsPartII/README.md:101` and the same `needs` text in
   `design/plan.json` (`gaps`, slug `classical-affine-group-adapter`): "…including smoothness of
   Res_(X/S)𝔾_m for finite locally free X/S."

   **Claim.** SchemeAndStackFoundations must still supply smoothness of the Weil restriction of 𝔾_m along a
   finite locally free map of ordinary affine schemes.

   **Witness.** Pinned Tau Ceti, `TauCeti/RingTheory/WeilRestriction/Smooth.lean:60`:
   `TauCeti.Algebra.WeilRestriction.instSmooth` (for `[Module.Finite A B] [Module.Projective A B]`,
   `[Smooth B C]`); `TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/WeilRestriction/Basic.lean:65`
   `multiplicativeGroupPoints : … ≃* (B ⊗[A] T)ˣ`, with smoothness and cocommutativity of `Res_{B/A}𝔾_m`
   recorded in that file's header (lines 22–26).

   **Repair.** In the README paragraph and in the plan's `needs`, end the sentence at "…with the smooth
   affine commutative group-scheme category." and delete the clause "including smoothness of
   Res_(X/S)𝔾_m for finite locally free X/S". Add two rows to the "From Tau Ceti" table:

   | Supplier declaration | Pinned file and line | Input consumed |
   | --- | --- | --- |
   | `TauCeti.Algebra.WeilRestriction.instSmooth` | TauCeti/RingTheory/WeilRestriction/Smooth.lean:60 | Weil restriction along a finite projective algebra preserves smoothness; gives smoothness of Res_(B/A)𝔾_m in §4.2 and in the Bégueri contract. |
   | `TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints` | TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/WeilRestriction/Basic.lean:65 | Points of Res_(B/A)𝔾_m over T are the units of B⊗_A T, naturally in T. |

   Tested on the refuting instance: for B finite projective over A the pinned instance gives
   `Smooth A (WeilRestriction A B B[T;T⁻¹])`, which is the clause removed. What the gap keeps (the
   adapter from Hopf-algebra point functors and Cartier duality to group schemes) is not at the pin.

2. **F02** (P2) stability of pro-ppf maps is attributed to a supplier section that does not state it

   **Location.** `README.md:192` "with the stability of ind-flat maps under base change and
   composition from PerfectoidQuotientsPartII §Q7.3"; also `README.md:3` "Ind-flat ring maps … enter
   from their earlier owners" and the *Needs* line `README.md:194`.

   **Claim.** PerfectoidQuotientsPartII §Q7.3 supplies stability under base change and composition of
   filtered colimits of flat finitely presented algebras (the stages of pro-ppf maps, §0.1).

   **Witness.** `packages/PerfectoidQuotientsPartII/README.md:885–890`: §Q7.3 proves stability for
   ind-fppf and ind-syntomic maps only. ℤ→ℤ[1/2] (this README's own non-cover, line 198) is not
   ind-fppf; a flat finitely presented stage that is neither faithfully flat nor syntomic, such as
   𝔽_p[t]→𝔽_p[t,t⁻¹][x,y]/(x²,xy,y²), is in neither class. CS24 line 1544 refers to its §2.3.3,
   which (CS24 lines 980–988) also states only the two classes.

   **Repair.** State it here. Add to §0.1, before the API list:
   "Prove the following statement. An A-algebra A′ is a filtered colimit of flat finitely presented
   A-algebras if and only if every A-algebra map B→A′ with B finitely presented factors through a flat
   finitely presented A-algebra (SP Tag 07C3, Lemma 10.127.4). This class of ring maps is stable under
   base change, composition and filtered colimits; hence pro-ppf maps of schemes are stable under base
   change and composition. (CS24 §2.3.3 with footnote 13, p.24, and §4.1.5, p.37.)"
   Replace the sentence of the proof route by: "Base change is clear from the criterion; for
   composition, factor a test map through a flat finitely presented algebra over the middle ring,
   present the middle ring as a filtered colimit and descend the factorization and its flatness to a
   finite stage (the route of PerfectoidQuotientsPartII §Q7.3 without the faithfulness clause)."
   In line 3 replace "Ind-flat ring maps" by "Ind-fppf and ind-syntomic ring maps". Tested: the three
   maps of the witness are filtered colimits of flat finitely presented algebras (constant systems), so
   the new statement covers them.

3. **F03** (P2) the converse "affine pro-fppf singleton cover ⇒ ind-fppf" needs a local-to-global step no owner supplies

   **Location.** `README.md:181`: "conversely an affine pro-fppf singleton cover is ind-fppf, by the
   characterization of PerfectoidQuotientsPartII §Q7.3."

   **Claim.** If Spec A′→Spec A is faithfully flat and pro-ppf in the sense of §0.1 (Zariski-locally on
   source and target a filtered colimit of flat finitely presented algebras), then A→A′ is ind-fppf.

   **Witness.** §Q7.3 (`packages/PerfectoidQuotientsPartII/README.md:887–888`) assumes A′ itself is a
   filtered colimit of flat finitely presented A-algebras. §0.1 (and CS24 lines 1538–1542) only gives
   such presentations of the localizations A′_(g_i) of an open cover; glueing them to a presentation of
   A′ is not in §Q7.3, in CS24 §4.1.5 or in this roadmap.

   **Repair.** Replace the clause by: "conversely, if A→A′ is faithfully flat and A′ is itself a
   filtered colimit of flat finitely presented A-algebras, then A→A′ is ind-fppf (PerfectoidQuotientsPartII
   §Q7.3)." Tested: this is §Q7.3's characterization word for word; the instance ℤ→ℤ[1/2]×ℤ_(2)
   (faithfully flat, each factor a filtered colimit of flat finitely presented ℤ-algebras, finite
   products commute with filtered colimits) satisfies it.

4. **F04** (P3) the *Needs* line of §4.2 does not match its proof route

   **Location.** `README.md:504–506` (§4.2 H² invariance over a henselian pair).

   **Claim.** The route needs only the listed inputs, including `fppf_kummer_sequence`.

   **Witness.** The route (and CS24 lines 2989–2994) passes to R′=Γ(G*,O) and uses that (R′,IR′) is
   henselian (R→R′ finite), that H²_fppf(R,Res_(R′/R)𝔾_m)=H²_et(R′,𝔾_m), and Weil restriction. None is
   listed; the Kummer sequence is not used. SchemeAndStackFoundations has them:
   `henselian_pair_permanence` (§0.14, README line 1248), `smoothGroup_fppf_etale_comparison` (§2.10,
   line 3782), `finite_pushforward_exact` (§2.11, line 3813).

   **Repair.** In the *Needs* line of §4.2 (and the Layer 4 Dependencies list) replace
   "SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`" by "SchemeAndStackFoundations §0.14
   `henselian_pair_permanence`; SchemeAndStackFoundations §2.10 `smoothGroup_fppf_etale_comparison`;
   SchemeAndStackFoundations §2.11 `finite_pushforward_exact`; ReductiveGroupsPartII §RG2.0a;
   `TauCeti.Algebra.WeilRestriction.instSmooth`". (`fppf_kummer_sequence` stays in §4.7, which uses it.)

5. **F05** (P3) page locator of CS24 Corollary 5.6.12

   **Location.** `README.md:669`: "(CS24, Corollary 5.6.12, pp.76–77)".

   **Witness.** CS24 line 3216 is the page marker of p.77; the statement begins at CS24 line 3223 and
   its proof ends at line 3235, before the marker of p.78 (line 3255).

   **Repair.** "(CS24, Corollary 5.6.12, p.77)".

6. **F06** (P3) undefined and process vocabulary

   **Location.** `README.md:300`: "For ordinary A this is precisely the parent’s ordinary
   henselization." `README.md:167`: "Layer 5 fixes the ordinary flat-cohomology carrier of the
   acceptance test".

   **Witness.** "The parent" is defined nowhere in the README; "acceptance test" is a word of the
   production process, not of the mathematics.

   **Repair.** Line 300: "For ordinary A this is the henselization of the pair (A,I) of
   SchemeAndStackFoundations §0.12, on `TauCeti.Henselization.algebra`." Line 167: "Layer 5 fixes
   flat cohomology of ordinary algebras on the pinned carriers, then proves …".

7. **F07** (P3) *Needs* lines of Layer 3 and §4.7 cite inputs their routes do not use

   **Location.** `README.md:440` (§3.2), `:454` (§3.3), `:468` (§3.4), `:576` (§4.7).

   **Witness.** §3.2: the route (CS24 lines 2425–2431) uses localization and the derived quotient of
   modules only; `gap:animated-flat-cohomology` is not used. §3.3: the route is the Milnor sequence
   (CS24 lines 2435–2443); §3.2 is not used. §3.4: CS24 lines 2596–2607 use bounded a^∞-torsion of a
   perfect ring and the agreement of ordinary with derived a-completion; `gap:perfection-covers`
   (perfection of covers, CS24 Lemma 4.1.6) is a different statement. §4.7: the route uses the Kummer
   sequence and a cardinality count; §4.6 is not used.

   **Repair.** §3.2 *Needs:* "EnhancedDerivedSheaves E5:animation.1 `animatedAlgebras`;
   DerivedModuleAlgebra §§1.2–1.4." §3.3 *Needs:* "DerivedModuleAlgebra §1.6; EnhancedDerivedSheaves
   E2:towers.1." §3.4 *Needs:* "EnhancedDerivedSheaves E5:animation.2." §4.7 *Needs:*
   "SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; SchemeAndStackFoundations §0.12." Update
   the Layer 3 and Layer 4 Dependencies lists to match. `gap:perfection-covers` remains used by §6.2
   and `gap:animated-flat-cohomology` by §§1.4 and 5.0, so no gap loses its consumer.

8. **F08** (P3) the slice-site identification is credited to a Mathlib definition that does not contain it

   **Location.** `README.md:60`, row `CategoryTheory.Sheaf.cohomologyPresheafFunctor`: "`Ext` from the
   free sheaf on a representable is cohomology of the slice site."

   **Witness.** Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:70 only defines the `Ext`
   bifunctor. The comparison with the slice site is Tau Ceti's
   `CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH`
   (TauCeti/CategoryTheory/Sites/SheafCohomology/Over.lean:141), which SchemeAndStackFoundations §2.5
   (its README line 3503) cites.

   **Repair.** Change the Mathlib row's last cell to "The model for §5.0: the `Ext` groups from the
   free abelian sheaf on a representable into a sheaf." and add to the Tau Ceti table the row
   "`CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH` | TauCeti/CategoryTheory/Sites/SheafCohomology/Over.lean:141
   | Hⁿ(U,F)≅Hⁿ of the slice site over U; identifies `flatCohomology G n` at A with cohomology of the
   big affine fppf site of A (§5.0)." Add the name to the *Needs* line of §5.0.

Three P2 findings (R01–R03) and five P3 findings (R04–R08). No P1: no statement of the README or of
`Suggested.lean` was refuted by an instance, and no supplier citation is unresolved.

## Verified sound

**Counts.** Declarations of `Suggested.lean` read: 6 of 6. README sections read: all 31 target
sections (§0.1, §§1.1–1.6, §§2.1–2.4, §§3.1–3.4, §§4.1–4.7, §§5.0–5.6, §§6.1–6.2), the Conventions,
the 19 gap contracts and every *Needs* line. Source locators verified against the cached texts: 43
(CS24 31, BC22 6, SP 3 in the cached volume, Y18 3); the R70, BG80, DJ and C19 items were located by
page marker only. Check bullets read and evaluated: 107 of 107, none found false; the values of
those that fix a convention or a boundary case are in the table below. Pinned
declarations checked by file and line: 26 of 26 rows of the two tables. Sibling citations resolved:
SchemeAndStackFoundations (9 names, 17 sections, main), EnhancedDerivedSheaves (8 ids, 5 names,
main), DerivedModuleAlgebra (15 sections, main), ReductiveGroupsPartII RG2.0a (main),
PrismaticCohomologyPartIII §6.0 (3 names, open head), PurityForFlatCohomology (9 sections, open
head), HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison` (open head),
DerivedDeRhamCohomology §1.22 `DerivedDeRham.completionExchanges` (open head), PerfectoidQuotients
§§0.1, 0.4–0.6 (open head), ArcTopologyAndDescent §§11.2, 11.5, 12.7 (open head),
PerfectoidQuotientsPartII §§Q7.1–Q7.3 (board package; the `roadmaps resolve` lead is a board
package, not a missing roadmap). All exist with the hypotheses the README states.

**Dependency check.** Output: `depcheck: 237 roadmaps, 2147 edges, 0 problem(s)`. No UPWARD, CYCLE
or moved line. PurityForFlatCohomology (open head lines 196–209, 3466–3470) and
PerfectoidQuotientsPartII (line 1672) name this roadmap only as a consumer; no cycle.

**Gaps.** The 19 README contracts and the 19 `gaps` of `design/plan.json` have the same slugs and
suppliers; none has supplier `none`. `gap:henselized-formal-fibres` is not already provided:
SchemeAndStackFoundations §0.21 has the completion of a local G-ring and finite-type algebras, not
SP 0AH2/0AH3. Only R01 asks for something provided.

**Suggested.lean.** Compared the six elaborated types of `scratch/signatures.md` with the README
(no Lean was run in this pass, which is read-only): no binder lost; `[HenselianRing R I]`,
`[IsUniformAddGroup B]`, `[IsTopologicalRing B]` and the three hypotheses on B′ are in the theorem
signatures. Headlines: §5.2 and §5.3 stated; §4.5 and §6.2 named in the docstring as not statable
(no animated rings at the pins). The four definitions have real bodies and each is used by a
headline; none follows from one library lemma; no padding. No `set_option`, `lemma`, `#check`,
sorry'd data. Own names in the README and in the Lean agree (6 of 6). No name of
`Suggested.lean` is declared by another roadmap (`roadmaps grep` for `flatCohomology`,
`pointsAddFunctor`, `coefficientSheaf`, `IsHenselianNonunitalSubring`: no other owner). Ownership
against the open heads and main was checked by object for the pro-fppf site, henselian nonunital
rings and CS24 §§5.6–5.7 results: no second owner.

**Adversarial table.**

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, V−1 fibre | ℤ/p and μ_p over 𝔽_p | ℤ/p: V=id, V−1=0, H⁰=H¹=𝔽_p (=ℤ/p, Hom(Gal,ℤ/p)); μ_p: V=0, V−1=−1, H⁰=H¹=0 (=μ_p(𝔽_p), 𝔽_p^×/p) | agrees with PrismaticCohomologyPartIII §6.0 Checks |
| `IsHenselianNonunitalSubring` | 0; pℤ_p; ⊤⊂ℤ; ⊤⊂B; 3ℤ_(3) | 0: y=0, r=0. ⊤: x=−1 gives 0=1, so only B=0. ℤ: 2(1+y)=1 unsolvable. 3ℤ_(3): N=1, a₀=−3, a₁=0, T²−T−3, disc 13 | matches SP 09XI and BC22 line 217; quasi-inverse-only model excluded |
| `flatCohomology_henselian_invariance` | I=0; I=⊤; R=0; (ℤ_(p)^h,p), μ_p; (𝔽_p[[t]],t), α_p; p=2 | I=0 identity; I=⊤ forces R=0, all groups 0; μ_p: H¹=ℤ/p→0 onto, H²=0=0; α_p: H¹=𝔽_p[[t]]/𝔽_p[[t]]^p→0, H²=0; p=2: H¹(ℤ₂,μ₂)=(ℤ/2)²→𝔽₂^×/2=0 | surjective n≥1, bijective n≥2; n=1 injectivity correctly not claimed; CS24 lines 3190–3194 |
| `flatCohomology_algebraization` | discrete B; (A,I) with coarse topology; 𝔽_p{t}; (ℤ_(3),3ℤ_(3)) | discrete: B′=0, J=0, B̂=B; coarse: J=I open, B̂=A/I, statement = §5.2 for n≥2; 𝔽_p{t}: H²(μ_p)=0=0, H¹ countable vs uncountable; ℤ_(3): Br[3]∋ class (1/3 at 2, −1/3 at 5), H²(𝔽₃,μ₃)=0, excluded by henselianity | hypothesis = CS24 lines 3209–3212, BC22 lines 458–460 |
| `flatCohomology`, degree 0 and variance | n=0; trivial group | Ext⁰(ℤ[h_A],F)=F(A)=G(A); Hopf algebra R gives one point, all Hⁿ=0 | covariant in A through `opOp` and `(…).op`; matches §5.0 |
| §0.1 covers | id; k×k; Spec ℚ→Spec ℤ; ℤ[1/2] with ℤ_(2) | ℚ misses every closed point; D(2)∪{(0),(2)}=Spec ℤ | Checks true; see R02, R03 |
| §1.1–1.3 flatness | k over k⊕k[1]; zero module; ℤ/4→𝔽₂; A=k, B=k⊕k[1] | π₁A⊗k=k≠0; Tor₁=𝔽₂; B⊗M flat over B forces π₁M=0 | CS24 lines 2200–2218 |
| §1.6 towers | constant tower; A=0; τ≤nA for k⊕k[1] | both sides RΓ(A,G); 0; constant from n=1 | CS24 lines 2345–2348 |
| §2.2–2.4 cotangent | G_a, 𝔾_m, μ_p over 𝔽_p and ℤ | R; R; [𝔽_p→0 𝔽_p]; [ℤ→p ℤ]; fibre 1+ε𝔽_p=Hom(C,M)=𝔽_p; π₀ target Hom(C,M[1])=𝔽_p not hit from μ_p(𝔽_p)=1 | CS24 lines 2171–2192 |
| §2.3 p-power annihilator | rank unbounded? R=0 | rank locally constant on quasi-compact Spec R, finitely many values; End(C)[1/p]=0 gives p^k·id=0 | sound |
| §3.1 | I⊄Jac(R) | (ℤ_(p)[x],(p)): henselization would not be faithfully flat without I⊂Jac(R); with it R′^h/𝔪R′^h=R′/𝔪R′≠0 | hypothesis present, CS24 line 2409 |
| §3.2–3.4 | a=0, a=1; ℤ→ℤ_p; ℤ/p² | a=0: A⊕A[1]≃A′⊕A′[1]; ℤ_p∩ℤ[1/p]=ℤ; π₁ tower ×p on ℤ/p², ML, lim¹=0 | CS24 lines 2422–2436, 2591–2595 |
| §4.2, §4.6, §4.7 | ℤ_p, μ_p, p odd and p=2; ℂ[[t]]; 𝔽_p{t} | ℤ_p^×/p=ℤ/p; p=2: (ℤ/2)² on −1, 5; μ_p(ℤ/p^n) transitions 0, lim¹=0; (1+th₁)/(1+th₂)=u∈𝔽_p[[t^p]] forces u=1, h₁=h₂ | CS24 lines 2982–2983, 3162–3180, 3181–3186 |
| §4.3–4.5, §5.5–5.6, §6.1–6.2 | a=1; empty tuple; I=(0),(1); M=A[1] over 𝔽_p | zero ring; constant system; supports full / zero; A[1] not flat over discrete A | hypotheses equal CS24 lines 3000–3006, 3081–3085, 3138–3141, 3223–3228, 3239–3244, 3261–3263, 3288–3296 |
| §5.1 | I=0; constant functor; injectivity argument | Â=colim S_j, each S_j→A/I lifts to a retraction, so x=y in F(S_j) gives x=y in F(A) | BC22 lines 253–257 |
| §5.4 | R=𝔽_p, μ_p | t nonzerodivisor on R{t}; completion R((t)); Br[p]=ℤ/p both sides | CS24 lines 3217–3218 |

## Not verifiable

- SP Tags 0954 (Lemma 47.8.2) and 0A6R (Lemma 47.9.1) and §47.10: the cached SP text is the
  volume containing Tags 09XI, 0AH2, 0AH3 only; the volume with Chapter 47 was not in the cache
  under a name this pass could open, so the tag–lemma pairing was not checked.
- Printed versus scan page numbers of BG80 Proposition 2.2.1 (found at the cache's page marker 26)
  and R70 Lemma 6.2.2: the statements were located, the printed pages not confirmed.
- That `Ext` in `Sheaf (CommAlgCat.fppfTopology R) AddCommGrpCat.{u+1}` computes fppf cohomology
  independently of the universe bound of the site (the README asserts it in §5.0 through the
  ordinary-algebra comparison of `gap:animated-flat-cohomology`): standard, not checked in Lean.
- Elaboration of `Suggested.lean`: not run (read-only pass); the worker's elaborated signatures
  were used.
- §3.4: the source's proof (CS24 lines 2596–2607) uses that bounded a^∞-torsion makes ordinary and
  derived a-completion agree, for an arbitrary element a. The README's written route avoids
  completion; whether it closes without that input was not settled. No supplier section read here
  states the input for a general a (DerivedModuleAlgebra §1.5 is for weakly regular sequences, §1.8
  for p-power torsion).
- The contents of the suppliers' proofs of the declared gaps: by the brief, not raised.

## Source issues

- **Gap** in CS24 at §4.1.5, printed p.37: the source says pro-ppf maps are stable under base change and composition by its §2.3.3; that section states stability only for ind-fppf and ind-syntomic maps; it should state it for filtered colimits of flat finitely presented algebras; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f848ec18eb66b7a48795ce6e1d6cdcded229ae5f", "job": "RT-SchemeAndStackFoundationsPartII~1b", "model": "fable", "worker": "chris-x8"} -->
