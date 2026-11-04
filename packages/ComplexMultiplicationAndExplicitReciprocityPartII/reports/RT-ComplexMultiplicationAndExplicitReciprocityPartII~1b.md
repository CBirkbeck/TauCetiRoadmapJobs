<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1113#issuecomment-6399860198 -->
Red team round 1 pass b (claude) of 6e5cf00

Verdict: needs_changes

1. **F01** (P3) Artin direction imported from ShimuraVarieties is geometric, README reads it as arithmetic

   Location: `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:28` (Conventions, "Arithmetic Artin sends a uniformizer to arithmetic Frobenius"), `README.md:125` (contract: "Consume ShimuraVarieties §§4.1–4.6 … for arithmetic reciprocity"), `README.md:290` (§1.3: "Apply the fixed arithmetic Artin map to the distinguished reflex norm").

   Claim: the canonical CM stack `Y_K` with "its Artin reciprocity action" is imported from ShimuraVarieties §§4.1–4.6 and then used with the arithmetic Artin map.

   Witness: ShimuraVarieties §4.1 at its head (its README at the open head, line 979) defines `geometricArtin` by `art_F(s)=rec_F(s)⁻¹` and says "all reflex-norm formulas here use `art_F`"; its Check: `art_F(π_v)` is inverse arithmetic Frobenius. GrossZagierAndArithmeticHeights §0a.4 (its README at the open head, line 231) converts explicitly: "Convert the supplier's geometric Artin formula by s↦s⁻¹". This README never states the conversion, so the Galois action on `Y_K(ℚ̄)` it inherits is the inverse of the one its Conventions and §2.1 ("the unit character of local reciprocity in the fixed Artin convention", `χ_π(Art(u))=u⁻¹`) assume. Image subgroups (inertia lands in `K₀,p`, §1.3) are unchanged, so no target is false; the normalization of the action is.

   Repair: in Conventions after "the Lubin–Tate unit action is inverse", add: "ShimuraVarieties §4.1 supplies the geometric map `art_F=rec_F⁻¹`; every ShimuraVarieties reciprocity formula consumed here is converted by `s↦s⁻¹` before use, as GrossZagierAndArithmeticHeights §0a.4 does." In the ShimuraVarieties contract replace "for arithmetic reciprocity" by "for reciprocity in its geometric normalization, converted by `s↦s⁻¹`". In §1.3 proof route, replace "Apply the fixed arithmetic Artin map to the distinguished reflex norm" by "Invert the supplied geometric action and apply the arithmetic Artin map to the distinguished reflex norm". Tested on the ℚ₅ witness of the Conventions: under `rec`, the unit 2 acts on Lubin–Tate 5-torsion by 3; under the supplier's `art` it acts by 2; the added sentence makes the README's 3 the value used.

2. **F02** (P3) Needs lines cite supplier sections absent from the exact supplier contracts

   Location: `README.md:620` (§4.2 *Needs:* "ShimuraVarieties §§6.1–6.2 for Hodge-type canonical models; … MetaplecticAutomorphicForms Layers 4–7"), `README.md:641` (§4.2a *Needs:* "MetaplecticAutomorphicForms Layers 4–7"), `README.md:665`, `README.md:691` (§§4.2b, 4.2c, same), `README.md:702` (Layer 4 Dependencies: "ShimuraVarieties §§6.1–6.2; … MetaplecticAutomorphicForms Layers 4–7").

   Claim: every consumed supplier section is listed under "Exact supplier contracts".

   Witness: the ShimuraVarieties contract (`README.md:123–125`) lists only §§4.1–4.6, 5.1–5.11 and 8.1–8.6; the MetaplecticAutomorphicForms contract (`README.md:146`) lists only Layer 7. ShimuraVarieties §§6.1–6.2 (`hodge_inheritance`, `hodge_canonical`) and MetaplecticAutomorphicForms Layers 4–6 (adelic metaplectic covers and finite Weil representations; global theta kernels; Siegel–Weil and see-saw) exist at the heads (their READMEs at the open heads, lines 1622, 1641 and 1149, 1291, 1538) and are what §4.2's Weil representation and theta lift use.

   Repair: in the ShimuraVarieties contract, change "Consume ShimuraVarieties §§4.1–4.6, 5.1–5.11 and 8.1–8.6" to "Consume ShimuraVarieties §§4.1–4.6, 5.1–5.11, 6.1–6.2 and 8.1–8.6 for arithmetic reciprocity, finite étale generic CM stacks, actual CM varieties, potential good reduction, Hodge-type canonical models and the canonical Hecke tower". In the MetaplecticAutomorphicForms contract, change "Consume Layer 7 for the rank-one half-integral-weight and Whittaker framework" to "Consume Layers 4–7 for the adelic metaplectic cover and finite Weil representation, the global theta kernels, the Siegel–Weil and see-saw identities, and the half-integral-weight Whittaker framework".

