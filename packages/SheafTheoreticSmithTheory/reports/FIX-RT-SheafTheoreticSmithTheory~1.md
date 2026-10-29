# Repair report: sheaf-theoretic Smith theory, red-team round 1

Both reviews number their findings from F01; each section's first words say which review raised it (review a or review b). Where two findings concern the same text they are settled once, and each still has its own section below.

## F01 (P2) — applied

Review a: §7.3 "maps u_γ:γE→E satisfying the cocycle law" → isomorphisms u_γ with u₁ the action's unit isomorphism and u_γδ=u_γ∘γ(u_δ) after the composition isomorphism. API bullet updated to match. The trivial-group Check now records that (k,0) satisfies u₁=u₁∘u₁ but fails the unit law and invertibility; u₁=id is the only structure, so equivariantization recovers C.

## F02 (P2) — applied

Review a: §4.5 "For odd p good" → "For every prime p good …, including p=2 for type A" (MR18 Corollary 1.6, line 273, has no oddness). New Check: GL₂ at p=2 and 3. Same pattern repaired in §4.4 (equivariant realization moved into §4.5) and §5.3. Oddness stays in the norm, BC and normalization targets.

## F03 (P3) — applied differently

Review a: Settled with review b F05. Second §0.3 locator "Feng24 line 656" → "Feng24 line 900". The README sentence cites the parenthesized-subscript convention, at Feng24 lines 900–901 (§4.2, p.20). Lines 876–891, the range review a proposed, contain the start of §4.2 and the stratified Tate category, not the convention. The §3.2 anchor at line 656 is unchanged.

## F04 (P3) — applied

Review a: §7.6 Check that restated the theorem → at p=3, point object O², f=[[1,[β]],[0,1]] with [β] the Teichmüller lift of the F₂₇ witness: 2 fixed words, 2 free orbits whose terms are norms; F_T D(f)=I_k L D(f)=[[1,β+1],[0,1]], while reducing f gives β. The Check says it tests index zero only.

## F01 (P2) — applied

Review b: Verified: EtaleDualityAndPerverseSheaves §7.3 asserts no smoothness. Contract now says what §7.3 states. Smoothness now comes from ReductiveGroupsPartII §RG2.0a, *Edixhoven's tame fixed-point theorem*, applied with R′=R=F[[t]] and its closed fibre on invariant affine opens. Updated the §5.4 route, its *Needs* and the Layer 5 Dependencies.

## F02 (P2) — applied

Review b: §4.5 now states MR18 Theorem 1.1's hypotheses: Ĥ is a product of simply connected quasi-simple groups and GL_n's, with p very good on the quasi-simple factors (MR18 line 20). It adds the reductions (MR18 line 2751; JMW16 Lemma 3.6, line 415). The reviewer's test mislabels Ĥ; the new Check uses Ĥ=SL₂, p=2 (good, not very good).

## F03 (P2) — applied

Review b: Verified: LP3.0 states H^i(G,∇_λ⊗∇_μ)=k exactly for i=0, μ=−w₀λ; with Δ_λ=∇_{−w₀λ}* this is the Δ-to-∇ Hom/Ext computation. Contract records it as consumed. gap:finite-highest-weight-ideals keeps only the ideal categories (defined by composition factors), tiltings, resolutions and compatibilities. README and plan `needs` are identical.

## F04 (P2) — applied differently

Review b: "The étale transport theorem" had no referent. I added no meta-target "complex proofs hold étale-ly": §§4.4, 4.5, 4.7, 5.7 and 6.1–6.5 already state their étale versions, so it would duplicate them. Each of the seven phrases now names its own obligation: the étale parity route (JMW14 Proposition 2.34, §4.1, Proposition 4.10), Feng24 line 1007, and the adic gap.

## F05 (P3) — applied

Review b: Settled with review a F03: "Feng24, §4.2, p.20, Feng24 line 656" → "Feng24 line 900", exactly as proposed. Verified: line 900 is §4.2, p.20 (the page-21 marker is at line 904).

## F06 (P3) — applied

Review b: §0.6 "Tag 051E (Lemma 10.101.3), Stacks line 5207" → "Tag 051H (Lemma 10.101.3, in Algebra §10.101, Tag 051E), Stacks line 11356" (Algebra extraction). Tags 08G1 and 0DJJ now carry their own Cohomology-on-Sites lines 5207 and 5300. The References Stacks entry now also gives 051H at line 11356. Other Stacks anchors were checked: 11331, 8130 and 728 are correct.

## F07 (P3) — applied

