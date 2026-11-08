# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at b8240e2)

**Verdict:** needs changes

This is an incremental re-review of the 6 README lines changed since e1ee1ed (lines 15, 100 and 102), of everything that cites them, and of the board plan. R03 and R04 are repaired, and the repairs introduce no new problem. R01 and R02 are not repaired. The repair answers H01 and H02 left both unchanged, pending a merge-order move that only the operator can make.

Both findings are re-raised below so that the board hands that one decision to a human. Neither finding can be repaired inside this pull request until that decision is made.

## R01 (P2) — The four GeometricSatakeAndFusion contracts, and now Definition 3.4.4, still have a second owner in GeometricSatakeAndFusionPartII

Re-raised: H01

**Location.** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md` line 15: "GeometricSatakeAndFusionPartII §§2.4, 3.1, 4.10 and 4.11 states the same four theorems as its own targets, and none of them is planned here. … The notion of a good integral Hodge embedding, KPZ26 Definition 3.4.4, is stated here in §2.1".

The finding also covers:
- the four "What GeometricSatakeAndFusion must provide" paragraphs at lines 102–108;
- every use of their slugs, at lines 606, 646, 648, 940, 942, 958, 962, 979, 1048, 1187, 1211, 1571 and 1573;
- §2.1 at line 588.

**Claim.** Each of KPZ26 Theorems 3.2.15, 3.3.25, 4.1.6 and 4.4.3 still has two owners:
- GeometricSatakeAndFusion, which these contracts ask to extend itself;
- GeometricSatakeAndFusionPartII, its continuation, which states them as targets.

The R04 repair added a fifth object with the same split. §2.1 now states KPZ26 Definition 3.4.4 as this roadmap's own, and GeometricSatakeAndFusionPartII §0.6 states the same definition. Line 15 describes the duplication accurately, but it does not remove it.

**Witness.** `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md` at 3ef4ea3 (#1836):
- line 7 claims "normal scheme representability; tangent spaces spanned by formal curves";
- §0.6 (line 309) states Definition 3.4.4;
- §§2.4, 3.1, 4.10 and 4.11 (lines 476, 571, 844 and 854) state Theorems 3.3.25, 3.2.15, 4.1.6 and 4.4.3.

**Why the reason in H01 does not settle it.** H01 now agrees that the double ownership is real, and it names the fix: move this roadmap to right after GeometricSatakeAndFusionPartII, then restore the b259844 citations. I rechecked that at this head:
- Without `--movable`, the dependency check on b259844's README gives `UPWARD: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (#127) -> GeometricSatakeAndFusionPartII (#205) at README lines [102, 610, 652, 828, 946, 966]`.
- With `--movable` it gives `moved: … from #127 to #205, right after its last supplier GeometricSatakeAndFusionPartII` and `depcheck: 243 roadmaps, 2457 edges, 0 problem(s)`.
- Nothing on main or at an open head cites this roadmap: `roadmaps grep` finds only its own `Suggested.lean`.
- GeometricSatakeAndFusionPartII cites neither this roadmap nor FiniteFlatGroupsAndIntegralPadicHodgeTheory.

The reason is therefore right about who must act. It is wrong in concluding that the head may stand meanwhile: "until then the four contracts stay" leaves five objects with two owners each. A repair of this pull request cannot add the upward citation, because the push gate reports it as UPWARD. Another repair round would therefore only repeat H01, so the finding is re-raised for the operator.

**Repair.**
1. The operator moves FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII in `merge-order/ORDER.txt`, from line 128 to directly after GeometricSatakeAndFusionPartII (line 206).
2. The author then restores b259844's GeometricSatakeAndFusionPartII text:
   - the `### From TauCetiRoadmap.GeometricSatakeAndFusionPartII` subsection consuming §§0.6, 2.4, 3.1, 4.10 and 4.11;
   - those section citations in place of the four slugs, in the *Needs:* lines and the Layer Dependencies listed above;
   - in §2.1, "the notion of GeometricSatakeAndFusionPartII §0.6".
3. Keep this head's lines 15 and 100 for GeometricSatakeAndFusion §§0.31, 0.37, 4.17 and 4.18; b259844's own lines 15 and 100 still cite §0.37 for the v-sheaf model.
4. In b259844's §3.1 paragraph (its line 106), replace "of GeometricSatakeAndFusion §0.37" by "of GeometricSatakeAndFusion GS4 §4.17".

Tested: b259844's README passes the `--movable` check with 0 problems, and it uses exactly the 11 slugs of the plan.

If the operator keeps position 128 instead, the fix lies outside this pull request. GeometricSatakeAndFusionPartII (#1836) must then cite GeometricSatakeAndFusion for the four theorems and this roadmap's §2.1 for Definition 3.4.4. R02 must then be repaired here.

## R02 (P2) — The four GeometricSatakeAndFusion contracts are still absent from the plan's gaps

Re-raised: H02

**Location.**
- README lines 102, 104, 106 and 108, beginning "What GeometricSatakeAndFusion must provide (gap:scheme-local-model-representative)" and its three siblings.
- Their uses in §§2.1, 2.3, 3.11, 3.13, 3.14, 4.11, 4.13 and 6.2, at lines 606, 648, 942, 962, 979, 1187, 1211 and 1573.
- The Layer 3 Dependencies at line 1048.
- `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json`, `gaps`.

**Claim.** A README contract counts as declared only when the plan's `gaps` carries the same slug. The four GeometricSatakeAndFusion slugs are still missing from the plan. The intake will therefore announce none of them on GeometricSatakeAndFusion's job, although eight targets consume them.

**Witness.** The plan's `gaps` has 11 entries, from `perfect-residue-bt-realization` to `perfect-residue-period-torsor-comparison`, and none of the four. The plan last changed in the round-1 repair commit. The README at b8240e2 uses 15 distinct `gap:` slugs.

**Why the reason in H02 does not settle it.** H02 restates the mismatch without making a change. The reason that actually applies is H01's: the slugs leave the README after the move. That sequencing is sound. Restoring the four entries now would announce, on GeometricSatakeAndFusion's job, four theorems that its Part II plans, which would act on the very duplication R01 describes.

It still leaves the head with consumed contracts that no intake will ever announce. Its resolution is the same operator decision as R01, so it is re-raised together with R01.

**Repair.**
- After R01 steps 1–4, the four slugs leave the README. The plan already lists the remaining 11, so it matches.
- If the operator keeps position 128 instead, add four `gaps` entries:
  - supplier GeometricSatakeAndFusion;
  - the `needs` text of lines 102–108 as they now read;
  - section GS4 §4.17 for `scheme-local-model-representative`, which line 102 now cites. The package-time section "GS0, Bounded admissible affine flag loci" no longer matches that contract.

Tested: after either branch, the slug sets of the README and the plan coincide, at 11 or at 15.

## Previous findings

- R01 — not repaired: line 15 reads "GeometricSatakeAndFusionPartII §§2.4, 3.1, 4.10 and 4.11 states the same four theorems as its own targets, and none of them is planned here", and lines 102–108 keep the four contracts.
- R02 — not repaired: the plan's `gaps` still lists 11 slugs, while lines 102–108 keep `gap:scheme-local-model-representative`, `-hodge-immersion`, `gap:schubert-curve-spanned-tangents` and `gap:local-model-curve-spanned-tangents` (15 distinct in the README).
- R03 — repaired: line 102 now reads "represents the intrinsic integral v-sheaf local model of GS4 §4.17, … (the model of 𝒢°)", and line 100 cites §0.37 only for the admissible locus A_(𝒦,μ).
- R04 — repaired: line 15 now reads "The notion of a good integral Hodge embedding, KPZ26 Definition 3.4.4, is stated here in §2.1, on top of these inputs." The second owner of that definition is now part of R01.

## Verified sound

**Gate and build.** I reran the push gate on b8240e2. Every counter is 0 and the gate prints `OK`: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder and source-material.

- `lake env lean` on `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean` exits 0 with no output.
- The file is unchanged since 95bce15 and declares nothing in its namespace, so there is nothing to `#check` and no `sorry` warning.
- Its `module` / `public import Mathlib` header is also used by 7 `Suggested.lean` files on main, and the imports check accepts it.
- The diff against e1ee1ed touches README.md only, with 3 insertions and 3 deletions.
- The diff outside the folder against origin/main is empty.
- The folder holds exactly README.md, Suggested.lean and metadata.toml.

**Dependency check at this head** (with `--movable`):

```
depcheck: 243 roadmaps, 2456 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. GeometricSatakeAndFusion is at ORDER.txt line 127 and this roadmap at line 128. Every section that the changed lines consume (§§0.31, 0.37, 4.17 and 4.18) is in GeometricSatakeAndFusion, so the direction of supply is unchanged.

**Changed passages, checked against their targets.** I compared each changed passage with GeometricSatakeAndFusion's README at 140b5a7, fetched raw at that commit.

- §0.31 (line 847) constructs the Witt and equal-characteristic affine flag spaces. It gives components π₁(G)_I for connected parahorics, π₁(G)_I/π₀(𝓖_k̄) for full fixers, and the residual Frobenius action.
- §0.37 (line 972) defines `A_{𝓚,μ}` as the reduced perfect union of the admissible Schubert strata.
- §4.17 (line 2129) constructs, for E/ℚ_p finite and 𝓚 a connected parahoric, `𝓜_{𝓚,μ}` as the v-closure of the generic Schubert bound over the reflex base. It identifies the reduced special fibre of that model with `A_{𝓚,μ}`.
- §4.18 (line 2151) gives the maps for morphisms of connected parahoric models after a common reflex-field base change.

Lines 15, 100 and 102 now say exactly this.

KPZ26 §3.1.7 (lines 739–743, p.16) defines Mloc_(G,μ) as Mloc_(G°,μ): the unique proper flat O_E-scheme with reduced special fibre that represents the v-sheaf of SW20 over Spd(O_E). So line 100's "by definition that of 𝒢° (… KPZ26 line 741)" and line 102's "(the model of 𝒢°)" are accurate.

Apart from lines 15 and 100, no line of the README cites GeometricSatakeAndFusion §0.37, §4.17 or §4.18. The consumers reach §4.17 through the gap paragraph at line 102.

**GeometricSatakeAndFusionPartII at 3ef4ea3** (rev checkout, exact lines): the scope at line 7, §0.6 at line 309, §2.4 at line 476, §3.1 at line 571, §4.10 at line 844 and §4.11 at line 854. Their locators:
- §2.4: KPZ Theorem 3.3.25.
- §3.1: KPZ (3.2.13), Theorem 3.2.15, and the proof in §3.4.2.
- §4.10: KPZ Theorem 4.1.6, with its proof in §4.3.15.
- §4.11: KPZ Lemma 4.4.2 and Theorem 4.4.3.

All four match line 15's description. I also read its §7.7 (line 1123, KZ Proposition 3.1.9) and §7.8 (KZ Proposition 3.1.14). This README states neither: the only "3.1.14" in it is KP18 §3.1.14 at line 1140. So there is no third overlap.

**Citation leads.** The resolve tool listed two leads, `Crystalline.fontaineEnvelope_initial` and `Crystalline.fontaineEnvelope_periodPDEnvelope` (README lines 1268 and 66). Both are supplier API names in DerivedDeRhamCohomology §PD.7, at its README lines 2883 and 2886 (head of #868), not names in the pinned libraries.

**Ownership against open pull requests.**
- The overlap tool reports no other pull request changing this roadmap, no dropped id, and no id that only an open revision defines.
- `roadmaps grep -i 'good integral Hodge embedding'` finds definitions only in GeometricSatakeAndFusionPartII (line 309) and here (R01).
- BunGAndNewtonStrata, PadicHodgeTheory, AdmissiblePairsAndPadicHodgeStructures and FiniteFlatGroupsAndIntegralPadicHodgeTheory, the other closest roadmaps, were settled in the first review. The diff does not touch them.

**Seeded sample.** Five of the sampled targets fall in the changed passages or depend on them:
- §3.7: its local model is the one in line 102.
- §3.14: it cites `gap:scheme-local-model-representative`.
- §4.6: it uses §2.1's goodness, which line 15 now attributes to §2.1.
- §5.18: it cites GeometricSatakeAndFusion §0.31, which line 100 consumes.
- §6.3: it depends through §6.2 on the line 102 contract.

Each was reread at its locator:
- §3.7: KPZ26 Proposition 5.3.11 (line 2458, p.56), Corollary 5.3.16 (line 2632, p.60) and Definition 4.1.4 (line 1347). The hypothesis is linear spanning by k[[t]]-curve tangents. "Smooth implies very good" is the corollary.
- §3.14: KPZ26 §6.2.1 to Theorem 6.2.3 (lines 2962–3000, read in the first review); both Checks are recomputed in the table.
- §4.6: KZ25 lines 1055–1063 (previous review).
- §5.18: Kisin17 Lemma 1.2.18 (line 697, p.15), with its conclusion at line 703, p.16: g₀∈X_(υ₀)(b) and κ̃(g₀)=κ̃(g). The proof (line 721) uses that the image of g is Γ-invariant. Line 686 gives υ₀=σ(μ₀⁻¹).
- §6.3: KZ25 line 1189 and Zhou20 line 598 (first review); Check 4 is recomputed.

The other ten sampled targets (0.3, 0.4, 0.8, 0.10, 2.2, 2.4, 2.6, 3.2, 3.5 and 5.10) do not lie in the changed lines and do not cite them. §2.1 itself is unchanged. I added computed rows for the ones not already in the table and checked two of their locators:
- KPZ26 Lemma 5.3.2 is at line 2374, p.54.
- Proposition 5.3.20 is at line 2671, p.61.

**Declared gaps.** The 11 gaps in the plan are unchanged since the first review, which checked each one for precision and minimality against its supplier. The four undeclared ones are R02.

**Headline theorems.** `Suggested.lean` is unchanged. Its docstring names the missing carrier for each of the 21 headline groups: p-divisible groups, displays, parahoric local models, Breuil–Kisin modules and filtered tensor G-isocrystals, none of which exists at either pin. So there is nothing to probe for padding, and no statable headline is missing.

**Adversarial table.** The first rows are the changed statements and the sampled targets, computed at this head. Rows marked "(r2)" were computed in the previous review at e1ee1ed, and rows marked "(r1)" in the first review at 95bce15. Both kinds are carried forward for statements this diff leaves untouched.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Lines 15 and 100: §0.37 admissible locus against §4.17 local model | μ=0; split GL₂, μ=(1,0), hyperspecial | μ=0: §0.37 gives Adm(0)={1}, the base point over k, dim 0; §4.17 gives the unit point over the reflex integers. GL₂: §4.17 has generic fibre P¹ and reduced special fibre perf(P¹); §0.37's single double coset of t^μ has closure perf(P¹), dim 1 = 1 | holds | none (R03 repaired) |
| Line 100: §4.18 functoriality | identity; Iwahori→hyperspecial GL₂, μ=(1,0) | the identity fixes every point; the Iwahori Adm(μ)={t^(1,0), t^(0,1), τ} has 3 labels, all mapping to the one double coset W₀t^μW₀ | holds | none |
| Line 100: Mloc_𝒢=Mloc_𝒢° (KPZ26 line 741) | norm-one torus of ℚ₃(√3)/ℚ₃, full fixer x²−3y²=1 | local model Spec O_E for both 𝒢 and 𝒢°; components π₁(T)_I=ℤ/2 for 𝒢° against one point for 𝒢 (2 special-fibre components) | holds; agrees with "different quotients" | none |
| Line 102: gap:scheme-local-model-representative, "of GS4 §4.17 (the model of 𝒢°)" | μ=0; GL₂, μ=(1,0); quasi-parahoric 𝒢≠𝒢° | Spec O_E against the unit point. P¹_ℤp is normal, flat and projective with reduced special fibre, and (P¹)^◇ matches §4.17's Check 2. 𝒢 is replaced by 𝒢°, as in KPZ26 line 741 | holds | none |
| Line 15: §2.1 states Definition 3.4.4 | GL₂ identity; G_m→GL₂, z↦diag(z,1) | P¹→Gr(1,2)=P¹ is the identity, closed, so good; Spec ℤ_p maps onto a section of P¹, closed, so good; §2.1 cites KPZ26 line 1234 | true; also stated in GeometricSatakeAndFusionPartII §0.6 | R01 |
| Line 15: what GeometricSatakeAndFusionPartII states | its lines 476, 571, 844, 854 | Theorem 3.3.25; (3.2.13) with Theorem 3.2.15; Theorem 4.1.6; Lemma 4.4.2 with Theorem 4.4.3: 4 of 4 match | accurate | none |
| Single owner of the four theorems and Definition 3.4.4 | head | 2 owners for each of 5 objects | defect | R01 |
| Gap declaration, README against plan | slug sets | README 15 distinct slugs, plan 11; the 4 missing are lines 102–108 | mismatch | R02 |
| Supply direction | head; b259844 README | head: 0 problems, no moved line. b259844 without `--movable`: 1 UPWARD (#127→#205); with `--movable`: moved, 0 problems; citers of this roadmap: 0 | move is clean | R01 |
| §3.7 curve-spanned criterion (sample) | GL₂, μ=(1,0), hyperspecial; Layer 3 example xy=0 | Mloc=P¹ is smooth, so every point is very good (Corollary 5.3.16). A map Spec k[[u]]→Mloc over O_E factors through the special fibre since π_E↦0. On xy=0 the curve tangents are e₁ or e₂ only, never e₁+e₂ (r1) | holds | none |
| §3.14 Checks 1–2 (sample) | (−1,3)₃, with (−1/3)=−1, so a division algebra; V₀=K² | φ₀(1,i)φ(1,1)=i·i=−1, Trd −2; φ₀(1,1)φ(i,1)=−1, Trd −2; with φ₀'s arguments reversed: (−i)·i=1, Trd +2, and −2. ψ(e₁⊗v,e₂⊗w)=1 and the reverse −1 | holds | none |
| §4.6 (sample) (r2) | 𝒢=GL(Λ), empty tensors | Ψ₀c⁻¹ lies in the GL torsor, so this is the ordinary first-order rigid lift | holds | none |
| §5.18 (sample) | G_m, g=p; unramified G | κ(p)=1 and κ(1)=0. Trivial inertia gives π₁(G)_I=π₁(G), and σ-invariants equal Γ-invariants, as the README says | holds | none |
| §6.3 Check 4 (sample) | E(u)=u−p | E(0)=−p, so a=−1, c_E=−E(u)=p−u and c_E(0)=p; using E(u) alone gives −p at u=0 | holds | none |
| §0.3 Checks 1–2 (sample) | D_k; 𝔖=W(k)[[u]], I=(p) | φ(Vx)=px=p·φ₁(Vx); φ₁(pu)=φ(u)=uᵖ; φ(pu)=puᵖ=p·φ₁(pu); φ₁(p)=1 generates | holds | none |
| §0.8 Check 1 (sample) | M=[[0,1],[0,0]], N=[[0,0],[p,0]] over 𝔖 | τ(MN)=[[φ(p),0],[0,0]]=[[p,0],[0,0]]; τ(M)τ(N)=pφ(1)·φ₁(p)=p. Omitting p gives 1≠p | holds; the wrong model is excluded | none |
| §2.4 trivial torsor (sample) | 𝒢=GL(Λ); 𝒢=G_m | a vector bundle on the punctured Spec 𝔖 of a 2-dimensional regular local ring extends reflexively, hence freely; the Picard group of the punctured spectrum is 0 | holds | none |
| §2.6 Check 2 (sample) (r1) | ℤ_p[[x]], π²=p | v_K(π/p)=1−2=−1 | holds | none |
| §3.2 invariant endomorphisms (sample) | t=E₁₁ with 𝒢 the diagonal torus; the wrong model t=E₂₁ | E₁₁e₁=e₁∈⟨e₁⟩; E₂₁e₁=e₂∉⟨e₁⟩, so the 𝒢-fixed hypothesis is needed | holds | none |
| §3.5 neutral closure (sample) | split torus in GL₂ | E°=E=ℚ_p; μ factors through G° since G_m is connected (KPZ26 line 2664) | holds | none |
| (r2) §2.1 wrong model "good iff 𝒢↪GL(Λ) closed" | KPZ26 Remark 3.2.14, Theorem 3.3.25 | the closure can be non-normal when p divides \|π₁(G^der)\|, while the group map is closed | excluded | none |
| (r2) §3.10, n≥1 | G_m on ℤ₃, n=0,1,2 | n=0: kernel G_m; n=1: a↦a; n=2: a↦diag(a,a), injective | holds | none |
| (r2) §4.13 Check 3 | O_K[[T]] | T^m∈(T^n) iff m≥n; ∩(T^n)=0 | holds | none |
| (r1) §0.4 Check 3 (sample) | p=3, 𝔽₃[x,y]/(x³,y³) | second Witt coordinate of [x]+[y] is −x²y−xy²≠0; of [x+y] it is 0 | holds | none |
| (r1) §0.7 Check 3 | 𝔽₃[x]/(x⁴), 𝔽₃[x]/(x³) | 6γ₃(x)=0 but x³≠0; γ₂(x)=2x² | holds | none |
| (r1) §0.6 Checks | d=0, d=h, 1∉I | M₁=IM; M₁=M; e₁↦e₂ leaves M₁ | holds | none |
| (r1) §0.10 Check 3 (sample) | S=W(k), rank 1, d=0 | j=p, and p⊗k=0 | holds | none |
| (r1) §§0.11, 0.13, 4.4 rank one | ℚ_p/ℤ_p, μ_(p∞) | (σ, ÎM, 0) and (pσ, M, 1); F=pσ | consistent | none |
| (r1) §1.1 tangent dimension | (h,d)=(1,0),(1,1),(2,1) | 0, 0, 1 | holds | none |
| (r1) §1.3 first order | Z=Vε | Ψ₀(1−εE₂₁)(1+εE₂₁)=Ψ₀ | holds | none |
| (r1) §2.0 Checks 2, 3, 5 | diag(p,1); [[0,1],[p,0]]; unipotent u | J_b=(ℚ_p^×)²; J_b(ℚ_p)=D^× | holds | none |
| (r1) §2.2 Check 3 (sample) | E against p at u↦π | O_Ke₁⊕0 against O_Ke₁⊕pO_Ke₂ | distinct | none |
| (r1) §2.7 Checks 2–3 | c=1+εE₂₁; p=3 torus | E₁₁+εE₂₁; 1/2≡2≢1 mod 3 | holds | none |
| (r1) §2.10 Check 3 | swap w | wE₁₁w⁻¹=E₂₂≠E₁₁ | holds | none |
| (r1) §3.15 Checks 1–3 | D=K, m=1 | ψ((1,0),(0,1))=−1; multipliers 1, 2 | holds | none |
| (r1) §3.16 Check 2 | L=ℚ_p(π), δ=2π | ℤ_pe⊕p⁻¹ℤ_pf against ℤ_pe⊕ℤ_pf | holds | none |
| (r1) §4.2 counterexample | H≅G_m×μ_(p−1) | diag(1,ζ)∉𝒢° with κ=0 | holds | none |
| (r1) §5.5 Check 2 | μ_(p∞) | θ(t)=0, so t is not a unit | holds | none |
| (r1) §5.10 Check 3 (sample) | F=(1+tE₂₁)diag(p,1) | N(0)=−E₂₁; (h)=(t) | holds | none |
| (r1) §5.17 Checks 4–5 | G_m, b=3 | t_H=t_N=1; with μ(z)=z, t_H=−1 | holds | none |
| (r1) §6.0 Checks 1–2 | G_m, GL₂ | t^1=p, κ=1; dom(−μ)=(0,−1) | holds | none |
| (r1) §6.5 Check 2 | g, h unipotent | (gh)ᵗ=[[2,1],[1,1]]≠(hg)ᵗ | holds | none |
| (r1) p=2 scope | §§0.2, 0.5 against §§0.1, 0.13 | Lau14 has no odd-prime hypothesis; KPZ26 line 2081 assumes p>2 | consistent | none |
| (r1) Headline theorems | both pins | 21 groups; 0 carriers present (p-divisible groups, displays, Breuil–Kisin modules, parahoric local models); 0 declarations | correct empty file | none |

## Not verifiable

- RZ96, Proposition 1.21, used by §5.3. The manifest records it as `uncertified`, and the README cites it by its locator through Kisin17's proof of Theorem 2.2.3, line 1455. I have not read it. The diff does not touch §5.3.

## Source issues

- none