3. **F03** (P3) Layer 8 skips §8.2

   Location: `README.md:936` ("### 8.1 Modified CM self-intersection"), `README.md:944` ("### 8.3 Height of the quaternionic CM point"); cited as "§8.3" at `README.md:964`, `README.md:974`.

   Claim: targets are numbered consecutively within a layer, so that consumers can cite them by section.

   Witness: Layer 8 has §8.1 and §8.3 and no §8.2; no other roadmap or board package cites "ComplexMultiplicationAndExplicitReciprocityPartII §8.3" (`roadmaps grep` finds no match), so renumbering breaks nothing.

   Repair: rename "### 8.3 Height of the quaternionic CM point" to "### 8.2 Height of the quaternionic CM point" and replace "§8.3 height of the quaternionic cm point" by "§8.2 height of the quaternionic cm point" in §9.1's *Needs:* line and Layer 9 Dependencies, and "§8.3" by "§8.2" in the §8 proof-route cross-references.

Three P3 findings (a convention mismatch with a supplier, two incomplete supplier contracts, a numbering gap). Both `Suggested.lean` declarations are true as typed and at the README's generality; no P1 or P2 finding survived the pass.

## Verified sound

Counts: 2 declarations read (both); 68 numbered README targets read (every line of the 1281-line README); 59 source locators verified against the cached texts (T 11, A 34, Y 9, YE 4, T12 3, PT 2, PT14 2, MZ 1, C 2); 61 Checks and worked-example values recomputed; 117 supplier section citations resolved against main or the open heads (every section header named in a *Needs:* line, a contract or a Dependencies list was found: ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2, 2.1–2.3, Layers 4–5; AbelianSchemesAndArithmeticModuli A4.1, A4.3, A4.CR.7.2, A5.1–A5.7, A6.1, A6.4, A6.5, A6.8, A6.22, A6.25, A6.37, A6.38; ArakelovGeometryAndAbelianHeights 1.3, 1.11, 1.13, 1.14, 2.1, 2.7, 2.10, 3.4, 3.5, 4.6, 4.7, 4.8, 6.5; AnalyticNumberTheoryPartI 2.2, 2.31d–f, 2.32, 2.44–2.46, 3.27; AutomorphicLFunctionsAndLocalFactors AL.1 "CM quadratic completion and orbital comparisons"; AutomorphicBundles B1.1–B1.3, Layer B2, B2.7, B4.10; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.15, R07.2.16, R07.2.20, Layer R07.4; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2 "Lubin–Tate character" and "Comparison with local reciprocity" (board package, design stage, merge order 57); NeronModelsAndSemistableAbelianVarieties 1.5, 5.1, 5.2; ReductiveGroups Layer 4; ReductiveGroupsPartII RG2.0a.2; ShimuraData Layers 1, 3; ShimuraVarieties 4.1–4.6, 5.1–5.11, 6.1–6.2, 8.1–8.6; PELModuli M2.1–M2.3, M3.9, Layer M5, M6.1, M6.2, M6.8–M6.10; FaltingsFinitenessAndIsogenyTheoremsPartII QI.5 "Geometric isogeny estimate" (board package, design stage, merge order 50); ClassFieldTheory Layer 13; IntegralIwasawaTheory §3.4 `classNorm_cokernel`; GlobalNumberFields Layer 11; GeometryOfNumbersAndQuadraticArithmetic 0.1–0.3, 1.2, 1.5, 2.2, 2.7–2.9; HilbertModularVarietiesAndShimuraCurves Layer R18.1, R18.2.12–R18.2.18, Layer R18.5; GrossZagierAndArithmeticHeights 0a.4, 0.1, 0.5, 0.9–0.11, 2.1, 2.9, 2.14, 6.5–6.8, 6.21, 6.25, 6.56, 7.15, 7.28, 7.65–7.67, 7.77, 7.78; MetaplecticAutomorphicForms Layers 4–7; HeightsRationalPointsAndObstructions 0.11–0.13, 0.16; DiophantineApproximationAndTranscendence 0.2–0.3; CyclotomicClassGroupsAndStickelberger 3.4); 20 pinned library declarations checked at the pins with file and line (Mathlib `NumberField.IsCMField` CMField.lean:69, `complexConj`:141, `complexConj_apply_apply`:163, `indexRealUnits_eq_one_or_two`:372, `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`:438, `classNumber` ClassNumber.lean:64, `classNumber_pos`:69, `exists_ideal_in_class_of_norm_le`:77, `Scheme.Hom.finrank` FlatRank.lean:88 (built on `IsAffine.finrank`, line 57, the rank of `f.appTop` at the point), `one_le_finrank_iff_surjective`:201 under `[Flat f] [IsFinite f]`, `isLocallyConstant_finrank`:231 also under `[LocallyOfFinitePresentation f]`; Tau Ceti `AbelianVariety` Basic.lean:95, `dim`:118 (topological Krull dimension), `zeroPoint`:171, `End` End/Basic.lean:83 with `instRing`:168, `End.toHom`:92, `IsIsogeny` Isogeny.lean:61 (finite and surjective), `Hom.toSchemeHom` Hom/Basic.lean:133, `card_ideal_absNorm_le` IdealCount/Basic.lean:399, `abs_discr_le_of_basis_isIntegral` Discriminant/Basic.lean:61).

