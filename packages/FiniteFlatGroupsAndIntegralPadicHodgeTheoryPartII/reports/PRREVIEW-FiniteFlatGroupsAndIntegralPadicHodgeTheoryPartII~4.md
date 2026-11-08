# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at b8240e2)

**Verdict:** needs changes

This is a full review of the head the previous review read; the folder has not changed since. The two blocking findings are the previous R01 and R02. They are unchanged and re-raised for the operator. The two new findings are P3.

## Previous findings

- R01 — not repaired. Line 15 still reads "GeometricSatakeAndFusionPartII §§2.4, 3.1, 4.10 and 4.11 states the same four theorems as its own targets, and none of them is planned here". `merge-order/ORDER.txt` still lists GeometricSatakeAndFusion at line 127, this roadmap at line 128 and GeometricSatakeAndFusionPartII at line 206. Re-raised below as R01.
- R02 — not repaired. The plan's `gaps` still has 11 entries, while lines 102–108 keep four further `gap:` slugs (15 distinct in the README). Re-raised below as R02.
- The r2 findings that r3 recorded as repaired (GS4 §4.17 cited for the v-sheaf model; §2.1 owning Definition 3.4.4) remain repaired. Lines 100 and 102 cite §4.17/§4.18 correctly, and line 15 says that §2.1 states the definition.

## R01 (P2) — Definition 3.4.4 and the four local-model theorems still have two owners

Re-raised: H01

