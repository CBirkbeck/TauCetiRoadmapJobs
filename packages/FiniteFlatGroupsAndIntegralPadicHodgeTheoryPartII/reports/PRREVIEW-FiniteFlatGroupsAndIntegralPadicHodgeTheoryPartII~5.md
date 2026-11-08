# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at a5ccea4)

**Verdict:** needs changes

This is an incremental re-review of the 26 README lines changed since b8240e2 (Conventions line 28; §§1.7, 3.1, 4.9, 4.11, 5.3 and 5.15), of everything that cites them, and of the gate, the dependency check and the elaboration. The two P3 findings of the previous review, R03 and R04, are repaired, and the repairs introduce no new problem. The two P2 findings, R01 and R02, are untouched by this head: neither the README's line 15, nor its lines 102–108, nor the plan's `gaps` changed, and the second owner at the head of GeometricSatakeAndFusionPartII is unchanged. They are written again below, re-raised for the operator as in the two previous rounds.

## R01 (P2) — Definition 3.4.4 and the four local-model theorems still have two owners

Re-raised: H01

**Location.** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md`:
- line 15: "GeometricSatakeAndFusionPartII §§2.4, 3.1, 4.10 and 4.11 states the same four theorems as its own targets, and none of them is planned here";
- lines 102, 104, 106 and 108, the four "What GeometricSatakeAndFusion must provide" contracts (`gap:scheme-local-model-representative`, `gap:scheme-local-model-hodge-immersion`, `gap:schubert-curve-spanned-tangents`, `gap:local-model-curve-spanned-tangents`), with 12, 11, 4 and 4 mentions in the README;
- §2.1 (line 588), which states KPZ26 Definition 3.4.4 as this roadmap's own.

**Claim.** Five objects have two owners each. KPZ26 Theorems 3.2.15, 3.3.25, 4.1.6 and 4.4.3 are requested from GeometricSatakeAndFusion by the four contracts and are stated as targets by GeometricSatakeAndFusionPartII. KPZ26 Definition 3.4.4 is stated in §2.1 here and in GeometricSatakeAndFusionPartII §0.6.

**Witness.** `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md` at 3ef4ea3c (the head of #1836, dated 2026-11-06, unchanged since the previous review): §0.6 "Good integral Hodge embeddings" (line 309), §2.4 (line 476, Theorem 3.3.25 with m≥1), §3.1 (line 571, Theorem 3.2.15), §4.10 (line 844, Theorem 4.1.6), §4.11 (line 854, Theorem 4.4.3). That README mentions neither this roadmap nor FiniteFlatGroupsAndIntegralPadicHodgeTheory. `merge-order/ORDER.txt` lists GeometricSatakeAndFusion at line 131, this roadmap at line 132 and GeometricSatakeAndFusionPartII at line 206.

**Why the reason in H01 does not settle it.** H01 accepts that the double ownership is real and defers the fix to a merge-order move only the operator can make. The decision is indeed the operator's, but the head cannot stand meanwhile: the brief's ownership rule makes an object two open roadmaps both plan a P2, and a repair inside this pull request cannot cite GeometricSatakeAndFusionPartII because the push gate reports that citation as UPWARD at the present order. No further repair round can change this; the finding is re-raised so that the board hands the decision to a human.

**Repair.** Either branch removes the second owner.
1. The operator moves this roadmap in `merge-order/ORDER.txt` to directly after GeometricSatakeAndFusionPartII (line 206). The author then restores the citations of GeometricSatakeAndFusionPartII §§0.6, 2.4, 3.1, 4.10 and 4.11 in place of the four slugs (as the head b259844 had them), keeps this head's lines 15 and 100 for GeometricSatakeAndFusion §§0.31, 0.37, 4.17 and 4.18, and says in §2.1 that the notion is that of GeometricSatakeAndFusionPartII §0.6.
2. Or the order stays, and GeometricSatakeAndFusionPartII (#1836) cites GeometricSatakeAndFusion for the four theorems and this roadmap's §2.1 for Definition 3.4.4; R02 is then repaired here.

Tested in the previous rounds: branch 1's README passes the dependency check with `--movable` with 0 problems and uses exactly the plan's 11 slugs.

## R02 (P2) — The four GeometricSatakeAndFusion contracts are not declared in the plan's gaps

Re-raised: H02

**Location.** README lines 102, 104, 106 and 108; `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json`, `gaps`.

**Claim.** A README contract counts as declared only when `plan.json` carries the same slug. The README uses 15 distinct `gap:` slugs; the plan's `gaps` has 11 entries, from `perfect-residue-bt-realization` to `perfect-residue-period-torsor-comparison`, and none of the four GeometricSatakeAndFusion slugs. The intake will announce none of the four on GeometricSatakeAndFusion's job, so §§2.1, 2.3, 3.11, 3.13, 3.14, 4.11, 4.13 and 6.2 and the Layer 3 Dependencies rest on undeclared contracts.

**Witness.** Counting the slugs at this head: `gap:scheme-local-model-representative` 12 mentions, `gap:scheme-local-model-hodge-immersion` 11, `gap:schubert-curve-spanned-tangents` 4, `gap:local-model-curve-spanned-tangents` 4; the plan's 11 `gaps` entries list suppliers FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicPeriodRings, SchemeAndStackFoundations (3), ReductiveGroupsPartII (4), ShimuraVarieties and PadicHodgeTheory only.

**Why the reason in H02 does not settle it.** H02 ties the mismatch to the decision of H01 and makes no change. Until that decision, eight targets consume contracts no intake reads. The sequencing in H01 is sound (after branch 1 the slugs leave the README), but it does not make the present head consistent.

**Repair.** After R01 branch 1, delete the four contracts and the README and plan agree at 11. Under R01 branch 2, add four `gaps` entries with supplier GeometricSatakeAndFusion, the `needs` text of lines 102–108, and section GS4 §4.17 for `scheme-local-model-representative`.

## Previous findings

- R01 — not repaired: line 15 still reads "GeometricSatakeAndFusionPartII §§2.4, 3.1, 4.10 and 4.11 states the same four theorems as its own targets"; lines 102–108 keep the four contracts. Re-raised above.
- R02 — not repaired: the README has 15 distinct `gap:` slugs and `design/plan.json` has 11 `gaps`. Re-raised above.
- R03 — repaired: §5.3 (line 1273) opens "Let k=F̄_p, so that K₀=ℚ̆_p", names J_δ as "its rational σ-centralizer of §2.0", gives the 𝔽_p counterexample, and its *Needs:* line (1277) ends "§2.0 (rational σ-centralizer)". The GL₂ instance of the previous review still holds (table).
- R04 — repaired: §3.1 (line 832) writes 𝔖, M_𝔖 and `M_{𝔖,1}` over "the p-frame (𝔖,(p))"; §4.9 (line 1149) writes B=O_K[[T]], with Ψ_B and R_E→B; §4.11 (lines 1183–1185) follows with B/TⁿB and ker(R_E→B); §5.15 (line 1447) writes 𝒮; line 28 scopes S to the PD ring "except in the p-frame notation (S,I,φ,φ₁) of §0.3, used in §§0.3–0.10 and 1.2". The scoping is exact: a ring named S occurs as a frame ring only in §§0.3, 0.6, 0.8, 0.9, 0.10 and 1.2, and as the PD ring only in §5.4 (lines 1282–1293) and §5.7 (line 1327).

## Verified sound

**Gate, build and form.**
- I reran the push gate at a5ccea44 with `--build`. It prints `OK` with every counter 0: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material and build.
- `lake env lean` on `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean` exits 0 with no output. The file has one `public import Mathlib`, the module docstring, the namespace and zero declarations, so there is nothing to `#check`, no section variable to lose and nothing to probe for padding. The docstring names all 21 headline groups and the missing carrier of each; none is statable at the pins (no p-divisible groups, displays, parahoric local models, Breuil–Kisin modules or filtered tensor G-isocrystals), so a file stating nothing is correct.
- The outside-folder diff against origin/main is empty; the folder holds exactly README.md, Suggested.lean and metadata.toml.
- The diff adds no process words, LaTeX, pull-request numbers or "optional/deferred" wording.