Dependency gate, complete output:

```text
moved: ComplexMultiplicationAndExplicitReciprocityPartII moved in the merge order from #229 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 52 roadmaps, 603 edges, 0 problem(s)
```

No UPWARD or CYCLE line. AutomorphicBundles is an open pull request adding a new roadmap folder (5644-line README at its head), so it is an admissible supplier; the `moved:` line is not a defect.

Gaps: the eight `gaps` entries of `design/plan.json` match the eight README contract lines character for character (checked by script); every slug has a named supplier whose cited section exists at the head (ArakelovGeometryAndAbelianHeights §4.7 assumes local freeness of the τ-quotients, matching the gap; HilbertModularVarietiesAndShimuraCurves §§R18.2.17–R18.2.18 assume `F_v/ℚ_p` unramified, matching the gap; AutomorphicBundles §B1.3 lists only Betti–de Rham, Betti–étale and Galois-descent items and §B2.7 says it adds no crystalline or `B_dR` assertion, matching the gap; ClassFieldTheory Layer 13 has the narrow Hilbert class field but no norm-image theorem; GlobalNumberFields Layer 11 has orders in a field only; GeometryOfNumbersAndQuadraticArithmetic §§1.2, 1.5, 2.7 have successive minima, Minkowski and hermitian lattices but no quantitative Siegel reduction). Each `needs` sentence is precise and asks for nothing the pins or an earlier roadmap already provides.

Ownership: `roadmaps grep` over main, all 363 open heads and the board finds no other statement of the relative class-number growth, of Tsimerman's Proposition 2.2, of the total reflex determinant, of the center-order orbit bound or of the CM lift height; GrossZagierAndArithmeticHeights (read at its open head) supplies the kernels, the diagonal coefficient `Ωφ/e` (§7.28) and the adjunction identity (§7.78) but states neither Yuan–Zhang Theorem 9.1 nor Theorem 1.7, so §§8.1 and 8.3 here are not duplicates. CyclotomicClassGroupsAndStickelberger §3.4 and §4.1 concern abelian CM fields and determinant bounds, a different statement. Neither Lean name occurs in any other roadmap's `Suggested.lean`.

Policy: the pull request changes only the package folder (8 files, all under `packages/ComplexMultiplicationAndExplicitReciprocityPartII/`); no `lemma`, no `set_option`, no pull-request number or process word in README or docstrings (the only "Lemma" hits are source locators); every target carries a locator and a source line; `Suggested.lean` imports `Mathlib` and one existing Tau Ceti module, has no `def`, `instance` or example, and both declarations are `theorem … := by sorry`.