Review b: `(hpA : (p : A) = 0)` deleted from both theorems. Both remain true: Nm(a+b)−Nm(a)−Nm(b) is a sum of transfers in any commutative ring, and p·b=Tr(b) for fixed b. Docstrings, Conventions and §§8.1–8.2 now say "commutative ring", with new Checks for A=ℤ and A=ℤ[i].

## F08 (P3) — applied

Review b: Verified: ReductiveGroups §10B (main) states finite free integral Weyl lattices and the perfect integral pairing. gap:integral-tilting-lifts split: the new gap:integral-highest-weight-orders covers the O-orders with §10B's lattices as standards/costandards, Hom/Ext, generators and complete Hom; integral-tilting-lifts keeps the lifting, base change, idempotents, detection and bijection. §§3.2, 3.3, 4.6 updated.

## F09 (P3) — applied

Review b: JMW16 lines 22–23 attribute Theorem 1.1 to Ringel and Donkin. Added manifest key Don93 (doi 10.1007/bf02571640), `uncertified` because the service reports it paywalled, cited by its locator, Theorem 1.1. §3.3 cites "Don93, Theorem 1.1, as recalled in JMW16 Theorem 1.1" and keeps JMW16; Don93 is also in References.

## Checks and exact outcomes

- **Elaboration.** `lake env lean packages/SheafTheoreticSmithTheory/Suggested.lean`, run from the content checkout, printed exactly two warnings, `57:8` and `69:8: declaration uses 'sorry'` (the two headlines). No errors and no `TauCeti.*` imports.
- **Signature check.** I put `#check @name` for all six declarations in one scratch file and elaborated it once. The three definitions and `transferIdeal` are unchanged. `algebra_tate_diagonal` and `tate_character_extension` lost only the `↑p = 0` binder, as intended; every other binder (`[Fact (Nat.Prime p)]`, `σ ^ p = 1`, `[CharP κ p] [PerfectRing κ p]`, `S ≤ fixedSubring σ`, norm/transfer membership, transfer-annihilation) is present. Each matches its §8.1/§8.2 statement, which now reads "commutative ring".
- **Dependency check.** `gate --depcheck … --movable` printed exactly `depcheck: 56 roadmaps, 649 edges, 0 problem(s)` with exit status 0. There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README returned no cross-roadmap citations and no Lean names found nowhere.
- **Hygiene.** No LaTeX delimiters, machine paths, `set_option`, `lemma`, or sorry'd data.
- **Gate failures.** None were listed for this round.

