<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1029#issuecomment-6377635199 -->
Review (claude) of db967e1

Verdict: needs changes

1. **F01** (P1) Six declared gaps have no supplier

   **Location.** `packages/AutomorphicBundlesPartII/design/plan.json`, top-level `gaps`, the six records `AutomorphicBundlesPartII/G-solid`, `G-models`, `G-boundary-regular`, `G-Harris`, `G-Phi`, `G-formal-models`. They carry no `supplier` and no README `What … must provide (gap:…)` line.

   **Claim.** Each is a declared gap with supplier `none`, hence unowned.

   **Witness.** G-solid's record calls the SolidAnalyticRings owner absent, yet SolidAnalyticRings is merge-order line 150 and README line 133 cites it. G-models says no Hilbert–Siegel supplier exists, yet ShimuraCompactifications C5 (integral PEL) contains C5.25–C5.26 on Hilbert–Siegel models.

   **Repair.** Every one of the six is already this roadmap's own target or an existing supplier section, so delete the six records from `gaps`. Because the design's `plan.json` is otherwise frozen, the intake or a human must authorise the deletion. The README needs no new contract:
   - G-solid → README §3.0a, with SolidAnalyticRings §§1.5, 2.2, 6.4, 7.1–7.2 and EnhancedDerivedSheaves §§0.1–0.3 as suppliers.
   - G-models → README §5.0. Reword line 839, "construct the G model, its toroidal and minimal compactifications", to "specialize ShimuraCompactifications C5.3, C5.16 and C5.25–C5.26 to BCGP21's PEL group G, and construct the G₁ quotient".
   - G-boundary-regular → README §5.0 (third block) and §5.11.
   - G-formal-models → README §5.1, with ShimuraCompactifications C5.21.
   - G-Phi → README §8.3.
   - G-Harris → README §§6.4, 7.1 and 7.3, with AutomorphicFormsOnReductiveGroups §§6.4–6.6. Its §6.6 states the sign-corrected singular large-weight exclusion that the record calls "AF.4/bhr-large-weight".

   Test: after the deletion, every record in `gaps` has a `supplier` and a matching README line. The seven named-supplier records already satisfy this, as checked below.

2. **F02** (P2) §7.0 plans again the GSp₄ packet input owned by EndoscopicTransferAndUnitaryTraceComparison §11.1

   **Location.** README line 1373: "(d) the surviving stable general-type parameter has trivial relevant global component group, and its discrete multiplicities are given by the character formula m(π)=#S⁻¹∑…".

   **Claim.** Hypotheses (c)–(d), and their use in §§8.7 and 8.9, restate a classification input that an earlier roadmap already plans. No supplier is named.

   **Witness.** EndoscopicTransferAndUnitaryTraceComparison §11.1 is at its open head and on merge-order line 166, before this roadmap. Under `GSp4ClassificationInputs` it states that for general-type π "every π′ with π′_v in the L-packet of π_v for all v is automorphic and occurs with multiplicity one". This is BCGP21 Theorem 2.9.3 (BCGP21 line 1867).

   **Repair.**
   - Add `### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison`, citing §11.1 (and §13.2 if it is used) with the `GSp4ClassificationInputs` hypothesis.
   - Replace (c)–(d) of §7.0 by that citation.
   - Keep (a)–(b) only as the exclusion of non-general types (BCGP21 Lemma 2.9.1, BCGP21 line 1831).
   - Repoint the *Needs:* of §§8.7 and 8.9 to it.

   Test: for (a,b)=(4,2) over ℚ, §11.1 gives multiplicity one to both members π(λ)_h and π(λ)_g of the archimedean packet. That is exactly the pairing behind h¹=h⁰ in §8.9.

3. **F03** (P2) §§1.1–1.2 restate AutomorphicBundles B3.10 on good-prime models

   **Location.**
   - README line 147: "let M_dR be the torsor of triples (ψ₁,ψ₂,c) … It is a right torsor under the Siegel Levi M≃GL_g×G_m".
   - README line 172: "define ω^κ=M_dR×^M V_κ".
   - The *Needs:* at lines 161 and 186 do not cite B3.10.

   **Claim.** On smooth good-prime toroidal models, which are the hyperspecial models of §§5.3–5.13, the following are already AutomorphicBundles B3.10 `integralLeviCoefficient`:
   - this torsor;
   - its integral associated coefficients;
   - their formal (sub)canonicity.

   **Witness.** AutomorphicBundles B3.10 (open head) defines E^can_{M₀} as isomorphisms (Lie^∨, O(1)) ≅ (L₀^∨(1), R(1)), then "Ecan(W) = E^can_{M₀} ×^{M₀} W … and Esub(W) = Ecan(W) ⊗ I_D" for every locally free W. Since ψ₂ is determined by (ψ₁,c), the torsors coincide.

   **Repair.**
   - Cite B3.10 in Scope, in the AutomorphicBundles contract, and in the *Needs:* of §§1.1, 1.2, 5.1 and 5.3–5.13.
   - Restrict §§1.1–1.2, in one clause, to what B3.10 lacks: the normalized deep-level models of ShimuraCompactifications C5.19–C5.31, and the integral dual-Weyl lattice of LP3.0.
   - Keep the g=1 frame-scaling Check (u ↦ c/u) as the comparison test.