Lean versus README: I compared each elaborated type in the worker's signature listing with the README statement (I did not run Lean; the brief forbids builds here). `relative_class_number_growth`: ∃C>0 ∀E CM of degree 2g, `C·|discr E|^(1/4−ε) ≤ h_E/h_{E⁺}`, same quantifier order as §10.1; the uniform constant is outside ∀E. `distant_cm_isogenies`: A fixed first (∀A ∀ι ∃B ∃κ), the intertwining law `(ι a).toHom ≫ f = f ≫ (κ a).toHom` reads `f∘ι(a)=κ(a)∘f` in Lean's composition order, and the bound ranges over all isogenies `A ⟶ B`, as §10.2 states; no binder was lost. Headlines not statable: no Faltings height, CM type, moduli field or Siegel-space carrier exists in the pinned Tau Ceti (grep for `FaltingsHeight`, `faltingsHeight`, `CMType`, `IsCM` under `TauCeti/` finds none). The unpolarized form of §11.3 could be encoded with `AbelianVariety.baseChange` along a twisted `Algebra ℚ̄ ℚ̄` instance and a setoid of isomorphism classes; I judged that a long ad hoc encoding of the kind the brief excludes, and §11.3 itself is stated on polarized coarse moduli points, so I raise no finding.

Adversarial pass (every row carries the values computed):

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| `relative_class_number_growth` | g=1, E=ℚ(i), ℚ(√−3); ε≥1/4; E/F with h_F∤h_E | h_E/h_F ≥ 1 always (E/F ramified at ∞ forces `E∩H(F)=F`, norm surjective, h_F∣h_E). Brauer–Siegel: h_E R_E ≥ cD_E^{1/2−ε}, h_F R_F ≤ CD_F^{1/2+ε}, R_E/R_F = 2^{g−1}/Q_E ∈ {2^{g−2},2^{g−1}}, D_F ≤ D_E^{1/2} ⇒ ratio ≥ c′D_E^{1/4−3ε/2}. ε≥1/4: exponent ≤0, C≤1 suffices. | True; none |
| `distant_cm_isogenies`, primitivity | ι: O_E ≅ End A, A imprimitive of type induced from E₁ | A ∼ B^{[E:E₁]}, End⁰A ⊇ M_r(E₁) ≠ E, contradicting End A = O_E; so Φ primitive and A simple | Hypothesis forces T's setting; none |
| `distant_cm_isogenies`, all isogenies linear | f arbitrary isogeny, g intertwining | h = g⁻¹f ∈ End⁰A = E commutative ⇒ fι(a) = gι(a)h = κ(a)gh = κ(a)f | Bound over all f equals T's bound over ideal isogenies; none |
| `distant_cm_isogenies`, vacuous E | E = ℚ(i,√2) | all four types induced from ℚ(i) or ℚ(√−2) (README §1.5 Check), so no A with End A = O_E; statement vacuous, not false | none |
| `distant_cm_isogenies`, degree | id; [2] on an elliptic curve; (1+i) on ℂ/ℤ[i] | finrank at the zero point: 1; 4 = #E[2]; 2 = N(1+i) (kernel (1+i)⁻¹ℤ[i]/ℤ[i] of order 2) | native degree correct (ASAM A6.1 uses the same) |
| `distant_cm_isogenies`, small discriminant | ℚ(i), ℚ(√−3), ε=1/8, c=4^{−1/8} | h_E=1 ⇒ B=A, min degree 1; bounds 1 and (3/4)^{1/8}=0.9647 ≤ 1 | none |
| Conventions metric shifts | ℂ/ℤ[i] | |∫dz∧dz̄| = 2·area = 2; Fal = 2^{−1}·2 = 1; Del = π^{−1}·1; h_un = h_Fal − ½log2, h_YZ = h_un + ½log(2π) (Arakelov §2.7 agrees) | none |
| Conventions D_E = D_F²d_{E/F} | ℚ(i): D_E=4, D_F=1, d=4; conductor-2 order: f²D=16 | both sides 4; 16 | none |
| §0.1 CM⁰ ⊋ H_CM | constant 1; a⁰_Φ at c | 1(c)+1(1)=2 constant ⇒ 1∈CM⁰; a⁰_Φ(c)=|Φ∩cΦ|=0 (c central in the CM closure) ⇒ 1∉H_CM | source overclaim in A Thm 9.1.5 recorded; README correct |
| §0.1 C₂×S₃ Check | Φ={(1,e),(1,(12)),(0,(13)),(0,(23)),(0,(123)),(0,(132))} | (12)·{e,(12)} = {(12),e}, (12)·rest = rest ⇒ overlap 6; (13): (13)(123)=(12),(13)(132)=(23), overlap 1+1=2; class {(12),(13),(23)} average 10/3; c-translates 0,4,4 average 8/3; sum 6 = |Φ| | none |
| §0.1/0.4 C₆ Check | f=(0,1,1,0,−1,−1), c=r³ | f(s)+f(r³s) = 0,0,0 for s=1,r,r² ⇒ f∈CM⁰; f(r)=1≠f(r⁵)=−1 while a(σ⁻¹)=|Φ∩σ⁻¹Φ|=|σΦ∩Φ|=a(σ) ⇒ f∉H_CM | none |
| §0.3 average character | d=1; d=2; Z̃ applied | (1/2^d)Σa⁰ = d/2 + ½Ind χ; d=1: (1+χ)/2; d=2: 1+Indχ/2. Z̃: −(d/2)log(2π) − ℓ(0)/2 − ¼log(D_E/D_F) with f(Indχ)=D_F N(f_χ)=D_E/D_F, ζ′(0)/ζ(0)=log 2π | agrees with A Thm A and (9.3.1); none |
| §1.1 torus | d=1,2; single-embedding vector | diagonal kernel G_m∩ker N_{F/ℚ} = μ_d: μ₁, μ₂; dim T = 2d−(d−1) = d+1; vector e_ι has a_ι+a_{cι} = 1 at one pair, 0 elsewhere ⇒ not a character when d>1 | none |
| §1.2 K₀,p | ramified E_𝔭/F_𝔭; ℚ(√−3) at 2 | uniformizer class: odd valuation, compact of order 2, not in r(O_E,𝔭×); A's K₀,p (extension of K_{so,p} by ℤ_p×) and ℤ_p×·r(O_{E,p}×) are extensions of the same group by ℤ_p× with one inside the other ⇒ equal; K₀,2 = O_{E,2}× for E=ℚ(√−3) (2 inert) | none; A's "maximal compact" recorded as misprint |
| §1.5 total reflex | ℚ(i,√2); d=3 | two Galois orbits of size 2, reflex fields ℚ(i), ℚ(√−2) ⇒ E♯ product of degree 4; d=3: degree 8, dim 4 | none |
| §2.6 standard line | ℚ(i): f₁, f_i; z=(1,i) | f_i∘f_i(x)=i·conj(i x̄)=x; Q₀(f₁)=Tr_{ℚ/ℚ}(1)=1; B(z,z̄)=B(e₁,e₁)+B(e₂,e₂)=2+2=4 > 0, so A's ‖z‖²=−[z,z̄]₀ would be −4 | README correction right; source misprint recorded |
| §3.1 determinant | d=1,3; (π,1,1,1); k[ε]/ε² | exponent r=2^{d−1}: 1, 4; det π, cokernel length 1; det ε with ε²=0 not a Cartier divisor | none |
| §3.2–3.3 partition quotient | A=ℤ₃, B=C=ℤ₃[π], π²=3, Υ singleton; B=A×A singletons; Υ=∅ | K_Υ+K_Υc=(x−π,x+π)=(x−π,2π) ⇒ C/(2π), length 1; cross-pair formula v(2π)=1; A's Lemma 9.4.4 gives 0+0−½v(3)=−1; A×A: (0×C)+(C×0)=all ⇒ 0; ∅ ⇒ 0 | README formula right; source sign error recorded |
| §3.5 conductor values | same ℚ₃(√3) | μ(a_ηη)=v_P(π)/e_P=1/2 each; (e_P/2)(1/2+1/2)=+1 = length; A's −½e_P(…) = −1 | README sign right; source error recorded |
| §3.6 volume degree | trace-one η, r=2^{d−1}, deg_C over one embedding | Tr_dR η = (2πi)^{−r}∫η = 1 ⇒ |∫η| = (2π)^r; deĝ(det H_dR^∨) per complex point −r log 2π; 2d embeddings per deg_C unit ⇒ deĝ(det H_dR)/deg_C = 2d·2^{d−1}log 2π = 2^d d log 2π; with A's (2π)^{−r} the sign of the (d/2)log 2π term in Thm 9.4.2 would flip | README right; source error recorded |
| §3.7–3.8 Δ degree | Σ_q over O_E | Σ_q 2^{d−2}v_q(d_F O_E) log N(q) = 2^{d−2}·2 log D_F = 2^{d−1}log D_F = A Prop 9.4.1 | none |
| §4.1 signature | d=1, ξ=−1; general | per real place ι: ι(ξ)|x|² on ℂ has signature (2,0) or (0,2) ⇒ (2d−2,2); d=1: (0,2) | none |
| §4.2 metric | Q=−x²−y², z=(1,i) | B(z,z̄) = −2−2 = −4, ‖z‖² = 4 | none |
| §4.2c rank-one Check | E=ℚ(i,√2), F=ℚ(√2), ξ=√2 | ξxx̄ = 4(a₁a₂+b₁b₂)+√2(…), Tr_{F/ℚ} = 8(a₁a₂+b₁b₂), signature (2,2); ⟨1⟩∨=½ℤ, Q(½)=¼ ∉ ℤ ⇒ maximal, D_{L⋄}=2, D⁻¹Λ=½ℤ represents k²/4 | none |
| §4.2c analytic side | E_error=0 | −2Λ′/Λ(0) − d log(4πe^γ) with Λ′/Λ(0) = ℓ(0)+½logQ−(d/2)log(4πe^γ) (A (6.0.2); recomputed from ψ_ℝ(1) = −½logπ−γ/2−log2) ⇒ −2ℓ(0)−log Q | none |
| §4.5 elimination | a log2 + b log3 = 0, a,b∈ℚ | 2^m3^n = 1 ⇒ m=n=0 | none |
| §5.2–5.4 nearby average | g=1,2,3 edge counts; coefficient | g·2^{g−1}: 1,4,12; each h(Φ,τ) once as endpoint, edge carries ½ ⇒ 2^{1−g} (Y Cor 2.6 agrees) | none |
| §6.5 example | ℚ_p(√p), p odd; ℚ₂(√2) | O_L/(2√p) length v_L(2√p)=1; v_L(2√2)=2+1=3 | none |
| §7.1 ramification parity | g odd ≥3, S=∅; g even, |S|=1; g=1, |S|=2 | totals g, g+1, 3: odd and ≥3; switching one real place leaves an even count ≥2 (Y Thm 1.7 needs ≥2) | none |
| §7.4+§8.3 ⇒ §9.1 | substitute | h_L/2 − ¼log(d_𝔹D_F) = −ℓ/2 + ¼log(d_𝔹/d_{E/F}) − ¼log d_𝔹 − ¼log D_F = −ℓ/2 − ¼log(D_E/D_F) | d_𝔹 cancels; none |
| §8.1→§8.3 | Y Thm 9.1, adjunction | i₀/e = ℓ+½log(d_{E/F}/d_𝔹) = −h_L ⇒ h_L = −ℓ+½log(d_𝔹/d_{E/F}) = Y Thm 1.7 | none |
| §10.3 functional equation | ψ_ℝ(1), ψ_ℝ(2) | ℓ(0) = −ℓ(1) − logQ + g(log 2π + γ) ⇒ mean h_Falt = ℓ(1)/2 + ¼logQ − gγ/2 − g log 2π | matches README; none |
| §10.3 average to individual | m=2, b=−1, heights (−1,3) | mean 1; h₂ ≤ 2·1−(2−1)(−1) = 3 | none |
| §11.1 bounds | g=1 | 2·3⁴=162; 4·3⁸=26244; [F′_AF′_B:F_A] ≤ [F′_A:F_A][F′_B:F_B] since F_B⊂F′_A | none |
| §11.1 unit Check | u=(1+√2)⁸ | (3+2√2)²=17+12√2, (17+12√2)²=577+408√2; 577≡1, 408≡0 (mod 3); uū=u²≠1 | none |
| §11.2 exponents | κ=2, δ=1/16, a=3/16, ε=1/32 | δκ=1/8<3/16<1/4, εκ=1/16<3/16 | none |
| §12.1 center | A₀ⁿ; conductor-f elliptic order | Z(M_n(O)) = O once; |disc| = f²D_E (ℤ+2ℤ[i]: 16) | none |
| §12.2 unit index | ker r / H | injects into U⁺/N(U), a quotient of U⁺/(U⁺)², size ≤ 2^h | none |
| §13.1 degree | product center algebra, Σ[K_i:ℚ] ≤ 2g | Galois group acts faithfully on ≤2g embeddings ⇒ degree ≤ (2g)!; with i: 2(2g)! = 4, 48 for g=1,2 | none |
| §13.2 covolume | ℤ[i] | 2^{−1}√4 = 1; e_R J ⊂ I ⊂ J, [J:I] ≤ e_R^{2g} | none |
| §3.4 digit Check | ℤ_p → ℂ, x ↦ Σa_n(2p)^{−n−1} | tail after digit N is < (2p)^{−N−1}·(p−1)/(2p−1) < one digit step ⇒ injective and continuous, infinite image | legitimate negative control |