## Computed adversarial pass on every changed statement

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions / §8.1 `algebra_tate_diagonal` without hpA | A=ℤ, σ=id, p=2; A=ℤ[i], conjugation, p=2; A=ℚ, p=2; ℤ[x,y] swap, p=2; zero ring | Tr(1)=2∈ideal, δ(a)=a² mod 2=a mod 2; Tr(a+bi)=2a, δ=a²+b²≡a+b, kernel (1+i), and (a+bi)(c+di)↦(a+b)(c+d) checked; ideal=ℚ, quotient 0; δ(x+y)−δ(x)−δ(y)=x²+y²=Tr(x²); all values 0 | true; hpA removed |
| §8.2 `tate_character_extension` without hpA | A=ℤ, p=2, κ=F₂, χ mod 2; A=ℤ, p=3, κ=F₃; A=ℚ, κ=F₂ | χ(2a)=0, extension Fr⁻¹(a² mod 2)=a mod 2; χ(3a)=0, Fr⁻¹(a³ mod 3)=a mod 3; χ(Tr(1/2))=χ(1)=1≠0, so no χ exists (vacuous, consistent) | true |
| EtaleDuality §7.3 contract (no smoothness) | involution on A¹; x³+yz with (x,−y,−z) | Z={0} smooth; Z=Spec k[x]/(x³) nonreduced on a singular X | contract now matches the section |
| RG2.0a tame fixed points applied over F[[t]] | x↦ζx on A¹, p=3; inversion on G_m, p odd | (A¹_R)^Γ=Spec R[x]/((ζ−1)x)=Spec R, closed fibre {0}; fixed μ₂ has two points (refined into components in §5.4) | smooth; the wild case is excluded because p≠char F |
| §5.4 invariant affine neighbourhoods | y fixed in stratum S⊂U affine | D(Nm f)=∩σ^{-i}D(f) contains y, is invariant and affine | route valid |
| LP3.0 Hom/Ext consumption | SL₂, p=3; GL₂, λ=(1,0) | Hom(Δ(3),∇(3))=H⁰(∇(3)⊗∇(3))=k; Ext¹(Δ(3),∇(1))=0; Hom(Δ(1),∇(3))=0; Δ(1,0)=∇(0,−1)*=standard | consistent |
| gap:finite-highest-weight-ideals definition | SL₂, π={0,1,2,3} | π saturated (3−1, 2−0 ∈2ℕ); Δ(3) factors L(3),L(1)∈π but weights ±1,±3 (negative ones not dominant) | composition-factor definition needed and used |
| gap:integral-highest-weight-orders | SL₂ over O | Δ_O(3) rank 4, ∇_O(3) its dual rank 4, Hom=O | consistent with §3.3 Checks |
| §4.5 good-prime perversity | GL₂ p=2,3; Ĥ=SL₂ p=2; Ĥ=PGL₂ p=3; G₂ p=2,3; B₂ p=2 | k[1] on P¹ perverse, image dim 2; 2∣2 so not very good, reduce via D(GL₂)=SL₂; SL₂→PGL₂ quotient, 3∤2; G₂ coefficients 3,2 both bad; B₂: 2 bad | statement = MR18 Cor 1.6 |
| §4.5 MR18 Thm 1.1 hypotheses | GL₂ any p; SL₃, p=3 | no quasi-simple factor; 3∣3 not very good, reduce via GL₃ | hypotheses now explicit |
| §4.4 étale parity route | A¹ cell, P¹ | Iwahori orbit A¹ has H^{>0}=0; P¹: H⁰=Λ, H²=Λ(−1), H¹=0 | even, free |
| §7.3 unit law | Γ=1, (k,0) and (k,id); Γ=C₂ trivial action | 0=0∘0 but 0≠id, not invertible; u_σ²=u₁=id gives a k[C₂]-module | wrong model excluded |
| §7.6 new Check | p=3, O², f=[[1,[β]],[0,1]] | ([β]e₁+e₂)^⊗3=[β]³e₁₁₁+[β]²N(e₁₁₂)+[β]N(e₁₂₂)+e₂₂₂; Ĥ⁰ basis e₁₁₁,e₂₂₂; β³=β+1 so the matrix is [[1,β+1],[0,1]] on both sides; reduction of f is [[1,β],[0,1]] | discriminates the Frobenius power |
| Feng24 line 900; Stacks 11356, 5207, 5300 | the source extractions | line 900 has the parenthesized-subscript convention; 11356 is Lemma 10.101.3 (051H); 5207 is 08G1; 5300 is 0DJJ | locators correct |

## Sources, suppliers and ownership

- **Sources read.** All sources were read from the cached legal extractions: Feng24, MR18, JMW14, JMW16, MV07 and the Stacks chapters. Don93 is paywalled and recorded `uncertified`. No `needs-references.toml` was written.
- **Manifest edits.** The manifest edits are the new Don93 entry and wider locator strings for JMW14, JMW16, MR18 and MV07, matching the new README locators.
- **Sibling citations.** These were resolved at their current heads: ReductiveGroupsPartII §RG2.0a (*tame-fixed-points-of-weil-restriction*, README-only, so it is cited without a backticked Lean name), EtaleDualityAndPerverseSheaves §7.3, LanglandsParameterStacks §LP3.0, and ReductiveGroups §10B on main.
- **Ownership by object.** `roadmaps grep` for smooth fixed schemes of tame actions finds only ReductiveGroupsPartII, which is earlier in the merge order. No new object is owned here, and no declaration was added or renamed.

## For the maintainer

- **Changed Lean signatures.** `algebra_tate_diagonal` and `tate_character_extension` no longer take `hpA`. A consumer that passes that argument must drop it. The names are unchanged.
- **Supplier gaps.** LanglandsParameterStacks receives a narrowed gap:finite-highest-weight-ideals, a new gap:integral-highest-weight-orders, and a narrowed gap:integral-tilting-lifts. All three are in the plan's `gaps` list with the same text as the README.
- **ReductiveGroupsPartII.** It is now consumed for Edixhoven's tame fixed-point theorem. Its target is stated over a discrete valuation ring for Weil restrictions; this roadmap applies it with trivial Weil restriction over F[[t]] and takes the closed fibre.
- **Intake ledger.** The earlier intake-ledger finding on G1–G5 was not re-raised by either pass. Its reconciliation table in the previous report still describes ownership; its mention of "étale transport" refers to the per-target étale obligations now named in §§4.4–6.5.
- **Untrusted text.** No suspicious instructions were found in the reviews or sources.