4. **F04** (P2) gap:coefficient-linear-coherent-comparison asks for Tau Ceti API that exists, and the Tau Ceti contract misdescribes it

   **Location.**
   - README line 49: "Their definitions forget to abelian sheaves and impose no properness, finite-dimensionality, scalar-linear derived comparison or equivariant perfectness."
   - README line 67: "… naturally in coefficient morphisms, long exact sequences and the H⁰/global-section equivalence."

   **Claim.** The following are already at the Tau Ceti pin:
   - base-ring linearity of Hⁱ and its naturality;
   - linear connecting maps;
   - the linear identification of H⁰ with global sections.

   **Witness.** At the pin:
   - `AlgebraicGeometry.Scheme.Modules.cohomologyBaseModule` (TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean:45);
   - `cohomologyMapBaseLinear` (:57);
   - `cohomologyZeroBaseLinearEquiv` (:110) and `cohomologyZeroBaseLinearEquiv_naturality` (:127);
   - `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyδBaseLinear` (TauCeti/AlgebraicGeometry/Cohomology/LongExactSequence.lean:242).

   **Repair.**
   - List these declarations under `### From Tau Ceti`.
   - Narrow the `needs` (README and plan.json, same slug) to: identify SchemeAndStackFoundations §2.18's RΓ(X,F)∈D(O) with these base-linear groups, compatibly with `cohomologyMapBaseLinear` and `cohomologyδBaseLinear`.
   - Correct the Suggested.lean docstring sentence "The pinned scheme-module cohomology is additive sheaf cohomology" accordingly.

5. **F05** (P2) gap:lower-rank-polynomial-realizations is compound and partly supplied already

   **Location.** README line 119. The one `needs` sentence asks for:
   - classical forms of weight at least one;
   - all algebraic Hilbert packets;
   - stable models;
   - reduction/dual transport;
   - the Hilbert good-prime polynomial "without a finite discrete-series-place restriction".

   **Claim.** One slug requests several distinct objects, and the parallel-weight Hilbert part is already supplied by an earlier roadmap.

   **Witness.** HilbertModularVarietiesAndShimuraCurves R18.3.29 (merge-order line 176) covers every totally real F and parallel weight k≥2. It makes ρ_f unramified at every v∤p outside the level, with polynomial X²−T_vX+q_vS_v, "for every such f", using Taylor's theorem when [F:ℚ] is even.

   **Repair.**
   - Cite R18.3.29 for parallel Hilbert weights.
   - Cite WeightsInEtaleCohomology R34.5 together with ModularCurvesPartII §§14.1–14.4a for classical weight ≥2.
   - Split the remainder into separate slugs, each with one object and one supplier: weight-one classical forms; non-parallel Hilbert weights (k_v) of common parity, naturally with supplier HilbertModularVarietiesAndShimuraCurves R18.3.29, which owns that extension branch.

6. **F06** (P2) gap:coefficient-logarithmic-splitting names the wrong Lan–Suh theorem

   **Location.** README line 125: "Supply the coefficient logarithmic Deligne–Illusie splitting used in Lan–Suh Theorem 7.22 and Corollary 7.24 on the admitted W₂-liftable …".

   **Claim.** Theorem 7.22 is not the splitting. As written, the request duplicates gap:integral-small-weight-dual-bgg.

   **Witness.**
   - LanSuh line 2042: Theorem 7.22 (Faltings) is the filtered dual BGG complex.
   - The logarithmic vanishing is Theorem 3.24 (LanSuh line 986), applied in Proposition 7.21.
   - LanSuh line 2066 obtains Corollary 7.24 from 7.21 and 7.22.

   **Repair.** Make the `needs` read "the relative logarithmic vanishing of Lan–Suh Theorem 3.24, pp. 20–21, as verified for PEL pairs in Proposition 7.21, pp. 41–42". Keep the bound m<p−e, nilpotent residues and the ampleness condition (3.25). Replace "W₂-liftable" by Theorem 3.24's W(k)-lifting satisfying Assumption 1.4 (LanSuh line 989).

7. **F07** (P2) gap:boundary-spin-satake mixes a local Satake identity with geometric and Galois objects

   **Location.** README line 97: "Compute the normalized Klingen-Levi restriction of the GSp₄ spin polynomial on the boundary coefficient … so that the full polynomial is that of ρ₂⊕(ρ₂⊗χ)".

   **Claim.** The supplier owns local Satake. It owns neither Shimura boundary coefficients nor Galois representations, so this `needs` is compound.

   **Witness.** SmoothRepresentationsOfLocalGroups SR.4.5 (open head) defines the spin polynomial in T₀, T₁, T₂ and its comparison with CG20's generators. It has no boundary or Galois carrier. BCGP21 line 3350–3357 computes the Klingen restriction locally before attaching ρ_π⊕(ρ_π⊗χ).

   **Repair.** Restate the `needs` as a local identity: the Satake restriction of the spin polynomial to the Klingen Levi GL₂×GL₁ is the product of the GL₂ Hecke polynomial and its χ-twist. Specify the q-exponent and the character normalization, and keep the four distinct spin monomials. Keep the boundary-coefficient identification and ρ₂⊕(ρ₂⊗χ) in §8.4.

8. **F08** (P2) §5.3 states only the GSp₄ case of Lan–Suh Corollary 7.24; the general theorem has no owner

   **Location.** README line 924: "specialize Lan–Suh Corollary 7.24(2) to μ=(α,β;c) with α≥β≥0, α+β<p−3 and ν=(t,t;0), t>0".

   **Claim.** The general PEL vanishing theorem is used as an input but stated nowhere. The target is narrowed below its source.

   **Witness.** LanSuh line 2069–2073: Corollary 7.24 holds on general PEL compactifications, for every μ∈X^{+,<rep}_{G1} with max(2,r_τ)<p and every positive parallel ν. A `roadmaps grep` for Lan–Suh finds no other owner.

   **Repair.** Make §5.3's target Lan–Suh Corollary 7.24(1)–(2) on the PEL models of ShimuraCompactifications C5, with those hypotheses and with the two declared gaps as *Needs:*. Keep the GSp₄ weights as Checks. Test: μ=(0,0;c), ν=(2,2;0), p=7 gives (β+2+t,−α+t)=(4,2), (α+3+t,1−β+t)=(5,3) and (α+3+t,β+3+t)=(5,5).

