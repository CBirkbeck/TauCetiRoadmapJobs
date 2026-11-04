# Repair report: PadicLocalLanglandsForGL2QpPartII, design round 3

This round settles the eight findings of the round-2 review (F01–F08). Edited files: `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md`, `packages/PadicLocalLanglandsForGL2QpPartII/design/plan.json` and `packages/PadicLocalLanglandsForGL2QpPartII/sources.toml`.

Supplier texts were read as follows:

- the open heads given by `roadmaps show`: HilbertModularVarietiesAndShimuraCurves at #1005, CompletedCohomologyAndLocalGlobalCompatibility at #1270, the parent PadicLocalLanglandsForGL2Qp at #1312, GL2AutomorphicRepresentationsAndTransfer at #931, EndoscopicTransferAndUnitaryTraceComparison at #999 and LocallyAnalyticDistributions at #854;
- StableReduction on main.

Sources are quoted as `<source id> line N`. Line numbers in other roadmaps are those of the `roadmaps show` output, as in the review. One new source was read: TEI90, the Numdam copy of the article.

## F01 (P1) — applied differently

**What changed.** §3.1 now proves both global inputs of the parent's §6.9, with named owners:

- CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9 and 6.4;
- HilbertModularVarietiesAndShimuraCurves §§R18.5.21, R18.5.16 and R18.4.25;
- GL2AutomorphicRepresentationsAndTransfer R16.1.8 and R17.3.

§7.3 cites §R18.5.21 at level 1, §R18.4.24a and §R18.3.29(c), and states Teitelbaum's model here. Exact supplier contracts gain a new HilbertModularVarietiesAndShimuraCurves block, and R17.3.12 is dropped.

**Where this differs from the suggested repair, with evidence.**