Settled findings: the repair reports mark no finding `not actionable in this package`; none is re-raised.

## Not verifiable

- The binder check by `#check @name` was not run: the brief forbids Lean builds in this pass. I used the worker's elaborated-signature listing for this head and compared it with the README by hand.
- Yuan–Zhang Theorem 9.1's proof (Y pp. 624–628) and Erratum Propositions 4–5 (YE pp. 3–9): the statements were checked at their cited lines; the Breuil–Kisin multiplier computation, the contraction bound `n ≥ max(2,e_v)` of §6.2 and the normalizations `i₀`, `e` of §8.1 were not recomputed.
- T12 Lemmas 7.2–7.5 (preprint pp. 18–20) and PT Lemmas 3.4–3.7 (preprint pp. 5–9): statements checked; the index and Siegel-reduction estimates behind §§12.3 and 13.3 were not recomputed.
- Colmez (C) is an OCR of a French scan with JSTOR banners; its Theorem 0.3 and Conjecture 0.4 were located at the cited pages (C lines 227, 268) but its displays were not readable enough to recompute the component-period normalization of §§0.2 and 4.6.
- A §§4.1–4.7 (integral GSpin models, pp. 431–454) and §§6.1–6.3 (Eisenstein normalization, pp. 466–473) were cited by page only; I checked the page markers and Theorems 4.8.1 and 6.4.2, not the constructions.
- Ownership against open pull requests was checked through the `roadmaps grep` index of 363 open heads and the board packages; pull requests outside that index were not examined.