9. **F09** (P2) §3.0a drops its source's finite-type hypothesis and leaves the analytic ring unspecified

   **Location.**
   - README line 405: "Construct, for a qcqs Noetherian scheme X over the fixed coefficient base O, the stable enhanced category of solid O_X-modules".
   - README line 407: "This is the scheme specialization of BP26 §§2.1–2.3, 2.6–2.9".

   **Claim.** The only cited source gives the solid category and the six operations for schemes of finite type over ℤ, through Clausen–Scholze. Neither is supplied for a general complete DVR O such as W(𝔽̄_p) or ℂ[[t]].

   **Witness.** BP26 line 574–577 (§2.2) assumes all schemes are of finite type over ℤ. It takes D(O_{X,■}) from [CSb] Theorem 9.8 and the six operations from [CSb] Lecture XI.

   **Repair.** Either add "X of finite type over ℤ", or name the analytic ring (O_X,O_X)_■ and cite Clausen–Scholze for the generality claimed. Also record in Conventions that VStackSheavesAndLisseCategories VS2.2's integer-solid (A,ℤ)_■ is a different analytic ring: there Spec A[1/f] is closed, here it is open.

10. **F10** (P3) Broken or misdirected supplier citations

   **Location and repair**, item by item:
   - **Line 137, "§4.8: Fundamental classes …".** AlgebraicModuliForArithmeticGeometry §4.8 is "Constant, connected and varying restriction fixtures" (gerbes). The fundamental class is §7.5 `fundamental_class_boundary`, which the *Needs:* lines already cite. Change the header to §7.5.
   - **"SchemeAndStackFoundations key", lines 462, 504 and 735.** No such section exists; "key" occurs only in that README's shape remark. Delete it; §2.19 is already cited beside it.
   - **Lines 65, 326 and 849, "§§1.6–1.12: Finite étale descent".** Those sections are algebraic-space foundations. Cite §1.1 `qcoh_fpqc_descent` for descent and §2.23 for equivariant cohomology.
   - **"A0", lines 516, 522 and 524.** Replace by "AlgebraicModuliForArithmeticGeometry §7.5".
   - **"AS.5", lines 1211 and 1225.** Replace by "AutomorphicSpectralTheory §5.2" (weighted regularization) or §§5.1–5.7a.
   - **"B5/hecke-section-operator", line 483.** Replace by "AutomorphicBundles B5.10 `ClassicalHecke.operator`".
   - **"§3.0bb", line 885.** Replace by "§3.0b".
   - **"AutomorphicFormsOnReductiveGroups §§1.1–1.8", lines 105, 1213, 1241, 1263, 1333 and 1361.** That roadmap's Layer 1 has only §§1.1–1.3; there is no §1.4–§1.8. Change to §§1.1–1.3. The occurrences are §4.2 and the Hermitian pair is §6.1, both already cited.
   - **"P20 Proposition 15.2.4.1, pp. 109–110", lines 1373 and 1567.** The proposition and its proof end on p. 109, and p. 110 is the bibliography (P20 line 4986–5012). Change to p. 109.

11. **F11** (P3) §3.7's locator does not contain the twisting construction

   **Location.** README line 577: "(BP26, §2.6, pp. 21–23 and §4.3.1, p. 47, BP26 line 1038)".

   **Witness.** BP26 §2.6.1 (BP26 line 1039–1047) tensors a correspondence with a module M. The tensor product of a coefficient map with the fundamental class is in two places:
   - BP26 Propositions 4.3.9 and 4.3.11 (BP26 lines 2481 and 2490, p. 48);
   - P20 §4.3.1 (P20 line 829–836, p. 19).

   **Repair.** Cite those two places. Keep §2.6.1 only for the projection-formula step.

12. **F12** (P3) §4.1 uses P20's operator labels inside CG20's coordinates without saying so

   **Location.** README line 743: "set T_(ℓ,2)=ℓ⁻³T′_(ℓ,2) and T_(ℓ,i)=ℓ⁻⁶T′_(ℓ,i) for i=0,1", cited to CG20 Remarks 5.10 and 5.12.

   **Witness.** These exponents are P20's, in P20's labels (P20 line 1084–1085, p. 25). In CG20 (CG20 line 1329–1346, p. 33), β_{x,1}=diag(1,1,x,x) has similitude x, so in CG20's labels ℓ⁻³ belongs to T_{ℓ,1}.

   **Repair.** Add "in P20's labelling (P20 §5.3, p. 25); P20's T_(ℓ,2), of similitude ℓ, is CG20's T_(ℓ,1)". Test: CG20's T_{2,2} has similitude 4 and factor 2⁻⁶.

13. **F13** (P3) §7.0 does not pin its central coordinate against AutomorphicFormsOnReductiveGroups §6.3

   **Location.**
   - README line 1367: "identify the contributing representation's infinitesimal character as (a−1,b−2;−w)".
   - The Check at line 1381: "changing the sign of w fails this second test".

   **Witness.** At split weight (3,2;0) the two sources disagree in sign:
   - CG20 Theorem 5.6(1) (CG20 line 1183–1188) gives (2,0;5).
   - AutomorphicFormsOnReductiveGroups §6.3, in its Check at (3,2;0), gives the parameter (2,0;−5) and the dual parameter (0,−2;5).

   **Repair.** Add a Check computing both values at (3,2;0). State that CG20's central coordinate is that of §6.3's dual parameter, and say whether the spin orbit describes π_∞ or its contragredient.

