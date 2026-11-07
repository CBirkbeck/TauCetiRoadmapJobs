# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at e1ee1ed)

**Verdict:** needs changes

Incremental re-review of the 6 README lines changed since 95bce15 (lines 15, 102 and 588), of everything that cites them, and of the board plan the repair round also changed. R01 still stands. The repair round introduced R02 to R04.

## R01 (P2) — The four GeometricSatakeAndFusion contracts still request theorems that GeometricSatakeAndFusionPartII owns

Re-raised: H01

**Location.** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md` line 15: "the four contracts on that roadmap below … GeometricSatakeAndFusionPartII §§0.6, 2.4, 3.1, 4.10 and 4.11 states the same theorems and the good-embedding definition as its own targets, and none of them is planned here". The location also covers the four "What GeometricSatakeAndFusion must provide" paragraphs at lines 102–108 and every use of their slugs (lines 606, 646, 648, 824, 940, 942, 958, 962, 979, 1048, 1187, 1211, 1571, 1573).

**Claim.** Each of KPZ26 Theorems 3.2.15, 3.3.25, 4.1.6 and 4.4.3 still has two owners: GeometricSatakeAndFusion, which these contracts ask to extend its GS0 with them, and GeometricSatakeAndFusionPartII, which states them as targets. Line 15 now says so itself, but naming the second owner does not resolve the duplication.

**Witness.** `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md` at 3ef4ea3, line 7, owns "normal scheme representability; tangent spaces spanned by formal curves" and the Hodge-induced closed maps. Its §2.4 (line 476), §3.1 (571), §4.10 (844) and §4.11 (854) state Theorems 3.3.25, 3.2.15, 4.1.6 and 4.4.3.

**Why the reason in H01 does not settle it.** H01 is right that the repair proposed last round fails the push gate at the current merge order. Rerunning the dependency check without `--movable` on b259844's README gives exactly `UPWARD: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (#127) -> GeometricSatakeAndFusionPartII (#205) at README lines [102, 610, 652, 828, 946, 966]`.

That UPWARD line is about where this roadmap sits in the merge order, not about who owns the theorems. With `--movable`, the same README gives `moved: … from #127 to #205, right after its last supplier GeometricSatakeAndFusionPartII` and `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`. The move is also clean in both directions:
- GeometricSatakeAndFusionPartII cites neither this roadmap nor its base.
- No roadmap on main or at an open head cites this roadmap. The only citation anywhere is the board design of ShimuraVarietiesPartII, at merge-order position 353.

So the gate's UPWARD is a false positive relative to the movable rule the review lane applies. The real obstacle is the roadmap's position in the merge order, and only a human can change that.

The design kept at this head does not remove the second owner:
- If GeometricSatakeAndFusion accepts the contracts, it plans its own continuation's targets a second time.
- If it answers them with its Part II, this roadmap at merge-order position 128 consumes a supplier at position 206.

**Repair.**
1. The operator places this roadmap right after GeometricSatakeAndFusionPartII in the merge order.
2. Reinstate the b259844 text:
   - a `### From TauCetiRoadmap.GeometricSatakeAndFusionPartII` subsection consuming §§0.6, 2.4, 3.1, 4.10 and 4.11;
   - those section citations in place of the four slugs at the lines listed above, and in the Layer 2, 3 and 4 Dependencies;
   - §2.1 citing §0.6 for goodness.

Tested on the refuting instance: b259844's README passes the `--movable` check with 0 problems, and it uses exactly the 11 slugs that `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json` now lists. In that text, also apply R03's locator fix to the §3.1 paragraph, which repeats "of GeometricSatakeAndFusion §0.37".

If the operator instead keeps this roadmap at position 128, GeometricSatakeAndFusion must be the single owner. GeometricSatakeAndFusionPartII (#1836) must then replace its §§0.6, 2.4, 3.1, 4.10 and 4.11 by citations of GeometricSatakeAndFusion. That is a change to that pull request, and R02 and R04 must then be repaired here.

## R02 (P2) — The four contracts are no longer declared where the intake reads them

**Location.** README lines 102, 104, 106 and 108 (`gap:scheme-local-model-representative`, `gap:scheme-local-model-hodge-immersion`, `gap:schubert-curve-spanned-tangents`, `gap:local-model-curve-spanned-tangents`), used in the *Needs:* lines listed under R01. Also `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json`, `gaps`.

**Claim.** The repair round removed the four slugs from the plan, in the board commit that recorded the repair. The final README commit then restored the four contracts in the README. A README contract counts as declared only when the plan's `gaps` has the same slug. So nothing will announce these four contracts on GeometricSatakeAndFusion's job, while §§2.1, 2.3, 3.11, 3.13, 3.14, 4.11, 4.13 and 6.2 consume them.

This is P2 rather than P1 because the README does name the supplier.

**Witness.** The board plan now lists 11 slugs, the same 11 as this review's brief. At package submission it listed 15, including these four, with section "GS0, Bounded admissible affine flag loci". The README at e1ee1ed uses 15.

**Repair.** Under R01's repair the four slugs leave the README, and the plan already matches. If the operator keeps this roadmap at position 128, restore the four `gaps` entries in the plan:
- use the `needs` text of README lines 102–108 as it now reads, which adds "independently of the auxiliary choices up to unique isomorphism" to the first;
- set supplier GeometricSatakeAndFusion;
- set the section per R03, GS4 §4.17 "Integral local models and admissible special fibres", not GS0 §0.37.

Tested: after either repair, the slugs in the README and in the plan are the same 11 or the same 15.

## R03 (P3) — GeometricSatakeAndFusion §0.37 is cited for the v-sheaf local model, which is its §4.17

**Location.** README line 102 (added in this diff): "represents the intrinsic integral v-sheaf local model of §0.37". Two unchanged sentences cite the same section for the same object: line 15, "§0.37 … owns the integral Grassmannian, component labels and v-sheaf local models", and line 100, "§0.37 … supplies the integral v-sheaf local model, admissible special fibre and functoriality".

**Claim.** At GeometricSatakeAndFusion's head, §0.37 defines only the reduced perfect admissible locus `A_{𝓚,μ}` inside the Witt affine flag variety. The integral v-sheaf local model is its §4.17 and its functoriality is §4.18.

**Witness.** `TauCetiRoadmap/GeometricSatakeAndFusion/README.md` at 140b5a7: §0.37 (line 973) defines `A_{𝓚,μ}`, admissible Schubert strata with reduced perfect structure. §4.17 (line 2130) builds `𝓜_{𝓚,μ}` as a v-closure, and §4.18 (line 2152) is its functoriality. GeometricSatakeAndFusionPartII line 9 agrees.

**Repair.** Make these three replacements:
- Line 102: replace "of §0.37" by "of GS4 §4.17, 'Integral local models and admissible special fibres' (the model of 𝒢°)".
- Line 100: cite §0.37 for the admissible locus only, §4.17 for the v-sheaf local model and the identification of its reduced special fibre, and §4.18 for functoriality.
- Line 15: replace "v-sheaf local models" by "admissible loci", and add §4.17 and §4.18 for the v-sheaf local models.

Tested: the μ=0 Check of GeometricSatakeAndFusion §0.37 gives the base point of the perfect flag variety, a k-scheme, while §4.17 gives the unit point over the reflex integers. Only §4.17 is the integral v-sheaf that Theorem 3.2.15 compares with `Mloc` (KPZ26 lines 895–897). §4.17 is part of the same roadmap, so the order of supply does not change.

## R04 (P3) — Line 15 says the good-embedding definition is not planned here, but §2.1 defines it

**Location.** Line 15: "states the same theorems and the good-embedding definition as its own targets, and none of them is planned here". Line 588, §2.1 (rewritten in this diff): "An integral Hodge embedding is a closed group-scheme embedding 𝒢↪GL(Λ) extending the Hodge representation … it is good when the induced map … to Gr(d,Λ) over O_E is a closed immersion … (KPZ26, Definition 3.4.4".

**Claim.** §2.1 now states the full definition with its own locator, so the scope sentence is false for the definition.

**Witness.** GeometricSatakeAndFusionPartII §0.6, at its line 309, states the same notion with the same locator (KPZ Definition 3.4.4, line 1234). Searching main and the open heads for "integral Hodge embedding" finds definitions only in these two roadmaps.

**Repair.**
- Under R01's repair: §2.1 takes the b259844 wording "the notion of GeometricSatakeAndFusionPartII §0.6". The clause in line 15 is then true.
- Otherwise: delete "and the good-embedding definition" from that clause, and add to line 15 that §2.1 states KPZ26 Definition 3.4.4 here. This roadmap is earlier in the order than GeometricSatakeAndFusionPartII §0.6, which then cites it.

Tested by reading both passages after each edit: neither leaves a sentence saying the definition is not stated here.

## Previous findings

- R01 — not repaired. At this head line 15 reads: "the four contracts on that roadmap below … GeometricSatakeAndFusionPartII … states the same theorems … as its own targets, and none of them is planned here". The duplication is now stated rather than resolved. The repair round also introduced R02 to R04.

## Verified sound

**Gate and build.** I reran the push gate on e1ee1ed. Every counter is 0 and the gate prints `OK`: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder and source-material.

`lake env lean` on `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean` exits 0 with no output. The file is unchanged since 95bce15, and its namespace is empty, so no `sorry` warning is produced and there are no declarations to `#check`. The diff outside the folder against origin/main is empty. The folder holds exactly README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`).

**Dependency check.** Output at this head with `--movable`:

```
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The two b259844 results quoted under R01 come from the same tool, run on a scratch copy of that README.

**Changed passages, checked against the source.**
- KPZ26 Theorem 3.2.15, line 895, p.20: `Mloc` satisfies the Scholze–Weinstein conjecture and is independent of all choices up to unique isomorphism (lines 896–897). The new clause in line 102 is accurate.
- §3.4.2 is at line 1213, p.28.
- KPZ26 line 707: an integral Hodge embedding is a closed immersion of group schemes 𝒢↪GL(Λ) whose generic fibre is a Hodge embedding.
- Definition 3.4.4, line 1234, p.28: ρ is good when `ρ_*: Mloc → Gr(d,Λ)_{O_E}` is a closed immersion.
- §2.1 restates both correctly, including that goodness is a condition on the local-model map.
- KPZ26 Theorem 3.3.25, lines 1125–1132, p.26: after replacing ρ by ρ^⊕m, the target is written Gr(d,Λ), as line 104 has it.

**Citations resolved this round (10).**
- GeometricSatakeAndFusion at 140b5a7: §0.31 (line 848), §0.37 (line 973), §4.17 (line 2130) and §4.18 (line 2152).
- GeometricSatakeAndFusionPartII at 3ef4ea3: scope line 7, §0.6 (line 309, Definition 3.4.4), §2.4 (line 476, Theorem 3.3.25 and Remark 3.3.26, p>2, ρ^⊕m with m≥1, (𝒢′)°=𝒢°), §3.1 (line 571, Theorem 3.2.15), §4.10 (line 844, Theorem 4.1.6) and §4.11 (line 854, Theorem 4.4.3).

What line 15 says GeometricSatakeAndFusionPartII states is accurate, section by section. The 28 citations resolved last round, the 8 Mathlib and 1 Tau Ceti declarations opened last round, and the headline analysis are carried forward: README.md is the only file that changed.

**Ownership against open pull requests.** I used the roadmaps tool to search the open heads and main for "good integral Hodge" and "integral Hodge embedding". Only GeometricSatakeAndFusionPartII and this roadmap define the notion (R04). The remaining hits are consumers. The overlap tool reports no other pull request changing this roadmap and no dropped id.

**Seeded sample, where it touches the changed passages.** §§3.10, 4.6, 4.7 and 4.13 depend on §2.1's goodness or on gap:scheme-local-model-representative. I reread each at its locator:
- §3.10: KPZ26 Lemma 5.3.7(b), line 2412, p.55, and Remark 5.3.8, line 2439, p.56. Lemma 5.3.7(b) is the n=2 case. The n-copy extension goes through §§3.4 and 3.8 by the intertwiner-centralizer argument written in the README.
- §4.6: KZ25 lines 1055–1063, p.24. A section of the trivial 𝒢̃-torsor that is constant mod a_E by (C) lifts to a GL section that is constant mod a_E.
- §4.7: Hoff23 Assumption 2.28, line 1195, p.25, and Remark 2.29, line 1198.
- §4.13: Hoff23 Lemma 2.35, lines 1338–1345, and Theorem 2.36, line 1346, p.28.

None of these depends on wording that changed. The other 11 sampled targets (0.3, 0.5, 1.5, 3.2, 3.16, 4.1, 4.14, 5.6, 5.7, 5.8, 5.13) neither lie in the changed passages nor cite them.

**Headline theorems.** `Suggested.lean` is unchanged. Its docstring names the missing carrier for each of the 21 headline groups: p-divisible groups, displays, parahoric local models, Breuil–Kisin modules and filtered tensor G-isocrystals are absent at both pins. So there is no padding to probe and no headline that is statable but absent.

**Adversarial table.** The first rows are the statements this diff changed, computed at this head. The rows marked "(r1)" are carried forward unchanged from the previous review of 95bce15 for statements this diff does not touch.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.1 integral Hodge embedding and goodness (line 588) | GL₂, Λ=ℤ_p², μ=μ₁; G_m→GL₂, z↦diag(z,1); empty cutting family | `Mloc_{GL₂,μ₁}`=P¹_{ℤ_p}, ρ_* the identity, closed, so good; generic dimension d(h−d)=1. Torus local model Spec ℤ_p maps to a section of the separated P¹, closed, so good. Empty family gives G̃=GL(Λ), good, consistent with the §2.10 Check | holds | none |
| §2.1 wrong model "good iff 𝒢↪GL(Λ) closed" | KPZ26 Remark 3.2.14, Theorem 3.3.25 | When p divides \|π₁(G^der)\| the Zariski closure M_{𝒢,μ} can be non-normal, so normal `Mloc` maps to it finitely and birationally but not isomorphically, although the group map is closed. Theorem 3.3.25 needs ρ^⊕m and a change of quasi-parahoric | excluded by "a condition on the local-model map" | none |
| gap:scheme-local-model-representative (line 102) | μ trivial; GL_n with μ_d | `Mloc`=Spec O_E against Spd O_E; Gr(d,n)_{O_E} against its ◇; choices fixed up to unique isomorphism (KPZ26 lines 896–897) | holds for the statement | R03 (locator) |
| "local model of §0.37" (line 102) | μ=0 Check of GeometricSatakeAndFusion §0.37 and §4.17 | §0.37 gives the base point of the perfect flag variety over k; §4.17 gives the unit point over the reflex integers. Only the latter is an integral v-sheaf | wrong section | R03 |
| Line 15, what GeometricSatakeAndFusionPartII states | its §§0.6, 2.4, 3.1, 4.10, 4.11 | KPZ Definition 3.4.4, Theorem 3.3.25 (p>2, ρ^⊕m, (𝒢′)°=𝒢°), Theorem 3.2.15, Theorem 4.1.6 (p∤\|π₁(G^der)\|, no Dᴴ), Theorem 4.4.3: 5 of 5 match | accurate | none |
| Line 15, "none of them is planned here" | §2.1 line 588 | §2.1 states Definition 3.4.4 with its own locator | false for the definition | R04 |
| Single owner of the four theorems | head; GeometricSatakeAndFusionPartII line 7 | 2 owners per theorem (contract on GeometricSatakeAndFusion, target of its Part II) | defect | R01 |
| Gap declaration (README against plan) | slug sets | README 15 distinct slugs, plan 11; the 4 missing are the GeometricSatakeAndFusion contracts | mismatch | R02 |
| Supply direction | head; b259844 README | head: 0 problems, no moved line. b259844 without `--movable`: 1 UPWARD (#127→#205); with `--movable`: moved #127→#205, 0 problems; citing roadmaps between: 0 | move is clean | R01 |
| §3.10 n≥1 (depends on §2.1) | G_m on ℤ₃, n=0,1,2 | n=0: GL(0)={1}, so 1 and −1 have the same image and the kernel is G_m, not closed; n=1: a↦a; n=2: a↦diag(a,a), injective; diag(a,b) commutes with the block swap iff a=b | holds | none |
| §4.6 empty tensors (depends on §2.1) | 𝒢=GL(Λ) | Ψ₀c⁻¹ lies in the GL torsor, so lifting is the ordinary first-order rigid lift | holds | none |
| §4.13 Check 3 | O_K[[T]] | T^m∈(T^n) iff m≥n; ∩(T^n)=0 | holds | none |
| (r1) §0.4 Check 3 | p=3, 𝔽₃[x,y]/(x³,y³) | second Witt coordinate of [x]+[y] is −x²y−xy²≠0; of [x+y] it is 0 | holds | none |
| (r1) §0.7 Check 3 | 𝔽₃[x]/(x⁴), 𝔽₃[x]/(x³) | 6γ₃(x)=0 but x³≠0; γ₂(x)=2x², γ₁γ₂=0=3γ₃ | holds | none |
| (r1) §0.6 Checks | d=0, d=h, 1∉I | M₁=IM; M₁=M; e₁↦e₂ leaves M₁ | holds | none |
| (r1) §0.10 Check 3 | S=W(k), rank 1, d=0 | j=p, and p⊗k=0 | holds | none |
| (r1) §§0.11, 0.13, 4.4 rank one | ℚ_p/ℤ_p, μ_{p∞} | (σ, ÎM, 0) and (pσ, M, 1); F=pσ | consistent | none |
| (r1) §1.1 tangent dimension | (h,d)=(1,0),(1,1),(2,1) | 0, 0, 1 | holds | none |
| (r1) §1.3 first order | Z=Vε | Ψ₀(1−εE₂₁)(1+εE₂₁)=Ψ₀ | holds | none |
| (r1) §1.4 generality | KP18 Lemma 3.1.17 | hypotheses identical | holds | none |
| (r1) §2.0 Checks 2, 3, 5 | diag(p,1); [[0,1],[p,0]]; unipotent u | J_b=(ℚ_p^×)²; J_b(ℚ_p)=D^×; [[2,−σ(a)],[0,1]] is not of the conjugate form | holds | none |
| (r1) §2.2 Check 3 | E against p at u↦π | O_Ke₁⊕0 against O_Ke₁⊕pO_Ke₂ | distinct | none |
| (r1) §2.5 Check 3 | [π]↦0 | φ(E([π]))↦p·unit | holds | none |
| (r1) §2.6 Check 2 | ℤ_p[[x]], π²=p | v_K(π/p)=−1 | holds | none |
| (r1) §2.7 Checks 2–3 | c=1+εE₂₁; p=3 torus | E₁₁+εE₂₁; 1/2≡2≠1 mod 3 | holds | none |
| (r1) §2.8 Check 2 | R=k[ε], GL₂ | pŴ(m_R)=0, [ε]²=0 | holds | none |
| (r1) §2.9 Check 2 | E₁₁, line K(e₁+te₂) | the image e₁ is not on the line | holds | none |
| (r1) §2.10 Check 3 | swap w | wE₁₁w⁻¹=E₂₂≠E₁₁ | holds | none |
| (r1) §3.14 Check 1 | (−1,3)_3 | Trd values −2, −2; reversed: 2, −2 | holds | none |
| (r1) §3.15 Checks 1–3 | D=K, m=1 | ψ((1,0),(0,1))=−1; dual of index −i; multipliers 1, 2 | holds | none |
| (r1) §3.16 Check 2 | L=ℚ_p(π), δ=2π | Γ-fixed parts ℤ_pe⊕p⁻¹ℤ_pf against ℤ_pe⊕ℤ_pf | holds | none |
| (r1) §3.17 Check 1 | diag(a,b) | similitude factor ab | holds | none |
| (r1) Layer 3 Example | xy=0 | curve derivatives e₁ or e₂ only, never e₁+e₂ | holds | none |
| (r1) §4.2 counterexample | H≅G_m×μ_{p−1} | diag(1,ζ) lies outside 𝒢°, with κ=0 | holds | none |
| (r1) §5.5 Check 2 | μ_{p∞} | θ(t)=0, so t is not a unit | holds | none |
| (r1) §5.10 Check 3 | F=(1+tE₂₁)diag(p,1) | N(0)=−E₂₁; h=Σt^{p^r}/p^r, (h)=(t) | holds | none |
| (r1) §5.17 Checks 4–5 | G_m, b=3 | t_H=t_N=1; with μ(z)=z, t_H=−1 | holds | none |
| (r1) Layer 5 Example | E(u)=u−p | −E(0)=p | holds | none |
| (r1) §6.0 Checks 1–2 | G_m, GL₂ | t_here^1=p, κ=1; dom(−μ)=(0,−1) | holds | none |
| (r1) §6.5 Check 2 | g, h unipotent | (gh)ᵗ=[[2,1],[1,1]]≠(hg)ᵗ | holds | none |
| (r1) Conventions line 36 | p=aπ_E² | O_E/(π_E²) against k | holds | none |
| (r1) p=2 scope | §§0.2, 0.5 against §§0.1, 0.13 | Lau14 has no odd-prime hypothesis; KPZ26 line 2081 assumes p>2 | consistent | none |

## Not verifiable

- RZ96, Proposition 1.21, used by §5.3. It is recorded as `uncertified` in the manifest and cited by locator through Kisin17, proof of Theorem 2.2.3, line 1455. I have not read it. This item is carried forward and §5.3 is untouched by the diff.

## Source issues

- **Misprint** in KPZ26 at Remark 5.3.8, p.56: the source says that part (b) applies when the embedding is "good at x"; it should be "very good at x", the hypothesis of Lemma 5.3.7(b), since goodness is not a pointwise condition; affects nothing.