## Source issues

- **Error** in A at Theorem 9.1.5, printed p. 510: the source says a linear map ht on all of CM⁰ is uniquely determined by its values h_Falt(E,Φ) at the overlap characters; it should be unique only on their span, since the constant function 1 lies in CM⁰ and vanishes nowhere while every a⁰(E,Φ) vanishes at c; affects a stated result (its uniqueness clause), not the averaged theorem.
- **Misprint** in A at §9.4, printed p. 514: the source says the Hodge line ω₀ carries the hermitian form ‖z‖₀² = −[z,z̄]₀; it should be +[z,z̄]₀ (or its absolute value), since Q₀ = Tr_{F/ℚ}(aā) is positive definite and the printed value is negative on every nonzero z; affects nothing.
- **Error** in A at Lemma 9.4.3, printed p. 516: the source says the top-degree period of an integral generator has absolute value (2π)^{−dim A}; it should be (2π)^{+dim A} for the trace-one generator, since Tr_dR η = (2πi)^{−dim A}∫η, and an arbitrary generator differs by a unit; affects the proof (the sign of the (d/2)log(2π) term in Theorem 9.4.2).
- **Error** in A at Lemma 9.4.4, printed p. 517: the source says the length of the partition cokernel is the within-Υ and within-Υᶜ pair sums minus half the discriminant valuation; it should be the sum over cross pairs (η∈Υ, η′∉Υ) of v_C(ηπ−η′π), the negative of the printed value (for B=ℤ₃[√3], Υ a singleton, the printed value is −1, the length is 1); affects the proof.
- **Error** in A at Proposition 9.4.5, printed p. 519: the source says length_{O_P} C(M,Υ) = −½e_P(μ_p(a_Υ)+μ_p(a_Υᶜ)); with (9.4.7) as printed this is ≤ 0; it should be +½e_P(…); affects the proof (the two sign errors cancel in (9.4.12)–(9.4.13)).
- **Gap** in A at (9.5.3), printed p. 523: the source says the maximal O_E-stable lattice Λ_p equals ξd⁻¹_{F_p/ℚ_p}L_{0,p}; goodness fixes only the norm of Λ_p (E=ℚ(i), a=(2+i), ξ=−1/5, p=5: a₅ ≠ 5⁻¹O_{E,5}); it should compare the filtered Hodge lines after a local isometry; affects the proof of Proposition 9.5.1.
- **Misprint** in A at the paragraph after (8.3.1), printed p. 508: the source says the vertical error is supported at odd p with p² ∤ D_L and writes L_(2) for L⋄_(2); it should say p² ∣ D_{L⋄} (Theorem 4.8.1 gives vanishing when p² ∤ D) and L⋄; affects nothing.
- **Misprint** in A at Proposition 3.5.2, printed p. 422: the source says the Γ_y-representation Λ_{p,y}[1/p] is crystalline with Λ undefined; it should read N_{p,y}[1/p]; affects nothing.
- **Misprint** in A at Proposition 3.6.1(1), printed p. 430: the source says the condition is that 𝔭 is not split in F; it should say not split in E (𝔭 is a prime of F); affects nothing.
- **Misprint** in A at §3.2, printed p. 416: the source calls K₀ a maximal compact subgroup of T(A_f); at a finite place ramified in E/F the uniformizer class is compact in T_so but outside K₀; it should say compact open; affects nothing.
- **Gap** in T at Lemma 4.1, printed p. 384: the source says an abelian variety with a basis of its 3-torsion is rigid, without a polarization; E×E has infinitely many automorphisms trivial on 3-torsion; it should rigidify the polarized pair, as the proof of Theorem 4.2 can; affects the proof.
- **Gap** in T at §5, printed p. 386: the source says [ℚ(A):ℚ] equals |Cl(K*)|/|H| by Shimura's Main Theorem; that quotient is the degree of the marked moduli field over the reflex field K*; it should be equality up to factors bounded in g; affects nothing (only ≍ is used).
- **Error** in T12 at (4)–(5) and the display for Disc(R_x), preprint p. 18: the source says |Disc R_x| = [MT_x(Ẑ):K_x]²∏D_{K_i}; it should use the order index [O_x:R_x]², the compact index entering only through Lemma 7.2; affects the proof (Lemma 7.2 restores it).
- **Gap** in T12 at Lemma 7.4, preprint p. 19: the source says the p-adic valuation of the discriminant of L_p is bounded by an absolute constant; it grows with the ramification of L at p; it should carry a power of the field discriminant, as the statement of Lemma 7.2 does; affects the proof.
- **Error** in Y at the proof of Theorem 2.2, printed p. 546: the source says a single c_p ∈ Gal(Q̄_p/ℚ_p) induces complex conjugation on E under every embedding E → Q̄_p; none exists when a prime of F splits in E (E=ℚ(i), p=5: both embeddings land in ℚ_p and are fixed); it should pair embeddings under conjugation place by place; affects the proof.
- **Error** in Y at Theorem 2.7, printed p. 549: the source says the nearby-height identity holds for every O_E-abelian variety isogenous to A_{Φ₁}×A_{Φ₂}; it should be restricted to the quotient by the graph of an O_E-isomorphism of the δ_{E/F}-torsion; affects a stated result; corrected in print at the Erratum (Annals 198 (2023), 867–878), Theorem 1.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6e5cf0054e09ad1f9b9d7bee5bb26dcaa4e8474a", "job": "RT-ComplexMultiplicationAndExplicitReciprocityPartII~1b", "model": "fable", "worker": "chris-k"} -->