14. **F14** (P3) Definitions without an API list or three Checks, and Checks that compute nothing

   **Location.**
   - §1.3 (lines 195–207) and §4.3 (lines 791–803) are definitions with no API list and one Check each.
   - Non-discriminating Checks: lines 948, 962 and 976 ("reject weights one step beyond the p-small bound"; the theorem asserts nothing there), and lines 232, 469, 789, 1138 and 1270 (instructions, not tests).
   - The Examples sections copy Checks verbatim (for example lines 275–285).

   **Repair.** For §1.3, add an API list and split the Check into separate computed bullets:
   - ω(1,0)=E, of rank 2;
   - ω(1,1)=det E;
   - Ω^(0,2)=ω(2,2)=det²E;
   - Lie(A) has weight ((0,−1);1) and ω_A has weight ((1,0);−1), which are dual.

   For §4.3, add Checks:
   - the similitudes of β_(x,0), β_(x,1), β_(x,2) are x², x, x²;
   - q=2 with (T_{v,0},T_{v,1},T_{v,2})=(1,3,2) gives X⁴−3X³+14X²−24X+64;
   - q=1 with (1,4,4) gives (X−1)⁴.

   Replace or delete the other listed bullets.

15. **F15** (P3) Policy and style

   **Location.**
   - Process narrative: line 1203 and line 1341 ("still-unproved"), line 1443 ("remains labeled conditional until … supplied"), line 1036 ("The omitted geometric verification").
   - Garbled sentences: lines 324, 352 and 1068 ("A proof route is to after/to bounded/to on").
   - Lower-case proper nouns in layer titles: line 737 ("hecke"), line 1363 ("siegel").
   - Duplicated *Needs:* entries: lines 362, 1056, 1176, 1394 and 1423.
   - Double period "pagination..": line 1625.

   **Repair.** Make the statements timeless and rewrite the three proof-route sentences. Capitalise "Hecke" and "Siegel". Deduplicate the *Needs:* entries and fix the punctuation.

16. **F16** (P3) §2.3 is narrower than CG18 Lemma 7.7, and §2.5 omits SchemeAndStackFoundations §2.23

   **Location.** README line 334 ("a finite projective A-module N") and the *Needs:* of §2.5 at line 379.

   **Witness.**
   - CG18 line 4058–4061 (Lemma 7.7, printed p. 397) needs only an A-module N that is flat over O.
   - SchemeAndStackFoundations §2.23 states the equivariant Hochschild–Serre spectral sequence and the free-quotient comparison.

   **Repair.** State §2.3 for O-flat N, keeping finite projective as a Check. Cite §2.23 in §§2.2 and 2.5 for cohomological descent.

Reviewed: `packages/AutomorphicBundlesPartII/README.md` (1637 lines, read in full), `packages/AutomorphicBundlesPartII/Suggested.lean`, `metadata.toml`, `sources.toml`, and the top-level `gaps` of `packages/AutomorphicBundlesPartII/design/plan.json`. Findings: 16 (1 P1, 8 P2, 7 P3). Source issues recorded: 11.

## Verified sound

**Elaboration.** `lake env lean` on `TauCetiRoadmap/AutomorphicBundlesPartII/Suggested.lean` was run from the content checkout at its pins. It exited 0 with no output: there are no declarations, so there is no `sorry` warning and no `TauCeti.*` import to build.

The file has:
- one `import Mathlib`;
- one module docstring;
- an empty `namespace TauCetiRoadmap.AutomorphicBundlesPartII`;
- no `set_option`, no sorry'd data, no `lemma`.

The binder audit (`#check @name`) is vacuous because nothing is declared, and the one-tactic padding probe has nothing to probe.