**Location.** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md`:
- line 15: "consumed with the hypotheses of KPZ26 Theorems 3.2.15, 3.3.25, 4.1.6 and 4.4.3; GeometricSatakeAndFusionPartII §§2.4, 3.1, 4.10 and 4.11 states the same four theorems as its own targets";
- §2.1 (line 588), which defines good integral Hodge embeddings;
- the four "What GeometricSatakeAndFusion must provide" paragraphs (lines 102–108) and their slug uses at lines 606, 646, 648, 940, 942, 958, 962, 979, 1048, 1187, 1211, 1571 and 1573.

**Claim.** Five objects have two owners each:
- KPZ26 Theorem 3.2.15 (canonical normal representative), Theorem 3.3.25 (closed Hodge immersion), Theorem 4.1.6 and Theorem 4.4.3 (curve-spanned tangents): requested from GeometricSatakeAndFusion by the four contracts here, and stated as its own targets by GeometricSatakeAndFusionPartII.
- KPZ26 Definition 3.4.4: defined both in §2.1 here and in GeometricSatakeAndFusionPartII §0.6.

**Witness.** `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md` at 3ef4ea3 (#1836, unchanged since the last review): §0.6 "Good integral Hodge embeddings" (line 310, "KPZ, Definition 3.4.4"); §2.4 (line 477); §3.1 (line 572); §4.10 (line 845); §4.11 (line 855).

**Why the reason in H01 does not settle it.** H01 agrees that the double ownership is real and assigns the fix to a merge-order decision. Neither the head nor the order has changed. I reran the dependency check on b259844's README (the text H01 would restore):
- without `--movable`: `UPWARD: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (#127) -> GeometricSatakeAndFusionPartII (#205) at README lines [102, 610, 652, 828, 946, 966]`;
- with `--movable`: `moved: … from #127 to #205, right after its last supplier GeometricSatakeAndFusionPartII` and `depcheck: 239 roadmaps, 2433 edges, 0 problem(s)`.

The objects therefore still have two owners each. The finding is re-raised so that the operator, not another repair round, takes the decision.

**Repair.** Either branch removes the second owner.
1. The operator moves this roadmap to directly after GeometricSatakeAndFusionPartII (ORDER.txt line 206). The author then restores b259844's citations of GeometricSatakeAndFusionPartII §§0.6, 2.4, 3.1, 4.10 and 4.11 in place of the four slugs, keeping this head's lines 15 and 100 for GeometricSatakeAndFusion §§0.31, 0.37, 4.17 and 4.18.
2. Or the order stays, and GeometricSatakeAndFusionPartII (#1836) cites GeometricSatakeAndFusion for the four theorems and this roadmap's §2.1 for Definition 3.4.4. R02 is then repaired here.

Tested: branch 1's README passes the `--movable` check with 0 problems (above) and uses exactly the 11 plan slugs.

## R02 (P2) — The four GeometricSatakeAndFusion contracts are not declared in the plan's gaps

Re-raised: H02

**Location.** README lines 102, 104, 106 and 108, "What GeometricSatakeAndFusion must provide (gap:scheme-local-model-representative)" and its three siblings; `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json`, `gaps`.

**Claim.** A README contract counts as declared only when `plan.json` carries the same slug. Eight targets consume `scheme-local-model-representative`, `scheme-local-model-hodge-immersion`, `schubert-curve-spanned-tangents` and `local-model-curve-spanned-tangents`, and no intake will announce them.

**Witness.** The plan's `gaps` lists 11 slugs, from `perfect-residue-bt-realization` to `perfect-residue-period-torsor-comparison`, with none of the four. The README uses 15 distinct `gap:` slugs. The four appear at the 17 lines listed in R01.

**Why the reason in H02 does not settle it.** The resolution is the same operator decision as R01. Until that decision is made, eight targets rest on contracts that are not declared.

**Repair.**
- After R01 branch 1, the four slugs leave the README and the README and plan agree at 11.
- Under R01 branch 2, add four `gaps` entries, each with supplier GeometricSatakeAndFusion, the `needs` text of lines 102–108, and section GS4 §4.17 for `scheme-local-model-representative`.

Tested: both branches give equal slug sets, of 11 or 15.

## R03 (P3) — §5.3 uses J_δ without fixing the residue field or citing §2.0

**Location.** README line 1273, "For the fixed tensor G-isocrystal (D,δσ), let T⊂J_δ be a maximal ℚ_p-torus …". Its *Needs:* line (1277) reads "PadicHodgeTheory §5.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.13; the torus and Newton-average hypotheses of the toral filtration theorem."

**Claim.**
- The statement is built on the σ-centralizer J_δ. §2.0 (line 564) constructs it only for k=F̄_p, so that K₀=ℚ̆_p.
- §5.3 states no residue field, although the Conventions (line 26) make each Layer 5 target state its own k. With a non-closed k the same defining equation gives a different group.
- The *Needs:* line omits §2.0. Its third item restates the theorem's own hypotheses and is not a dependency.

**Witness.** Take G=GL₂ and δ=[[0,1],[p,0]].
- For k=F̄_p, §2.0 Check 3 gives J_δ(ℚ_p)=D^×.
- For k=𝔽_p, K₀=ℚ_p and σ=id, so g⁻¹δσ(g)=δ gives the ordinary centralizer ℚ_p(√p)^×.
- Kisin17 §2.2 (lines 1403–1455) works over F̄_p.

**Repair.**
- Open §5.3 with "Let k=F̄_p, so that K₀=ℚ̆_p, and let (D,δσ) be the fixed tensor G-isocrystal".
- Replace the third *Needs:* item by "§2.0 (rational σ-centralizer)".

Tested on the refuting instance with k=F̄_p:
- T=ℚ_p(√p)^×⊂D^× is a maximal torus.
- μ_T∈{(−1,0),(0,−1)} in X_*(T)≅ℤ² has Galois average (−½,−½)=ν_δ⁻¹.
- μ_T⁻¹ has t_H=1=t_N. (D,δσ) is simple of slope ½, so it has no proper nonzero sub-isocrystal, and the filtration is weakly admissible.
- Every *Needs:* item resolves: PadicHodgeTheory §5.5 (line 1072 at its head), FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.13 (line 6021 at its head), and §2.0 here (line 562).

## R04 (P3) — §3.1 calls 𝔖 "S", the letter the Conventions reserve for the PD ring

**Location.**
- Line 832: "In S=W(k)[[u]] form M_S=Λ⊗S and the inverse image `M_{S,1}` of the induced filtration modulo p."
- Conventions, line 28: "Write 𝔖=W[[u]] … S denotes the p-completed Eisenstein PD evaluation ring. … These are three different rings".

**Claim.** §3.1's ring is 𝔖, and its pair lives over the frame (𝔖,(p)). Calling it S is the conflation that the Conventions rule out. A reader who follows line 28 reads `M_{S,1}` as a lattice over the PD ring, which §3.1 then says it is not ("it is not the Eisenstein modification"). The letter S is reused twice more:
- §4.9 (line 1149) uses it for O_K[[T]];
- §5.15 (line 1447) uses it for an integral model.

**Witness.** KPZ26 Lemma 5.3.13 (KPZ26 lines 2506–2516, pp.57–58) states the curve lattice M_𝔖,1 over 𝔖=W[[u]] with the frame (𝔖,(p)). The PD ring S of line 28 does not occur there.

**Repair.**
- In §3.1 write 𝔖, M_𝔖 and `M_{𝔖,1}` in both sentences.
- In §4.9 write O_K[[T]] (or a new letter) for S.
- In §5.15 write 𝒮 for the integral model.
- Scope line 28 as "Outside Layer 0, whose frames are written (S,I,φ,φ₁), S denotes the p-completed Eisenstein PD evaluation ring".

Tested: after these edits, `grep` for a ring named S outside Layer 0 finds only §5.4's PD ring (line 1282).

## Verified sound

**Gate, build and form.**
- I reran the push gate at b8240e2. It prints `OK`, with every counter 0: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder and source-material.
- `lake env lean` on `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean` exits 0 with no output.
- The outside-folder diff against origin/main is empty, and the folder holds exactly README.md, Suggested.lean and metadata.toml.
- The file declares nothing in `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII`, so there is nothing to `#check` and no section variable can be lost.
- Its `module` / `public import Mathlib` / `@[expose] public section` header is also used by 8 `Suggested.lean` files on main.
- A scan for process words, LaTeX delimiters, pull-request numbers and "optional/deferred" finds nothing.

**Dependency check at this head** (with `--movable`):

```
depcheck: 244 roadmaps, 2466 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Seeded sample (15 targets), each reread at its locator.**
- §0.4: KPZ26 §5.1.1(b), line 2092, p.48. The relative frame with V⁻¹([𝔟])=0 uses Zink's log coordinates. Hoff23 Lemma 1.21 (line 614, p.13) and its proof (lines 631–637) give the splitting Î_{S/R}=Î_S⊕𝔞 with 𝔞⊂ker σ.
- §0.13: Hoff23 Theorem 1.29 (line 717, pp.15–16) gives the anti-equivalence over complete Noetherian local rings with perfect residue field, compatible with duality. Remark 1.30 (line 750) gives the contravariant normalization. Lau14 Corollary 5.5 (line 1741, p.2244) covers admissible topological rings, and Corollary 5.6 (line 1745) duality.
- §1.2: KPZ26 §5.1.8 and Lemma 5.1.9 (lines 2174–2184, p.50).
- §1.8: Hoff23 Construction 1.27 (line 692; a=m²+m_F R at line 701) and Theorem 1.28 (line 711, p.15).
- §2.1: KPZ26 Definition 3.4.4 (line 1234, p.28) makes goodness a closed-immersion condition on the local-model map. KPZ26 §5.2 (line 2291) defines "cut out" on all O-algebras. KZ25 §§3.2.1–3.2.2 (lines 966–989) is contravariant and has the full fixer equal to the Bruhat–Tits stabilizer.
- §3.1: KPZ26 Lemma 5.3.13 (lines 2514–2543, pp.57–58). Its proof is the W(K)-intersection argument restated here.
- §3.8: KPZ26 Corollaries 5.3.3–5.3.4 (lines 2386–2399, p.55), with scheme-theoretic intersection.
- §3.11: KPZ26 §6.3.1 and Proposition 6.3.2 (lines 3084–3107, pp.70–71). Remark 6.3.3 (p.71) restricts to standard representations and covers p | ind(D).
- §3.17: KPZ26 §6.2.8 (lines 3040–3051) and Corollary 6.2.10 (lines 3058–3080, pp.69–70), with s≥1 copies and a generic-facet stabilizer.
- §4.2: KP18 §3.3.3 (line 2385, p.178) and Proposition 3.3.4 (line 2398, p.179; k algebraically closed). The proof of Corollary 3.3.6 (line 2430, p.180) uses 𝒢°(ℤ_p)=𝒢(ℤ_p)∩ker κ_G. KP18 §4.1.7 (line 2582, p.184) has the tensor-fixer lemma.
- §4.13: Hoff23 Assumption 2.28 (line 1195, p.25), Lemma 2.34 (line 1317), Lemma 2.35 (lines 1338–1345) and Theorem 2.36 (line 1346, p.28). The reduced p-torsion-free point detection is at lines 1371–1372.
- §5.1: Kisin17 Theorem 1.1.4 (line 295, p.7) and Corollary 1.1.7 (line 340, p.8).
- §5.13: Kisin17 Lemma 1.1.17 (line 463, p.10) and the proof of Proposition 1.1.13 (lines 422–446, pp.9–10).
- §5.14: Kisin17 Proposition 1.1.13 and (1.1.14) (lines 410–418, p.9).
- §5.18: Kisin17 Lemma 1.2.18 (line 697, p.15). Its conclusion g₀∈X_υ₀(b), κ̃(g₀)=κ̃(g) is at line 703, p.16. The proof (lines 713–721) uses a Γ-invariant image. Line 686 gives υ₀=σ(μ₀⁻¹).

Each locator has the theorem number, page and hypotheses stated, and the source supports the statement as written. None of the README's locators is flagged as unverified.

I also opened KP18 Lemma 3.1.17 (line 2011, p.169: m^N⊂pA, p-torsion-free) for §1.4, and Lemma 3.2.14 (line 2217) for §4.10's four equivalent conditions. KZ25 §3.2.5 (A)–(C) (lines 1011–1019) and Proposition 3.2.7 (line 1046, p.24) match §§4.10–4.12.

**Library declarations at the pins.** Mathlib:
- `WittVector` (`RingTheory/WittVector/Defs.lean:52`);
- `WittVector.frobenius` (`RingTheory/WittVector/Frobenius.lean:218`);
- `WittVector.frobeniusEquiv` (`Frobenius.lean:283`, requires `PerfectRing R p`);
- `WittVector.verschiebung` (`RingTheory/WittVector/Verschiebung.lean:109`, an additive hom);
- `WittVector.Isocrystal` (`RingTheory/WittVector/Isocrystal.lean:113`, a class with no finiteness and no filtration);
- `DividedPowers` (`RingTheory/DividedPowers/Basic.lean:77`);
- `Module.Grassmannian` (`RingTheory/Grassmannian.lean:66`, submodules with finite projective quotient of constant `rankAtStalk` k, matching line 44's "rank h−d quotient") and `Module.Grassmannian.functor` (`:185`, no representability at the pin);
- `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson` (`RingTheory/Filtration.lean:415`: Noetherian ring, `Module.Finite`, `I ≤ jacobson ⊥`);
- `IsLocalization.algebraMap_mem_map_algebraMap_iff` (`RingTheory/Localization/Ideal.lean:76`: x∈I·S ⇔ ∃m∈M, mx∈I).

Tau Ceti: `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` (`AlgebraicGeometry/GroupScheme/FiniteFlat.lean:52`). Tau Ceti has no p-divisible-group carrier.

**Cross-roadmap citations resolved**, on main or at the open head given by `roadmaps show`:
- FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879, 9856719), §§R07.1.1, 1.6, 1.7, 1.8, 1.22, 2.10, 2.11, 2.12, 2.27, 3.2, 3.3, 4.1, 4.13 and 4.16–4.21, 4.25, at lines 592–6565. `deJongBoundedFormalFunctions` is at line 4203. R07.4.20 is stated for finite K/ℚ_p, so `gap:perfect-residue-bt-realization` is needed.
- PrismaticCohomologyPartIII (#1070) §6.0: the bold target "Perfect-base Dieudonné comparison" (line 108) has M(ℤ/pʳ)=W_r with F=p·Frob, as line 54 says.
- AbelianSchemesAndArithmeticModuli (#849) §A4.CR.7.2 (line 2127) and §A4.10 (line 2362).
- CrystallineCohomology (#857) Layer CR.1 (line 603) and §CR.7.1 (line 11244).
- DerivedDeRhamCohomology (#868) §PD.7 (line 2853), with `Crystalline.fontaineEnvelope_initial` and `…_periodPDEnvelope` at lines 2884–2887. These are the resolve tool's two leads; they are supplier API names, not pin declarations.
- PadicPeriodRings (#940) §3 (line 391), §4.1 (line 418) and §4.3 (line 471).
- PELModuli (#966) §M2.15 (line 2608).
- PadicHodgeTheory (#1062) §5.5 (line 1072): the period-torsor class only for K/ℚ̆_p finite.
- VectorBundlesAndIsocrystals (#1205): the subsections "Finite isocrystals over the completed maximal unramified coefficient field" (line 214, Layer 1) and "Integral group torsors and Frobenius" (line 2025, Layer 6; smooth affine G/ℤ_p with connected fibres).
- ShimuraVarieties (#933) §7.0i (line 2015).
- GeometricSatakeAndFusion (#1235, 140b5a7) §§0.31, 0.37, 4.17 and 4.18 (lines 848, 973, 2130, 2152).
- On main: ReductiveGroupsPartII §§RG2.1.5, RG2.2.4 (*division-algebra-building* at line 3615), RG2.3.3 (*parahoric-kottwitz-characterization* at line 4335), RG2.3.5, RG2.3.7 and RG2.4.3 (lines 2446–5992); SchemeAndStackFoundations §§0.6, 1.15, 2.3, 4.1–4.4, 4.7, 4.8 and 4.12 (lines 678–5613); ModularCurves §0G (line 427, which constructs the relative Grassmannian scheme).

That is 43 section ids and 4 named targets.

**Declared gaps.** The 11 plan gaps are precise. None is supplied already:
- SchemeAndStackFoundations §4.12 cites Raynaud–Gruson only for the proper flattening of line 5618, not RG71 I, Theorem 4.1.2.
- ReductiveGroupsPartII has no punctured-disc purity and no tensor-cutting statement.
- PadicPeriodRings §4.3 is absolute.
- PadicHodgeTheory §5.5 stops at K/ℚ̆_p finite.

**Ownership against open pull requests.**
- The overlap tool reports no pull request changing this roadmap and no dropped or revision-only id.
- `roadmaps grep` over 478 heads and main finds no other owner of Ŵ(R), Dieudonné displays (EndoscopicTransfer #999 only consumes them), the tilde functor, very-good embeddings, adapted deformations or Breuil–Kisin tensor frames. The "very good" hits are very good primes or very good pairs.
- The rational σ-centralizer J_b of §2.0 is built here, and also in EndoscopicTransferAndUnitaryTraceComparison §7.5 (its line 2816, #999, ORDER 145) and BunGAndNewtonStrata §1.13 (its line 524, #1241, ORDER 184).
- The σ-straight ordinary normalization of §6.0 is also stated in BunGAndNewtonStrata (its line 813).
- This roadmap is earlier (ORDER 128), and PadicHodgeTheory §5.5 and VectorBundlesAndIsocrystals do not define J_b. So §2.0 and §6.0 are the owners here, as the first review settled, and those later roadmaps should cite them. Endoscopic §7.5 is a third builder that the first review did not list. No change is needed in this folder.

**Headline theorems.** The docstring names all 21 headline groups and the missing carrier of each (p-divisible groups, displays, Breuil–Kisin modules, parahoric local models, filtered tensor G-isocrystals). None of these exists at either pin, so `Suggested.lean` correctly states nothing. There is no declaration to probe for padding, and no statable headline is missing.

**Adversarial table.** The table covers the sampled targets, the finding targets and the headline row, with values computed at this head.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.4 (sample) | p=3, B=𝔽₃[x,y]/(x³,y³)→𝔽₃, γ₂=x²/2; b=0; k[ε]→k | Witt sum [x]+[y] has coordinate 1 equal to −x²y−xy²≠0; [x+y] has 0; log coordinates are additive; b=0 gives Î_B with V⁻¹; φ([b])=0 since 𝔞⊂ker σ (Hoff23 line 637) | holds | none |
| §0.7 Check 3 | 𝔽₃[x]/(x⁴); 𝔽₃[x]/(x³) | x³=3!γ₃(x)=0 is forced but false in the first; in the second γ₁γ₂=x³/2=0=3γ₃ and γ₂²=0=6γ₄ | holds | none |
| §0.13 (sample) | ℚ_p/ℤ_p; μ_{p∞}; their sum | ℚ_p/ℤ_p: Φ=φ=pV⁻¹=pΦ₁ on Î, rank(M₁/ÎM)=0=dim. μ_{p∞}: Φ₁(a)=φ(a)=V⁻¹(a)·p, rank 1. Projection ↦ inclusion of the second summand | holds | none |
| §1.2 (sample) | I=I′; D_{k[ε]}→D_{k[ε]/k} | φ₁′\|I=φ₁, so the matrix [[φA,pφB],[φ₁C,φD]] is unchanged and the comparison is the identity; C=[ε]∈I′∖I has φ₁′([ε])=0 | holds | none |
| §1.8 (sample) | h=2, d=1, O_F unramified and e=2 | R_GL=O_F[[t]], a=m²+m_F R=(π_F,t²), R/a=k[ε] in both; with pR instead the quotient is O_F/(π_F²)[t]/(t²,π_F t), so line 543 rightly uses m_F | holds | none |
| §2.1 (sample) | identity in Λ⊗Λ∨, g=2·id on ℤ₃²; GL₂ with P¹→Gr(1,2) | dual action 2·½=1 fixes it; a covariant action on Λ∨ gives 4·id≠id; the identity map of P¹ is a closed immersion, so good | holds | ownership in R01 |
| §3.1 (sample) | GL₂, curve ⟨e₁+ue₂⟩; torus cut by E₁₁, constant curve; torus with curve off the model | M_{𝔖,1} has basis (e₁+ue₂, pe₂) and pM⊂M₁⊂M. Torus: E₁₁∈M₁⊗M₁∨ with M₁∨=𝔖e₁∨+p⁻¹𝔖e₂∨. Off the model: E₁₁(e₁+ue₂)=e₁∉M₁ | holds | notation in R04 |
| §3.8 (sample) | GL₂∩Cent(E₁₁); t=diag(1,1+p) | Cent(E₁₁) is diagonal; the centralizer scheme of t has equations p·g₁₂=p·g₂₁=0, all of GL₂ over 𝔽_p, while its ℚ_p-points form the torus, so the scheme intersection is needed | holds | none |
| §3.11 (sample) | D=K, m=1 and 2 | G_m acts on V with weight 1 and on V̄ with weight −1 (contragredient). The GL₂ Grassmannian is smooth, hence very good by §3.7. The locator (p.70) gives the standard representations only | holds | none |
| §3.17 (sample) | split V₀=K²; (1,g), g∈SO(h) noncentral; l∈L× | ψ(ae₁⊗v,be₂⊗w)=ab·h(v,w), multiplier ab. (1,g) needs h(v,gw)=c·h(v,w), false. l(xd)=(lx)d. A perfect ψ forces equal weight-0 and weight-1 dimensions | holds | none |
| §4.2 (sample) | p=3, H={a²=b²}, K=ℚ̆₃ | ℚ̆₃(μ₃)/ℚ̆₃ is ramified of degree 2, so χ̄_cyc maps onto {±1}; the image reduces to diag(1,−1)∉scalars; det=χ_cyc∈ℤ₃^× gives κ=0 | counterexample valid | none |
| §4.13 (sample) | GL₂ h=2, d=1; O_K[[T]] | lifting base O_Ĕ[[t]], and t↦0 returns the constant pair; T^m∈(T^n) iff m≥n, so ∩(T^n)=0 | holds | none |
| §5.1 (sample) | k=F̄_p and 𝔽_p, G_m² cut by E₁₁ | a rank-2 frame exists for both k. A connected generic fibre (Conventions line 34) forces the reductive ℤ_p-model to be connected (hyperspecial Fix(x) equals the parahoric) | holds | none |
| §5.13 (sample) | R_G formally smooth; two-point base | R_G is a domain, so Spec R_G[1/p] is connected and one lift fixes the type; on a disconnected base it does not | holds | none |
| §5.14 (sample) | torus cut by E₁₁, H₀=μ_{p∞}⊕ℚ_p/ℤ_p; split and nonsplit (t≠0) lifts; μ₂ with b=−1 | Split: invariant integral projector with fixer G_m², adapted. Nonsplit: no invariant projector, not adapted. μ₂: ℤ_p-types differ (a² a nonsquare unit), but its generic fibre is disconnected, which line 34 excludes | holds | none |
| §5.18 (sample) | G_m, b=p, g=p | v(g⁻¹pσ(g))=1 for every g, so g₀=p∈X_υ₀(b); κ(g₀)=1=κ(p); π₁(G_m)=ℤ is Γ-invariant | holds | none |
| §5.3 | GL₂, δ=[[0,1],[p,0]], k=F̄_p and 𝔽_p | F̄_p: J_δ(ℚ_p)=D^×, T=ℚ_p(√p)^×, averages (−½,−½)=ν_δ⁻¹. 𝔽_p: σ=id, so J_δ=ℚ_p(√p)^×, a different group | k unstated; §2.0 missing from *Needs:* | R03 |
| §2.0 Checks | G_m with b=p; diag(p,1); [[0,1],[p,0]]; uTu⁻¹ | ℚ_p^×; (ℚ_p^×)²; D^× rather than ℚ_p(√p)^×; u·diag(2,1)·u⁻¹=[[2,−a],[0,1]], whose entrywise σ is [[2,−σ(a)],[0,1]]∉uTu⁻¹ | holds | none |
| §2.5 Check 3 | Fil¹=0, rank 1 | φ(E([π]))↦σ(E(0))=p·unit in W(k); image pŴ(O_K) equals j for d=0 | holds | none |
| §2.7 Check 3 | diag(2,1)·E₂₁·diag(½,1) | =½E₂₁, and ½≡2≢1 mod 3 | holds | none |
| §3.10 Check 1 | n=0, p=3 | GL(0)={1}; ±1↦1; kernel G_m | holds | none |
| §3.15 Checks 1–2 | D=K, m=1, ξ=(1,−1); Λ_i=p⁻ⁱℤ_pe | ψ=fw−vg, ψ((1,0),(0,1))=−1; the dual of p⁻ⁱ(e,f) is pⁱ(e,f); the same-index pairs at i=0,1 are incomparable | holds | none |
| §3.16 Check 2 | L=ℚ_p(π), π²=p, δ=2π | M^Γ=pℤ_pe⊕ℤ_pf with dual ℤ_pe⊕p⁻¹ℤ_pf; δ⁻¹M^♯=π⁻¹O_Le⊕p⁻¹O_Lf has Γ-part ℤ_pe⊕p⁻¹ℤ_pf; without δ⁻¹ the result is ℤ_pe⊕ℤ_pf | holds | none |
| §5.7 Check 3, §6.3 Check 4 | G_m, b=p, E(0)=ap | c=a⁻¹, Frobenius a⁻¹E(u) with value p at u=0; with μ₀(p) the value is ap; c_E=E(u)/a and c_E(0)=p | holds | none |
| §5.9 Checks | b=diag(p,1), 1, p | σ⁻¹(b⁻¹)pΛ=We₁⊕pWe₂, so Fil¹=ke₁; b=1 gives 0; b=p gives everything | holds | none |
| §5.10 Check 3 | F=(1+tE₂₁)diag(p,1) | N(0)=−E₂₁; n=−Σt^{pʳ−1} solves 1+n(t)=t^{p−1}n(tᵖ); h=Σt^{pʳ}/pʳ solves h′=−n; (h)=(t) | holds | none |
| Layer 6 example | E(u)=u−p, H₀=μ_{p∞}⊕ℚ_p/ℤ_p | a=−1; multipliers −E(u)=p−u and 1; residuals p and 1 | holds | none |
| Conventions | g=[[1,1],[0,1]], h=[[1,0],[1,1]]; F=diag(p,1)σ | (gh)ᵗ=[[2,1],[1,1]] and (hg)ᵗ=[[1,1],[1,2]]; Fil¹=ke₁, μ₀=diag(z⁻¹,1), p^υ₀=diag(p,1) | holds | none |
| Mathlib contract, line 44 | I=(3) in ℤ₃[[T]] | B/I=𝔽₃[[T]] is 3-torsion, and the contraction of 3·B[1/3]=B[1/3] is B | holds | none |
| Single owner (R01) | GeometricSatakeAndFusionPartII lines 310, 477, 572, 845, 855 | 5 objects with 2 owners each | defect | R01 |
| Gap declaration (R02) | plan slugs against README slugs | 11 against 15 | defect | R02 |
| J_b ownership | ORDER 128, 145, 184 | 3 builders; the earliest is this roadmap | owner here | none here |
| Headline theorems | both pins | 21 groups; 0 carriers (no p-divisible groups; the Grassmannian functor without a scheme; isocrystals without filtration); 0 declarations | correctly empty | none |

## Not verifiable

- RZ96, Proposition 1.21, used by §5.3. The manifest records it as `uncertified`, and the README cites it by its locator through Kisin17's proof of Theorem 2.2.3 (Kisin17 line 1455). I did not read it.

## Source issues

- **Misprint** in Kisin17 at proof of Lemma 1.2.18, p.16: the source puts the lattice-changing elements g₀ and g̃ in G(O_L) and G(𝔖) (lines 708, 718); it should be G(L) and G(𝔖[1/p]), as g=p in G_m shows; affects the proof.