- **The first cover.** §R18.5.16 is the comparison over ℚ at *maximal* p-level (HilbertModularVarietiesAndShimuraCurves README at #1005, lines 2261–2275). The uniformisation of the first cover is §R18.5.21, which is stated "for every n ≥ 1" (line 2382); §7.3 now cites it at n = 1, with §R18.5.16 only for the conventions over ℚ.
- **Teitelbaum's model has no owner.**
  - §R18.5.21 says it does not assert semistability of higher-level integral covers (line 2382).
  - LocallyAnalyticDistributions §0.CR.6.6 takes the semistable models as hypotheses (#854, lines 618–646).
  - `roadmaps grep` for semistable models of Drinfeld covers or Teitelbaum's model returns no match on main or in any open pull request.

  The model is therefore stated in §7.3 (TEI90 Theorem 5 line 177, Corollary 6 line 232, lines 251–259 and Theorem 8 line 298), with two new Checks.
- **Saito's input is two theorems.** The identification with M(π) needs, besides §R18.4.24a (Hyodo–Kato cohomology equals D_st), local–global compatibility at p. That is §R18.3.29(c), now cited.
- **R17.3.12 is not kept, even in §3.3.**
  - CompletedCohomologyAndLocalGlobalCompatibility §6.4 is stated for π "with trivial central character on a fixed uniformiser up to twist" (#1270, line 2164). This covers §3.3's ζ with ζ(p) = 1.
  - R17.3.12 gives no residual irreducibility, which §4.9 needs.
  - Its central-character adjustment twists the type by η∘det (GL2AutomorphicRepresentationsAndTransfer #931, line 1757; CDN20 footnote 21, line 1770), which moves the sector.

  §3.3 now uses §6.4 and removes the unramified twist through R16.1.8, since ξ(p)² is the value at p of the finite-order central character of f.
- **Repairing the pattern.** The parent's §6.9 also takes "the automorphic and uniformization data of §4" as explicit hypotheses, both for the de Rham comparison and for injectivity (parent #1312, §6.9, global-map paragraph). So the README's claim "unconditional by §3.1" (Layer 7 introduction) was false. §3.1(b) now proves DLB17 Théorème 4.1 (line 804), using the same owners together with gap:drinfeld-components and §R18.4.25.
- **CDN20 alternative route.** §3.3 offered the Lubin–Tate route of CDN20 Théorème 0.4 "either route may be used". That route needs CDN20 Théorème 0.6, which none of this roadmap's suppliers states, so §3.3 now says that the route above does not use it.
- **Other places updated:** Scope and ownership, Exact supplier contracts, §3.3 route and *Needs*, the Dependencies of Layers 3 and 7.
- **New hypothesis in §7.3.** §7.3 now assumes ρ trivial on 1+ϖ_DO_D, as DLB17 lines 2741–2742 require, and records that the ρ-parts of the first cover equal those of Σ_1.

## F02 (P1) — applied

**What changed.** A new §2.4 "Weight change" states COLMEZ19POIDS Théorème 0.6 (lines 215–236) and Théorème 0.8 (lines 262–271) for every supercuspidal M: the sheaves Δ⊠_{x^kω}ℙ¹, the representations Π(M,k) with their exact sequences and algebraic vectors, the operator ∂ and the twisted actions. It has three Checks. §7.2 now consumes §2.4 and states its preimage claim precisely. §2.3 is corrected to Π(M,−1)⊗det.

**Evidence and choices.**

- `roadmaps grep 'changement de poids|weight change|Π\(M, ?[−-]?k\)|\(a ?[−-] ?c∂\)\^k'` finds only Serre-weight changes, so nothing owns this material.
- **Placement.** The section is placed at the end of Layer 2 rather than right after §2.2, so that §2.3 and its consumers keep their numbers; §2.4 does not depend on §2.3.
- **Scope of the statement.** It includes the second exact sequence of Théorème 0.6(iii) (lines 231–233), because §7.2's preimage statement needs it.
- **§2.3 correction.** Théorème 0.6(iii) (line 234) gives the quotient Π(M,−1)⊗x, not Π(M,−1). With ω = x⁻¹ (trivial central character), Π(M,−1) has central character x⁻², while Π^an/π has trivial central character.

## F03 (P2) — applied

**What changed.** gap:halfplane-module-continuity and gap:two-sided-resolvents are withdrawn:

- from the README: their two contract lines, §3.3 *Needs* and the Layer 3 Dependencies;
- from plan.json: `gaps`, `nodes[].gaps`, `coverage` and `upstreamNotes`.

E1 and E7 now say that the parent already carries the needed form. E7 cites COLMEZ19POIDS Théorème 0.8(ii) (line 265).

**Evidence.** Parent #1312, §6.9 states "the unique continuous `O(Ω)`-module structure … construct `∂` and its resolvents".

## F04 (P2) — applied

**What changed.**

- E9 is deleted from the README and from plan.json `sourceIssues`, and gap:smooth-kernel-twisted-coefficients is withdrawn everywhere.
- §3.2 now writes t⁻¹N⁺/N⁺ ≅ L_∞(−1)⊗M_dR(π) and cites DLB17 lines 2449 and 2469–2472.
- E10–E20 are renumbered E9–E19 in both files.

**Evidence.** DLB17 line 2449 (α_dif with L_∞(−1)), lines 2464–2466 (the twisted coefficients in the top row) and lines 2469–2472 (untwisting through Π(π,2)).

## F05 (P3) — applied differently

**What changed.** The false Check in §7.6 is replaced. Ǧ acts on O(Σ_r) through the finite group Ǧ/(p^ℤ(1+p^rO_D)), so only finitely many types occur. The fixed ρ-sector is used because the coadmissibility comparison (DLB17 Théorème 10.1, line 2192) concerns a supercuspidal ρ; the one-dimensional sectors lie outside it (E8).

**Why it differs.** The suggested text asserts that the trivial and one-dimensional sectors are coadmissible "by §4.2 and gap:drinfeld-components". That needs O(Ω) to be coadmissible, which means passing from dO(Ω) to O(Ω), an extension of dO(Ω) by the constants. No cited item states this, and §4.2 is stated over C. DLB17 lines 2194–2196 assert that O(Σ_n) is coadmissible only through Théorème 10.1, which is exactly the gap E8. So the new Check does not assert it.

## F06 (P3) — applied differently

**What changed.**

- §4.1 uses the affinoid Stein covering τ⁻¹(B_i). It is Stein because every level is finite étale over Σ₀ = Ω⊔Ω (EndoscopicTransferAndUnitaryTraceComparison §§12.4 and 12.5; DLB17 Proposition 3.1, lines 641–651).
- Conventions now build the odd ϖ_D-levels as quotients of the even levels of §12.4.
- §12.21 is dropped from §§4.1, 4.9 and 5.1, from Scope, from the supplier contracts and from the Dependencies.

**Why it differs.** The review keeps §12.21 for "the p-primary Mittag–Leffler input of the limit step in §4.9". At fixed level no such input is used. H⁰(M^p_{n,C}, ℤ/p^k) is finite (CDN23 line 2642), so lim_k has no lim¹ term (CDN23 line 2633). §12.21 is CDN23 Lemma 3.10 and Corollary 3.11, which concern the infinite-level perfectoid cover. CDN23 uses them only at lines 1692 and 2127, in the mod p finiteness argument, which is gap:modp-drinfeld-finite-length. §4.9 now says this. §12.4 indexes levels by powers of ϖ_E, so it only reaches even ϖ_D-levels (#999, line 4342); the odd-level construction is added in Conventions.

## F07 (P3) — applied

**What changed.** The product clause of §6.3 now reads: E is an A-algebra, finite as an A-module, acting A-linearly on V and W and commuting with G_ℚ_p, and the specialisations are absolutely irreducible over (κ(x)⊗_A E)[G_ℚ_p]. The proof goes through generic absolute irreducibility and the density theorem. A new Check covers E = A over L[T]: finite over A but infinite-dimensional over L, the situation of E_{B,M} in §6.5.

**Note.** Traces determine an absolutely irreducible module in any characteristic, by the density theorem. The suggested reason ("since F has characteristic zero") matters only for semisimple modules that are not irreducible, as in CDN23 footnote 32, lines 2861–2866.

## F08 (P3) — applied

**What changed.** In the §7.2 Check, π′⊗M_dR⊗Sym¹ becomes π′⊗M*_dR⊗Sym¹.

**Repairing the pattern.** §7.2's statement now names its normalisation. In the setting of the parent's §6.9(iii), H¹_dR ≅ π′⊗M*_dR and the preimages are of lines ℒ^⊥⊗(π′⊗Sym^k); in the setting of §3.3(ii) they are of lines ℒ⊗(π′⊗Sym^k). §§3.3, 4.7 and 7.3 were checked and already agree.

## Checks run

**Dependency gate** (verbatim). There is no UPWARD and no CYCLE line:

    candidate: PadicLocalLanglandsForGL2QpPartII is not in the merge order yet; checked as if placed after CompletedCohomologyAndLocalGlobalCompatibility (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 639 edges, 0 problem(s)

**`roadmaps resolve`** on the README finds no cross-roadmap citation and no Lean name that is found nowhere.

**plan.json** was resynchronised from the README by a parser.

- On the previous head, the parser reproduces every node exactly, except two stale locators in §§1.4 and 1.7. These are now synced to the README: DLB17 lines 1531–1534 and 1576–1586.
- The plan has 51 nodes (new: `GR.2/weight-change`), 5 gaps and 19 source issues.
- Every internal prerequisite is an earlier node.
- `coverage` and `neededBy` are recomputed.

**Suggested.lean.** The roadmap is at the design stage and has no Lean file (plan `leanStatus`), so the `#check` binder comparison does not apply.

**Gate failures listed by the brief:** none.

**Ownership** was checked with `roadmaps grep` over main and all 367 open pull-request heads, for Teitelbaum's model, semistable models of the Drinfeld covers and Colmez's weight change. No owner was found for any of them, so this roadmap owns them. The sibling checkouts were not given with paths; the grep tool covered their heads.

**Sources.** TEI90 was fetched from Numdam (open repository, certified) and recorded in `sources.toml` with its DOI. `cited_for` was updated for DLB17 (§§2.3, 4.1, 4.9 and the supplier contracts) and for COLMEZ19POIDS (§2.4 and Source corrections). No text is missing, so there is no `needs-references.toml`. The review text contained no instructions beyond its claims.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: odd levels | n = 1, m = 1 | deg(M_2 → M_0) = \|(O_D/p)^×\| = p⁴ − p² = p²(p²−1); M_2 → M_1 has degree \|(1+ϖ_DO_D)/(1+pO_D)\| = p²; M_1 → M_0 has degree p²−1, Teitelbaum's degree | sound | added |
| §2.3 twist | k = 1, ζ = 1 | det Δ_{1,ℒ} = x·det Δ = x\|x\| gives ω = x⁻¹; Π(M,−1) has central character x⁻²; after ⊗det, x⁻²·x² = 1 | "≅ Π(M,−1)" was off by det | corrected |
| §2.4(iii) central character | aI₂ | (a−0·∂)^k = a^k gives a^kω(a); (ii) gives x^{−k}ω·x^{2k} = x^kω | consistent; exponent −k would contradict | Check |
| §2.4 at k = 0, 1, 2 | Casimir | (k²−1)/2 = −1/2, 0, 3/2; §1.5 gives ((a−b)²−1)/2 at weights (0,k) | consistent; k = 0 is not the sheaf of §4.2a | Check |
| §2.4 at k = 1 | dim M_dR = 2 | Π(M,1)^alg = 2 copies of π; quotient by ℒ⊗π leaves 1 copy | matches V(π) | Check |
| §2.4 at (a,c) = (0,0) | — | a−c∂ = 0 is not invertible | excluded by hypothesis | — |
| §3.1(a) twist | ω_f of finite order | ξ(p)² = ω_{f,p}(p) is a root of unity, so ξ has finite order and R16.1.8 applies; for ξ(p) = 1+p no finite-order global character has p-component ξ⁻¹ | sound | Check |
| §3.1(b) degeneration | ρ = 1; dim ρ ≥ 2 | ρ = 1: the constants give H⁰_dR ≠ 0; dim ρ ≥ 2: H⁰ and H² have zero ρ-part (DLB17 lines 975–979) | needs dim ρ ≥ 2 | Check |
| §3.1(b) dimension | π_∞ = D₂ | H¹(gl₂, ℝ^×SO(2); D₂) has dimension 2, types (1,0) and (0,1); Ω¹ alone gives 1 | 2 | Check |
| §3.3 global input | p = 7, ζ = ω | ω(7) = 1, so §6.4's hypothesis holds; ξ(7)² = ω_f(7) is a root of unity | sound | route |
| §4.1 Stein covering | n = 0, 1 | n = 0: τ⁻¹(B_i) ⊂ Ω⊔Ω is affinoid; n = 1: the preimage of an affinoid under a finite étale map is affinoid | sound | — |
| §4.9 lim¹ | limit over k | finitely many components, so H⁰(·, ℤ/p^k) is finite, hence Mittag–Leffler and lim¹ = 0 | §12.21 not needed | text |
| §6.3 product clause | E = A = L[T]; A a DVR | E = A reduces to the main case; over a DVR, ρ and ρ⊗χ (χ ≡ 1) remain a counterexample | sound | Check |
| §7.2 normalisation | k = 0, 1 | k = 0: the preimage of ℒ^⊥⊗π′ is (Π^an_ℒ)′ (parent §6.9(iii)); k = 1: the cokernel is π′⊗M*_dR⊗Sym¹, 2·2 = 4 copies | sound | Check fixed |
| §7.2 central characters | aI₂ | O(−k): a^k; middle term: a^{−(k+2)}·a^{2k+2} = a^k; H¹_dR⊗Sym^k: a^k | consistent | — |
| §7.3 model | p odd; p = 2 | over ℤ_{p²}: y^{p²−1} = 0, not reduced; over K: y′^{p²−1} + (z−z^p)^{p−1} = ∏_{ζ^{p−1}=−1}(y′^{p+1} − ζ(z−z^p)), ζ ∈ μ_{2(p−1)} ⊂ ℚ_{p²}; p = 2: one factor y′³ = −(z−z²); ∂_z(z−z^p) ≡ 1 mod p | p−1 smooth components, as in TEI90 Corollary 6 | Check |
| §7.3 hypothesis on ρ | ρ nontrivial on 1+ϖ_DO_D | the normal subgroup acts trivially on the cover, so Hom_Ǧ(ρ, ·) = 0 | the statement would be empty | hypothesis and Check |
| §7.3 levels | Σ_1 against the first cover | level of Σ_1 is 1+pO_D = 1+ϖ_D²O_D; degree p² over the first cover; ρ-parts agree | sound | statement |
| §7.6 Check | Ǧ on O(Σ_r) | acts through a finite group of order 2·p^{4r−2}(p²−1) | finitely many types | Check replaced |
| Source corrections | 20 entries become 19 | every in-text "source correction Ek" checked by grep against its entry after renumbering | sound | renumbered |

## For the maintainer

- **New supplier.** HilbertModularVarietiesAndShimuraCurves (order position 114) is now a supplier. It precedes the insertion point after CompletedCohomologyAndLocalGlobalCompatibility (position 142), and the gate reports no problem.
- **Suppliers no longer used.** GL2AutomorphicRepresentationsAndTransfer R17.3.12 and EndoscopicTransferAndUnitaryTraceComparison §12.21 are no longer consumed.
- **Renamed and new items.** No roadmap cites this one.
  - The node `GR.3/global-nonzero-map` keeps its id; its title is now "Discharge of the global hypotheses".
  - The new node is `GR.2/weight-change`.
  - The source corrections are now E1–E19: the old E9 is deleted and the old E10–E20 are E9–E19. An errata register built from the old numbering must be updated.
- **Remaining supplier gap.** gap:fixed-radius-divisibility, on the parent's §6.9, is the only gap left on the parent.
- **For the next review (not edited here, outside the findings).** §§4.1 and 4.7 use at level n both the de Rham identification of §3.3(ii) and the Hyodo–Kato-compatible one of CDN20 Théorème 0.4. Their agreement is the level-n analogue of §7.3; CDN20 Proposition 2.9 (line 952) takes it from DLB17 Théorème 1.4. §7.3 states it only for the first cover.