**Dependency check** (the brief's command):

    moved: AutomorphicBundlesPartII moved in the merge order from #178 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
    depcheck: 28 roadmaps, 252 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The `moved:` line is not a defect.

**Headline theorems (15).** They are the 15 items of the Suggested.lean docstring, which match the README's Layers 1–8. All are correctly declared not statable at the pins:
- At the pins there is no Shimura variety, automorphic bundle, solid sheaf on schemes, or coherent upper shriek.
- Finite-coefficient Serre duality in relative dimension d needs ω=det Ω¹.
- Tau Ceti has Ω_{X/R} (`Scheme.relativeDifferentials`, TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean), the closed monoidal X.Modules (TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean) and base-linear cohomology.
- Neither Mathlib nor Tau Ceti has a sheaf exterior power; Mathlib's `ModuleCat/ExteriorPower.lean` is over a fixed ring.
- A curve-only form of the duality is statable, but it would be a weakened substitute and is rightly omitted.

**Source sample: all 15 targets checked at their locators.**

| Target | Result | Evidence |
|---|---|---|
| 1.2 | Sound | BP26 line 2410–2421: (ψ₁,ψ₂,c), V_κ, π_*O[−w₀κ]. README corrects the left-translation misprint (Source issues). |
| 1.3 | Sound | CG20 line 912 and 984 (ω(a,b)=W(a,b;−a−b)); P20 line 1051 (Ω(k,r)=Sym^k⊗det^r); BP26 line 2428–2430. |
| 3.0a | Locators correct | BP26 Lemma 2.9.3 (line 1403), Theorem 2.9.7 (line 1440), Proposition 2.9.9 (line 1452). Hypothesis issue is R09. |
| 3.0b | Sound | P20 §4.3 p. 19 (line 809–842); P20 §§14.8–14.9 Klingen geometry (line 4603–4673); BP26 §4.3.1. |
| 3.7 | Partly supported | See R11. |
| 3.8 | Sound | BP26 line 2431: rational torsor identification over the generic fibre. |
| 3.10 | Sound | BP26 Definition 2.1.19(4) (line 433), set-theoretic per Remark 2.1.20 (line 436); Frobenius example line 438–440. |
| 3.12 | Sound | BP26 line 1401–1402 (two triangles), 1419–1422, 1440–1441, 1452–1454. |
| 5.11 | Sound | BCGP21 Lemma 3.9.12 (line 3057–3060). README adds the needed boundary-regularity hypothesis (gap in source; Source issues). |
| 5.12 | Sound | BCGP21 Lemma 3.9.13 and Remark 3.9.14 (line 3070–3105): Har66 III.8.8, regular pullback, p₂⁻¹=p₁⁻¹ of strata (line 3092–3093). |
| 5.16 | Sound | P20 line 4952–4953 (localization through ℚ̄_p≃ℂ); README's definition is its own and the Check is computed. |
| 6.5 | Sound | CG20 line 1048–1068 (cusp/L² images, essentially tempered summands, K-invariants). |
| 7.0 | Sound against CG20 | CG20 Theorem 5.6(1)–(2) (line 1183–1193) and Remark 5.12 (line 1381–1395); P20 Proposition 15.2.4.1 (line 4986–5000, p. 109 only, not "pp. 109–110"); BCGP21 Corollary 3.10.5 (line 3302). |
| 8.2 | Sound | CG20 line 2021–2054: all weights, prime-to-p levels, all degrees. |
| 8.8 | Sound | BCGP21 Theorem 3.10.1 (line 3269–3294). Multiplicities come from the proof (line 3389–3399). |

Additional locators checked:
- CG20 Theorem 5.1 (line 931–940) and its proof weights (line 991–1009).
- CG20 Corollary 5.8 (line 1231–1236).
- CG20 Lemma 5.4 (line 1097–1100).
- CG20 Theorem 5.5 and its chambers (line 1129–1145).
- CG20 Remark 5.10 (line 1368–1376).
- BCGP21 (2.4.8) (line 1045).
- BCGP21 Proposition 3.8.3 and Lemma 3.8.5 (line 2655–2703).
- BCGP21 Proposition 3.9.11 (line 3037).
- BCGP21 Proposition 3.9.15 (line 3106–3117).
- BCGP21 Lemma 3.10.7 (line 3314–3357).
- BCGP21 Definition 3.3.3 (line 2091).
- BP26 §2.6.1, §2.6.9 and Lemma 2.6.11 (line 1039–1131).
- Lan17 Definition 8.5 and Theorem 8.6 (line 1488–1511).
- LanSuh Corollary 7.24 (line 2069–2073, p. 43).
- HZ01 (3.2.4) (line 2694, p. 62) and Corollary 3.2.9 (line 2734, p. 63).
- Su24 Theorem 5.7 (line 2456, p. 55).
- Sch15 Corollary V.1.7 (line 3089–3103, p. 83).
- H90 Theorem 2.4.4 (p. 57), Theorem 2.7 (p. 58) and Proposition 2.7.2 (p. 59).
- BR16 Theorem 1.12 (p. 10) and Proposition 1.14 (p. 11).
- CG18 Lemmas 7.5–7.7 (line 4001–4072, printed pp. 396–398).

**The p∤#Δ(Kᵖ) hypothesis of §5.0 and §5.13 is needed.** BCGP21 Lemma 3.8.5, which carries Proposition 3.8.3, fails when p divides #G. Take G=ℤ/2 and S=Spec 𝔽₂ with the trivial torsor. Then the invariant line O_S·(1+σ) lies inside the augmentation submodule I_G·f_*O_T, so the claimed direct sum fails (Source issues). The README's hypothesis is the correct repair. Its Check at p=2 ("the denominator is absent") is consistent with this.

**Library declarations opened at the pins.**
- `CochainComplex.isKProjective_of_projective` (Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean:113): upper bound `IsStrictlyLE d` and projective terms, as the README says.
- `CochainComplex.IsKProjective.Qh_map_bijective` (Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean:43).
- `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, `cohomologyFunctor`, `cohomologyZeroEquiv` and `cohomologyZeroEquiv_naturality` (TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61, 66, 80, 86).
- `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero` (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean:113). Its hypotheses are exactly as README line 51 lists them.
- The base-linear cohomology declarations of R04.
- Mathlib's `AlgebraicGeometry.SmoothOfRelativeDimension` (Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127).

**Cross-roadmap citations resolved** (main, or the open head given by the tool). These exist where cited:
- AutomorphicBundles B0–B5, B3.10 and B3.BGG.1–B3.BGG.3. B3.BGG works in characteristic zero, so gap:integral-small-weight-dual-bgg is minimal and precise.
- SchemeAndStackFoundations §§0.18, 1.1, 2.6–2.8, 2.18–2.21, 2.23 and 4.8–4.10.
- DerivedModuleAlgebra §§0.2–0.3, 1.1.1, 1.3–1.5, 1.E.0–1.E.1, 1.M.1–1.M.2 and S.1.
- DeformationAndDerivedPatchingAlgebra §§7.1–7.9.
- ShimuraCompactifications C1, C3.3–C3.10, C4.1–C4.11, C4.16–C4.17, C5.3–C5.17, C5.19–C5.31 (C5.21 formally canonical, C5.29 Siegel canonical bundle).
- LanglandsParameterStacks LP3.0, over fields, so gap:integral-dual-weyl-lattices is minimal.
- ComplexComparisonPartII C1.9, C2.1–C2.2 and C3.3.
- SmoothRepresentationsOfLocalGroups SR.0–SR.4.5. SR.4.5's generator dictionary agrees with README §4.3.
- IntegralHeckeAndGaloisDeterminants §§2.2–2.3, 3a.1–3a.2 and 3b.1–3b.2.
- AutomorphicFormsOnReductiveGroups §§1.1–1.3, 4.1–4.2 and 6.1–6.7. The chambers C₀–C₃ equal CG20's, and §6.6's second statement is the singular large-weight input used in §7.3.
- AutomorphicSpectralTheory §§4.1–4.5 and 5.1–5.7a.
- ArithmeticGaloisRepresentations §§1.1–1.12, 2.2 and 5.1–5.3.
- WeightsInEtaleCohomology R34.5–R34.6.
- CrystallineCohomology CR.5.1–CR.5.4 and CR.DDR.6.11–6.14.
- EnhancedDerivedSheaves §§0.1–0.3, E1.3, E2:towers, E3.2–E3.3 and E5:abstract.
- SolidAnalyticRings §§1.5, 2.2, 6.4 and 7.1–7.2.
- AlgebraicModuliForArithmeticGeometry §7.5.
- AlgebraicVectorBundles L0A–L0C.

The seven named-supplier gaps appear with the same slug, supplier, section and `needs` in plan.json and in README lines 57, 67, 85, 91, 97, 119 and 125. Defects in four of them are R04–R07.

**Ownership.**
- Scheme solid six operations (§3.0a): no roadmap on main, open head or board package states them. VS2.2 of VStackSheavesAndLisseCategories uses a different analytic ring (R09), so this roadmap is the owner.
- Ekedahl–Oort strata and affine minimal images (§5.0): IgusaVarietiesAndTorsionConcentration IG.2.12–IG.2.13 states them for general PEL type, but it is later in the merge order (line 238). By the brief's rule the notion moves down to §5.0. That move is recorded here, and the later roadmap should import §5.0.
- AutomorphicBundles defers "Hecke-equivariant perfect complexes" to this roadmap (its Scope), which is consistent.
- Ownership against open pull requests was checked through the `roadmaps` tool index of 2026-10-23 and the sibling checkouts the brief lists.

**Adversarial pass.** One row per statement; every row shows computed values.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions | Aₙ≅(E/O)[ϖⁿ]; scalar xI₄; geometric Frobenius | 1↦1/ϖⁿ; x^(a+b−6) at (4,2) is x⁰; ε(Frob)=q⁻¹ | sound |
| 1.1 | g=1, ψ₁↦uψ₁; g=0 | ψ₂=c(uψ₁ᵗ)⁻¹=(c/u)(ψ₁ᵗ)⁻¹; g=0 leaves G_m | sound; R03 |
| 1.2 | m′=1, m=(123)∈GL₃, f=m₂₁ | f(m⁻¹)=P₁₂=0 vs f(m)=1; (mb)₂₁=m₂₁b₁₁ | README correct |
| 1.3 | (1,0),(1,1),(0,0); (k,r)=(0,2) | ranks 2,1,1; Ω^(0,2)=ω(2,2)=det² | sound; R14 |
| 1.4 | Spec O, D=∅; O→ϖ→O | C=O[0]; H⁰=0,H¹=k vs derived H⁰=H¹=k | sound |
| 1.5 | O=ℤ₃[√3] | different (2ϖ)=(ϖ); inverse different ϖ⁻¹O≠O | sound |
| 1.6 | genus-1 curve over A₁ | RΓ(ω)[1]: H⁻¹=k, H⁰=k ≠ k[0]; H_i≅H^(d−i) by self-injectivity of Aₙ | sound |
| 2.1 | trivial C₂-torsor, ℤ/4 | term (ℤ/4)²=Aₙ[C₂]; invariants rank 1 vs 2 | sound |
| 2.2 | trivial C₂ over 𝔽₂ | f_*O=𝔽₂[C₂] free; |Δ|=0 in k | sound |
| 2.3 | A=O, N=O, C₂, n=2 | quotient A₂[C₂], free rank 1 | sound; R16 |
| 2.4 | trivial Δ-torsor | model Aₙ[Δ][0] | sound |
| 2.5 | k[C₂], char 2 | Tor_j(k,k)=k ∀j; five-term H₂→Tor₂(H₀)→(H₁)_Δ→H₁→Tor₁(H₀)→0 | sound |
| 3.0a | I=(0),(1); O→ϖ→O; k[x],(x) | Ẑ=X,U=∅ / Ẑ=∅,U=X; k in degrees 0,1; H¹_(x)=k[x,x⁻¹]/k[x] vs k[[x]] | Checks sound; R09 |
| 3.0b | identity; [p]; q=tᵖ | operator 1; p and 1/p; dq=pt^(p−1)dt vanishes at 0 | sound |
| 3.1 | p₁=p₂=id | id^!=id, so arrows are Hom(F,G) | sound |
| 3.2 | degree-r étale cover | tr∘pull=r on H⁰(O) | sound |
| 3.3 | degree-2 then degree-3 graphs | composite scalar 6 | sound |
| 3.4 | identity; A×A→A | class 1↦1; trace 1↦2 | sound |
| 3.5 | trivial 𝔽_p[C_p]-module | H_i(C_p,𝔽_p)=𝔽_p ∀i | sound |
| 3.6 | ℤ→𝔽₂ | Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂≠0 | sound |
| 3.7 | scalar u; α=0 | operator ×u; 0 | sound; R11 |
| 3.8 | [p] on Hodge line | rationally invertible, integrally p | sound |
| 3.9 | order-3 permutation P | ⟨Pe₁,e₂⟩=⟨e₁,P⁻¹e₂⟩; Pᵗ=P⁻¹≠P | sound |
| 3.10 | X={0,1}, p₂≡0 | Z={0}: {0}⊆X; Z={1}: {1}⊄∅ | sound |
| 3.11 | k[x], I=(x) | lim k[x]/xⁿ=k[[x]] | sound |
| 3.12 | Z₀=X | E₁^(0,t)=H^t(X,F), others 0 | sound |
| 3.13 | unit coset; central x at (4,2),(5,2) | 1; x⁰, x¹ | sound |
| Layer 4 intro | A[0], A projective | Hom_K=Hom_D=A | sound |
| 4.1 | ℓ=2; (4,2),(5,2) | similitude 2 → 1/8; similitude 4 → 1/64; exponents 0,1 | sound; R12 |
| 4.2 | ϖ²·id on O; O/ϖ | U=id; 0 and id both solve ϖU=0 | sound |
| 4.3 | q=2,(1,3,2); q=1,(1,4,4) | X⁴−3X³+14X²−24X+64; (X−1)⁴; e₃=q³T₀e₁ | sound; R14 |
| 4.4 | ℙ¹_ℂ; C₂ in char 2 | H⁰=ℂ,H¹=0; shear has no invariant splitting | sound |
| 5.0 model | F=ℚ; t↦−t; p=3,2 | dims 3,2,≤1; fixed points 0,∞; ((1+σ)/2)²=(1+σ)/2; 1/2 absent at p=2 | sound |
| 5.0 EO | F=ℚ | ᴹW for the Siegel parabolic has lengths 0,1,2,3 | sound |
| 5.0 boundary | k[x,y]/(xⁿ); k[x,y]/(xy,x²) | y is a non-zero-divisor; y·x=0 | sound |
| 5.1 | zero cone; ray | empty intersection = σ∨; ray: ℤ≥0 vs ℤ>0 | sound |
| 5.2 | E=O versus E=I_D, at n=0 | O(−0·D′) is canonical and outside the range; I_D at n=0 is subcanonical and inside (Lan17 Theorem 8.6) | sound |
| 5.3 | w̃₁,w̃₂,w̃₃ | (β+2+t,−α+t),(α+3+t,1−β+t),(α+3+t,β+3+t), matching CG20 line 992–1008 | sound; R08 |
| 5.4 | (4,2), p=7 | t=2, α=β=0; α+β=a−b−2≤p−4 | sound |
| 5.5 | (4,2), p=7 | t=1, α=β=0 gives (4,2); a+b≥6 ⇔ t≥1 | sound |
| 5.6 | (4,4), p=7 | t=1, α=β=0; b<4 excluded | sound |
| 5.7 | Sym^n E^∨, n<p | ≅Sym^nE⊗det^(−n), giving ω(3−b,3−a)(−D); applied twice gives the identity | sound |
| 5.8 | a=4,p=5; a=3,p=5 | via 5.5 (b=2); ω(3,0) self-dual, 5.4 with a−b=3≤3 | sound |
| 5.9 | H¹(X_k)=0 | H¹(X_O)/ϖ↪0 ⇒ H¹(X_O)=0 ⇒ both surjections | sound |
| 5.10 | F=ℚ | Z₁=V(Ha) has codim 1; superspecial Z₃ has codim 3; Zᵢ∖Zᵢ₊₁→X is a base change of affine minimal strata, hence affine (BCGP21 Theorem 3.9.6 hypotheses) | sound |
| 5.11 | k[x,y]/(xⁿ), boundary y | injective ⇔ y non-zero-divisor; Siegel: no component of V(f*Ha) lies in D | sound |
| 5.12 | prime-to-p isogeny | p₂⁻¹(stratum)=p₁⁻¹(stratum) | sound |
| 5.13 | G₁ factor | requires p∤#Δ (Lemma 3.8.5 counterexample) | sound |
| 5.14 | Aₙ×Aₙ on C⊕D | (1,0) selects C | sound |
| 5.15 | ρ=1⊕1⊕1⊕χ, χ≠1, in GL₄ | any pairing of characters gives products 1 and χ, which differ, so there is no alternating form with a multiplier | sound |
| 5.16 | O[t]/(t(t−ϖ)) | T/ϖ=k[t]/t² local; T⊗E=E×E; M_(m,ℂ)=ℂ² | sound |
| 6.1 | D=∅ | H̄=H_can | sound |
| 6.2–6.3 | V trivial, i=0 | H⁰(X,O)=ℂ, spanned by the constant non-cuspidal form; A_cusp would give 0 | sound |
| 6.4 | ω(4,2): i=0 and i=1 | i=0: H⁰_cusp=H̄⁰=H⁰_sub; i=1: injection into H̄¹ only (CG20 Theorem 5.2) | sound |
| 6.5 | zero source | image 0 | sound |
| 6.6 | multiplicity m, dim 1 | m·dim π_f^K | sound |
| 6.7 | c=3−a−b; γ∈G(ℚ) | a+b+2c=6−a−b; (g,w)↦(g,ν(g)⁻¹w) off by ν(γ) | README correct |
| 6.8 | (k,r)=(0,2),(0,3) | λ=(−1,0;4),(−2,−1;6); λ₂−λ₁−1=k, 2−λ₂=r | sound |
| 6.9 | two places, l=2 | degree-one count 2 | sound |
| 7.0 | (4,2),w=0; (5,2),w=1 | {3/2,3/2,−3/2,−3/2} sum 0; {3/2,3/2,−5/2,−5/2} sum −2w | sound vs CG20; R02, R13 |
| 7.1 | (4,3) | (3,1) interior of C₀ ⇒ degree 0 only | sound |
| 7.2 | (2,1); the three families | (1,−1)∈C₁∩C₂; (a−1,0)∈C₀∩C₁; (x,−x)∈C₁∩C₂; (0,b−2)∈C₂∩C₃ | sound |
| 7.3 | k=R−1 | −λ₁=k+1=R | sound |
| 8.1 | Klingen and Siegel/Borel parabolics | Klingen: G_h=GL₂, G_ℓ=GL₁; Siegel/Borel: G_h trivial, G_ℓ=GL₂×GL₁ or GL₁³ (CG20 line 2042–2044) | sound |
| 8.2 | boundary eigensystems | ρ₂⊕ρ₂χ or sums of characters, all reducible, so they vanish at irreducible m in every degree | sound |
| 8.3 | k=0, k>0 | ω² vs ω^(k+2)(−cusp) | sound |
| 8.4 | antidiagonal J, ν=ϖ | (1,1,ϖ,ϖ),(1,ϖ,1,ϖ),(ϖ,1,ϖ,1),(ϖ,ϖ,1,1) distinct | sound |
| 8.5 | BCGP21 Lemma 3.10.7 | non-parallel: point contribution 0; π_*=ω(k_v) | sound |
| 8.6 | LES with H⁰(D)_m=0 | H⁰ isomorphism; H¹ injective with image H̄¹ | sound |
| 8.7 | a=2 | (1,0)∈C₀∩C₁ | sound; R02 |
| 8.8 | i=1, two places with l_v=2 | π non-holomorphic at exactly one of the two, holomorphic wherever l_v>2 | sound |
| 8.9 | l₀=1 (ℚ), 2, 0 | h¹=h⁰, 2h⁰, 0 | sound; R02 |
| Worked examples | p=7,(4,2); substitutions | t=max(1,b,⌈(a+b−2)/2⌉)=2 ⇒ α=β=0; length two t=1; length three t=b−3 | sound |

## Not verifiable

- **GK19 Remark 10.1.3, p. 962.** Paywalled and settled as `uncertified`; not opened.
- **Freitag, Siegelsche Modulfunktionen, IV, Satz 4.4.** Not in the manifest. The README already makes the boundary identity T_(ℓ,2)=2T_ℓ its own target (§8.3).
- **BR16 numbering.** The README says Proposition 1.14 is numbered 1.5.8 in the version BCGP21 cites; only arXiv v1 was read.
- **Clausen–Scholze, Lectures on condensed mathematics, Theorem 9.8 and Lecture XI.** Not in the manifest and not fetched, so whether the solid formalism extends to arbitrary discrete base rings (R09) was not checked.
- **Publication data of BP26 (Invent. Math. 244 (2026)).** Not checked against a published copy. Locators were checked in the cached author manuscript.
- **CG20 Theorem 5.6(1) against cancellation in (𝔭,K)-cohomology.** The central-sign tension in R13 was not resolved from the sources. The finding asks only for a reconciling Check.

## Source issues

- **Misprint** in BP26 at §4.3.1, p. 46: the source says the left translation sends f to m↦f(m⁻¹m′), which fails the identity law; it should be m↦f(m′⁻¹m); affects nothing.
- **Misprint** in P20 at §5.3, p. 24: the source says the holomorphic parameter is (1−k+r,2−r;k+2r); it should be (1−k−r,2−r;k+2r), as on p. 25; affects nothing.
- **Misprint** in P20 at proof of Corollary 15.2.3.1, p. 109: the source says the boundary sheaf ω² occurs when k=2; it should be when k=0, as two lines earlier; affects nothing.
- **Misprint** in P20 at Corollary 15.2.3.1, p. 108: the source says the H¹ identity without the subscript m; it should be localized at m like the H⁰ identity; affects a stated result.
- **Misprint** in P20 at Theorem 15.2.2.1(2), p. 108: the source says the large-weight condition is λ₁≥R although λ₁=−k−1<0; it should be −λ₁≥R; affects a stated result.
- **Misprint** in BCGP21 at proof of Lemma 3.10.7, printed p. 238: the source says the four Satake monomials but repeats [1,ϖ,1,ϖ]; it should list [1,1,ϖ,ϖ],[1,ϖ,1,ϖ],[ϖ,1,ϖ,1],[ϖ,ϖ,1,1]; affects the proof.
- **Error** in BCGP21 at Lemma 3.8.5, printed p. 220: the source says f_*O_T=O_S⊕I_G⊗f_*O_T for every finite étale Galois cover; this needs #G invertible on S (fails for the trivial 𝔽₂ double cover); affects the proof.
- **Gap** in BCGP21 at Lemma 3.9.12, printed p. 230: the source says injectivity into the interior follows directly; it needs that no component of the regular-sequence thickenings lies in the boundary; affects the proof.
- **Error** in CG20 at §5.3, p. 26: the source says (g,w)↦(g,η(g)⁻¹w) is G(ℚ)-equivariant; it is equivariant only up to the scalar η(γ) and needs an adelic norm/sign correction; affects the proof.
- **Misprint** in CG20 at §5.3, p. 28: the source says Weyl chambers C₀,…,C₄; it should be the four chambers C₀,…,C₃; affects nothing.
- **Misprint** in BP26 at proof of Proposition 2.9.9, p. 29: the source says the target uses (j_l)_* and places the inverse-image opens in X; it should use (j_l)_! with opens in C; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "db967e1", "job": "REV-PKG-AutomorphicBundlesPartII", "model": "opus", "worker": "fable-rev41"} -->