**Dependency check at this head** (with `--movable`), complete output:

```
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**The changed passages against their sources and suppliers.**
- Conventions line 28: KPZ26 §5.1.1 (KPZ26 lines 2073–2081, p.47) writes a frame as (S,I,φ,φ₁) with I+pS⊂Rad(S), φ a Frobenius lift, φ₁(I) generating S and φ=pφ₁ on I, which is §0.3's definition; §0.3 is the first use and §1.2 the last.
- §1.7: Hoff23 Notation 1.19 (lines 607–611, p.13) is a surjection of complete Noetherian local rings with perfect residue field whose kernel carries nilpotent divided powers compatible with those on pS and continuous through a fundamental system of open ideals; Theorem 1.23 (lines 641–649, p.14) is the equivalence from Dieudonné displays for S/R to displays over R. §0.7 (line 263) defines `D_{B/R}` and the strict maps `D_B→D_{B/R}→D_R`, and extends to continuous complete local PD thickenings under the same Notation 1.19, so the new citation and *Needs:* item resolve.
- §3.1: KPZ26 lines 2506–2516 (p.57) define M_𝔖, M_𝔖,1 by pulling back the mod-p filtration, state pM_𝔖⊂M_𝔖,1⊂M_𝔖 with M_𝔖,1 free, call (M_𝔖,M_𝔖,1) a pair over the frame (𝔖,(p)), and Lemma 5.3.13 puts the tensors in M_𝔖,1^⊗. (𝔖,(p)) is a p-frame in the sense of §0.3: (p)+p𝔖⊂(p,u)=Jac(𝔖), and φ₁(pa)=φ(a) has image 𝔖.
- §4.9: KP18 lines 2308–2313 (p.176) build the display over S=O_K[[T]] through the surjection O_K[[T]]→O_K×_k O_K, T↦(0,π), and the induced surjection of Zink rings, specializing to (Ψ,Ψ′); Hoff23 Lemma 2.34 (lines 1317–1337, p.28) is the same interpolation with t↦(ϖ_K,0). The README's convention follows KP18, and its API bullet names both endpoints.
- §4.11: KP18 lines 2314–2322 (p.176) have ξ̃:R_E→S, S_n=S/Tⁿ, I_n=ker(R_E→S_n), J_G and J_Gⁿ as the README states with B for S; lines 2329–2335 (p.177) give the stabilization and regularity steps.
- §5.3: Kisin17 lines 1442–1451 (p.32) construct μ_T∈X_*(T), conjugate to μ in G, with Galois average equal to ν_δ⁻¹ in X_*(T′)_ℚ; lines 1454–1456 take K the field of definition of μ_T as a G_{K₀}-valued cocharacter and invoke RZ Proposition 1.21 for admissibility of the filtration induced by μ_T⁻¹ on D(G_x)_K. §2.0 (line 562) fixes k=F̄_p, defines J_b over ℚ_p, and its Check 3 (line 578) is the D^× against ℚ_p(√p)^× comparison §5.3 now quotes. PadicHodgeTheory §5.5 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.13 were resolved in the previous review and are untouched.
- §5.15: vanHoften24 §3.1.5 (lines 1188–1196, p.27) writes the integral model as 𝒮_U(G,X) and pulls the universal abelian scheme back to it, so 𝒮 is the source's letter.

**Library declarations at the pins.** `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson` (`Mathlib/RingTheory/Filtration.lean:415`: Noetherian ring, `Module.Finite`, `I ≤ jacobson ⊥`) applies to B=O_K[[T]] as a module over itself with I=(T), since B is Noetherian and T lies in its Jacobson radical; `IsLocalization.algebraMap_mem_map_algebraMap_iff` (`Mathlib/RingTheory/Localization/Ideal.lean:76`). Both were opened in the previous review and §4.11's use of them is unchanged apart from the letter.

**Cross-roadmap citations the change touches.** §0.7 (line 263) and §2.0 (line 562) of this README; GeometricSatakeAndFusionPartII §§0.6, 2.4, 3.1, 4.10, 4.11 at 3ef4ea3c (lines 309, 476, 571, 844, 854) for R01. Every other citation is untouched since the previous review, which resolved 43 section ids and 4 named targets.

**Ownership against open pull requests.** The change introduces no new object. The overlap tool reports no pull request changing this roadmap and no dropped or revision-only id. The only double ownership is R01.

**Declared gaps.** The 11 plan gaps are unchanged, precise and not supplied elsewhere (as the previous review found). The four undeclared README contracts are R02.

**Remarks on untouched text (no change requested).** §4.10 and §4.11 label their standing conditions (A)–(C) while §4.11's proof now names the ring B; the parenthesised labels keep the two apart, and no Convention reserves B. §0.7 and §1.7 use the same letters B→R for the thickening, so the new §1.7 citation reads consistently.

**Adversarial table.** Rows for statements the diff leaves untouched carry forward the previous report's values (marked "r4"); rows for changed statements are computed at this head.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions line 28, scope of the letter S | every line with a ring named S, by section | frame ring S in §§0.3 (lines 182–190), 0.6 (242–256), 0.8 (286), 0.9 (308), 0.10 (325–337), 1.2 (440): all inside "§§0.3–0.10 and 1.2"; PD ring S in §5.4 (1282–1293) and §5.7 (1327): outside it; 0 frame uses outside the range | holds | none |
| §0.3 (sample) at this head | (𝔖,(p)); (W,(0)) | (p)+p𝔖=(p)⊂(p,u); φ₁(pa)=φ(a), image 𝔖. For I=0, φ₁ has image 0, which does not generate W, so (W,(0)) is not a p-frame | holds | none |
| §1.7, relative frame citation | B=R; B=k[ε]→k | B=R gives D_{B/R}=D_R (§0.7 Check, line 275); for k[ε]→k the kernel (ε) with trivial higher divided powers is nilpotent and continuous, Î_{B/R}=Î_B⊕[ε]k with φ₁([ε])=0 (§0.4 Check, line 216) | holds | none |
| §3.1 over (𝔖,(p)) | GL₂, curve ⟨e₁+ue₂⟩; torus cut by E₁₁ | M_{𝔖,1} has basis (e₁+ue₂, pe₂), so pM⊂M₁⊂M with M/M₁ free of rank 1 over k[[u]]; E₁₁∈M₁⊗M₁∨ with M₁∨=𝔖e₁∨+p⁻¹𝔖e₂∨; the frame ideal (p) satisfies (p)M⊂M₁ | holds | none |
| §4.9, B=O_K[[T]] | (a,b) with a≡b mod π_K; (0,1); constant family | a+((b−a)/π_K)T↦(a,b), so the map onto O_K×_k O_K is surjective; (0,1) has 0≢1 mod m_K, so it is not in the fibre product; Ψ constant specializes to (Ψ,Ψ) | holds | none |
| §4.11, ∩I_n=ker(R_E→B) | B=O_K[[T]], I=(T) | T∈Jac(B)=(π_K,T), B Noetherian, so ∩ₙTⁿB=0 by the pinned lemma; x∈∩I_n iff ξ̃(x)∈∩TⁿB=0 iff x∈ker ξ̃ | holds | none |
| §5.3, residue field and J_δ | GL₂, δ=[[0,1],[p,0]], k=F̄_p and 𝔽_p | F̄_p: J_δ(ℚ_p)=D^×, T=ℚ_p(√p)^×, μ_T∈{(−1,0),(0,−1)} with average (−½,−½)=ν_δ⁻¹; K=K₀(√p), of degree 2 over K₀; the slope-½ isocrystal is simple, so μ_T⁻¹ is weakly admissible with t_H=1=t_N. 𝔽_p: σ=id, centralizer ℚ_p(√p)^×, as the new sentence says | holds | none (R03 repaired) |
| §5.15, 𝒮 | vanHoften24 line 1188 | the source's integral model is 𝒮_U(G,X); no other 𝒮 in the README (1 occurrence, line 1447) | holds | none (R04 repaired) |
| §0.4 (sample, r4) | p=3, B=𝔽₃[x,y]/(x³,y³)→𝔽₃; k[ε]→k | Witt sum [x]+[y] has coordinate 1 equal to −x²y−xy²≠0; log coordinates additive; φ([b])=0 since 𝔞⊂ker σ | holds | none |
| §0.13 (sample, r4) | ℚ_p/ℤ_p; μ_{p∞} | Φ=pΦ₁ on Î with rank(M₁/ÎM)=0; μ_{p∞}: rank 1; projection↦inclusion | holds | none |
| §1.2 (sample, r4) | I=I′; D_{k[ε]}→D_{k[ε]/k} | matrix [[φA,pφB],[φ₁C,φD]] unchanged; φ₁′([ε])=0 | holds | none |
| §1.8 (sample, r4) | h=2, d=1, O_F unramified and e=2 | a=(π_F,t²), R/a=k[ε] in both | holds | none |
| §2.1 (sample, r4) | identity in Λ⊗Λ∨, g=2·id on ℤ₃² | 2·½=1 fixes it; covariant action gives 4·id | holds | ownership in R01 |
| §3.8 (sample, r4) | GL₂∩Cent(E₁₁); t=diag(1,1+p) | centralizer scheme of t has equations p·g₁₂=p·g₂₁=0 | holds | none |
| §3.11 (sample, r4) | D=K, m=1 and 2 | weights 1 and −1; GL₂ Grassmannian smooth | holds | none |
| §3.17 (sample, r4) | split V₀=K²; (1,g) noncentral | multiplier ab; h(v,gw)=c·h(v,w) false | holds | none |
| §4.2 (sample, r4) | p=3, H={a²=b²}, K=ℚ̆₃ | χ̄_cyc onto {±1}; det=χ_cyc gives κ=0 | counterexample valid | none |
| §4.13 (sample, r4) | GL₂ h=2, d=1; O_K[[T]] | t↦0 returns the constant pair; ∩(Tⁿ)=0 | holds | none |
| §5.1 (sample, r4) | k=F̄_p and 𝔽_p, G_m² cut by E₁₁ | rank-2 frame exists for both k | holds | none |
| §5.13, §5.14 (sample, r4) | R_G domain; split and nonsplit lifts; μ₂ with b=−1 | Spec R_G[1/p] connected; nonsplit has no invariant projector; μ₂ excluded by line 34 | holds | none |
| §5.18 (sample, r4) | G_m, b=p, g=p | v(g⁻¹pσ(g))=1; κ(g₀)=1=κ(p) | holds | none |
| §2.0 Checks (r4) | G_m b=p; diag(p,1); [[0,1],[p,0]]; uTu⁻¹ | ℚ_p^×; (ℚ_p^×)²; D^×; entrywise σ leaves uTu⁻¹ | holds | none |
| §§2.5, 2.7, 3.10, 3.15, 3.16, 5.7, 5.9, 5.10, 6.3 Checks (r4) | as in the previous report | as in the previous report | hold | none |
| Conventions (r4) | g=[[1,1],[0,1]], h=[[1,0],[1,1]]; F=diag(p,1)σ | (gh)ᵗ=[[2,1],[1,1]], (hg)ᵗ=[[1,1],[1,2]]; Fil¹=ke₁, p^υ₀=diag(p,1) | holds | none |
| Mathlib contract, line 44 (r4) | I=(3) in ℤ₃[[T]] | contraction of 3·B[1/3]=B[1/3] is B | holds | none |
| Single owner (R01) | GeometricSatakeAndFusionPartII 3ef4ea3c lines 309, 476, 571, 844, 854; ORDER lines 131, 132, 206 | 5 objects with 2 owners each | defect | R01 |
| Gap declaration (R02) | plan slugs against README slugs | 11 against 15; the 4 missing have 12, 11, 4 and 4 mentions | defect | R02 |
| J_b ownership (r4) | ORDER positions of this roadmap, EndoscopicTransfer §7.5, BunGAndNewtonStrata §1.13 | 3 builders; the earliest is this roadmap | owner here | none |
| Headline theorems | both pins | 21 groups; 0 carriers; 0 declarations; `lake env lean` exit 0 | correctly empty | none |

## Not verifiable

- RZ96, Proposition 1.21, used by §5.3. The manifest records it as `uncertified`; the README cites it through Kisin17's proof of Theorem 2.2.3 (Kisin17 line 1455). I did not read it.

## Source issues

- **Misprint** in Kisin17 at proof of Lemma 1.2.18, p.16: the source puts the lattice-changing elements g₀ and g̃ in G(O_L) and G(𝔖) (lines 708, 718); it should be G(L) and G(𝔖[1/p]), as g=p in G_m shows; affects the proof.
