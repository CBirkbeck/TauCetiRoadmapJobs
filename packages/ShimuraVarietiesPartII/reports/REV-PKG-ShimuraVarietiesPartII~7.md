<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6900207563 -->
Review (claude) of ce37463

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the manifest's `locator` fields omit locators the README cites

   **Location.** `packages/ShimuraVarietiesPartII/sources.toml`, entries `HT`, `KZ`, `KP`. HT: `locator = "§§1.3–2.1; Lemmas 1.3.6, 2.1.4; …"`. KZ: `locator = "§§2.4, 3–5; …"`. KP: `locator = "Corollary 0.3; §§4.2–4.6; …"`, `cited_for = ["§1.9", "§§3.1–3.7"]`.

   **Claim.** Each entry records the locators the README cites from that work.

   **Witness.** `README.md:890–894` (§4.5) cites HT (1.1.3.1), §1.1.3 and Proposition 1.2.5, pp.14–15 (HT line 284, p.7; HT line 648, p.14): outside §§1.3–2.1. `README.md:1386` cites KZ Definition 2.2.4 and Remark 2.2.5, p.10 (KZ line 437–440); `README.md:11, 1364` cite KZ §6, Proposition 6.2.4–Theorem 6.2.7 (KZ line 2559, 2619): outside §§2.4, 3–5. `README.md:1382` cites KP Lemma 3.1.17 (KP line 2011, journal p.169): outside §§4.2–4.6, in a section absent from `cited_for`.

   **Exact repair** (`sources.toml` only; no README change).

   1. HT `locator`: prepend `§1.1.3, hypothesis (1.1.3.1); Proposition 1.2.5; ` before `§§1.3–2.1`. Add `"References"` to HT `cited_for`.
   2. KZ `locator`: insert `Definition 2.2.4; Remark 2.2.5; ` after `§§2.4, 3–5; ` and append `; §6.2, Proposition 6.2.4 through Theorem 6.2.7`. Add `"Scope and ownership"` and `"References"` to KZ `cited_for`.
   3. KP `locator`: insert `Lemma 3.1.17; ` after `Corollary 0.3; `. Add `"References"` to KP `cited_for` (and to KPZ `cited_for`, whose §7.3 is cited only in the same *Source conventions and corrections* list).

   **Repair test.** After the edit every item in the witness lies in a recorded locator: HT line 284 and 648 under `§1.1.3` and `Proposition 1.2.5`; KZ line 437–440, 2559, 2619 under the three added items; KP line 2011 under `Lemma 3.1.17`. A mechanical pass over the 93 parenthesised locators of the README (below) then finds none outside its manifest entry.

2. **F02** (P3) §4.13 page range

   **Location.** `packages/ShimuraVarietiesPartII/README.md:1028`: “(HT, Corollary 2.1.9, pp.24–25).”

   **Claim.** The corollary and its proof occupy pp.24–25.

   **Witness.** HT line 1095–1105: statement and proof of Corollary 2.1.9 end on p.24 (page marker 24 at HT line 1070, marker 25 at HT line 1114, which opens with §2.2.1).

   **Exact repair.** Replace the locator by “(HT, Corollary 2.1.9, p.24, with §2.1.8, p.24, for Conj′ and neatness).” No manifest change (HT records Corollary 2.1.9 and §2.1.8).

   **Repair test.** HT line 1079–1094 (§2.1.8) and 1095–1105 (Corollary 2.1.9) are all between the markers of p.24 and p.25.

Two findings, both P3 (0 blocking): the source manifest omits five locators that the README cites, and one page range is too wide. All four findings of round 6 are repaired. The mathematics, the suppliers, the dependency direction and the Lean file are clean. No authored file was changed by this review and no source was fetched (`sources.toml` is unchanged; no `needs-references.toml` was created).

## Previous findings, verified first

| Finding (round 6) | Repaired passage | Status |
|---|---|---|
| F01 (P1), §0.5 used the p-adic comparison of absolute Hodge tensors with no supplier | `README.md:55`: “What ShimuraVarieties must provide (gap:integral-hodge-realization-extension): §7.0i, p-adic de Rham realization (new target). For a complete discrete valuation ring O_K of mixed characteristic (0,p) with perfect residue field, an abelian scheme A over O_K …”; *Needs* of §0.5 (line 289) and §1.1 (line 335); Dependencies of Layers 0 and 1 | **Repaired.** HT (1.3.4.2) is HT line 751–753, p.16, and is the input at HT line 800–802; KZ §4.1.7 uses the same theorem at KZ line 1345–1347, so the §1.1 edge is right. The slug is in `design/plan.json` with supplier `ShimuraVarieties`; 21 slugs in the README, the same 21 in the plan. ShimuraVarieties §7.0i at its head is over ℂ only, so the contract asks for nothing already supplied. |
| F02 (P2), §1.9 global normal components | `README.md:449`: “the special fibre of the Hodge model is reduced, and at every geometric point the irreducible components of the strict henselization of its local ring are normal … When G^fix=G°, every irreducible component of the geometric special fibre is normal.” | **Repaired.** KP Corollary 0.3 is KP line 130–132, journal p.124; KPZ Theorem 7.1.3(2) is KPZ line 3198–3203, p.73. The connected-case argument is checked in the table. `sources.toml` KP gained `Corollary 0.3` and `§1.9`. |
| F03 (P3), §4.8 `Aut(A_x)` | `README.md:938`: “Write I_x(Z_(p))=I_x(Q)∩Aut(A_x), where A_x is taken up to prime-to-p isogeny, so that Aut(A_x)=(End(A_x)⊗Z_(p))^×”; third Check at line 956 | **Repaired.** HT line 982–984 and 1009; values in the table. Agrees with §4.11 (line 1002). |
| F04 (P3), §7.5 locator | `README.md:1334`: “(KZ, §5.3.2, p.53, for algebraicity; proof of Theorem 5.1.4, §5.3.6, p.55, for equality)” | **Repaired.** KZ line 2370–2373 (p.53) and 2428–2439 (p.55). |

No finding of the last repair report was marked not actionable; nothing is re-raised. Pattern search for the repaired classes: F01 (an input taken from inside a proof with no owner): every *Needs:* line of Layers 0–1 and 4–5 was read against the proof route beside it, no further unowned input. F02 (global statement where the source is étale-local): §§1.5, 1.6, 3.8, 5.1, 5.3 state henselizations, strict henselizations or completed local rings, as their sources do. F03: `Aut(A_x)` occurs only in §§4.8 and 4.11, both with the prime-to-p reading. F04: R02 above is the one remaining page slip found by the mechanical pass.

## Verified sound

**Coverage.** The whole README was read this round (1386 lines; 63 numbered targets in 8 layers; 71 *Needs:* lines; 26 Definition or Construction sections with 26 API lists and 27 Checks blocks, the extra one under Conventions; every layer ends with Examples and Dependencies). `Suggested.lean`, `metadata.toml`, `sources.toml` and the `gaps` list of `design/plan.json` were read.

**Principles.** No route-specific shortcut (ramified primes and the exceptional type-A and D^H cases are kept: KPZ Theorem 7.2.21 at KPZ line 3735 has that breadth), no re-planned roadmap, no computational algorithm, no sorry'd data, no `set_option`. Residue grep over the README and the Lean file (pull-request numbers, round labels, machine paths, HTML anchors, LaTeX delimiters, “optional”, “deferred”, “removed”, `lemma` as a keyword): 0 hits.

**Seeded source sample: 15 of 15 read at their locators.** The author flags no locator as unverified.

| Target | Locator as read | Result |
|---|---|---|
| 1.2 | KZ §4.1.3 (A′)–(B′), p.29 (KZ line 1272–1275); Proposition 4.1.9(1)–(2), p.31 (KZ line 1361–1367), proof to p.32 | supported: neat K^p, very good at y, the component through the lift is Spf A_G, adapted lifts in both directions |
| 1.3 | KZ Proposition 4.1.9(3) (KZ line 1368–1369) and proof (KZ line 1384–1391) | supported; the README states the nontrivial direction |
| 1.5 | KPZ Theorem 7.1.3(3), p.73 (KPZ line 3204–3206); proof at KPZ line 3235–3236 | supported under (A)–(C) and connected stabilizer; same residue field k′ |
| 2.2 | KPZ §§7.2.2–7.2.3, p.77 (KPZ line 3380–3416); Proposition 7.2.19(2), p.83 (KPZ line 3675) | supported: every prime over p of F splits in the CM field (KPZ line 3406) |
| 2.3 | KPZ Proposition 7.2.10, p.79 (KPZ line 3489–3502); (NE) at KPZ line 2706; proof to p.80 | supported; the R-smooth centre is in the proof (KPZ line 3541–3542), the rest in (1)–(4) |
| 3.1 | KP §4.5.6, journal p.195 (KP line 2982–3010); §§4.6.1–4.6.4, pp.197–199 (KP line 3091–3166) | supported: diagonal relation (γ,φ(γ)⁻¹), closures in G(A_f^p), tilde groups, completion description (Lemma 4.6.4(2)) |
| 3.4 | KP Lemmas 4.5.2, 4.5.4, 4.5.7, 4.5.9, pp.194–196 (KP line 2954–3046) | supported: twist by the fibre P over γ, level γK^pγ⁻¹ (KP line 2980), lift to the adjoint torsor |
| 3.5 | KP §4.6.5, Lemma 4.6.6, pp.199–200 (KP line 3167–3206); Lemma 4.6.9, pp.201–202 (KP line 3242–3256) | supported: extension by A°, star product, map of extensions through G₃ |
| 4.13 | HT Corollary 2.1.9, p.24 (HT line 1095–1105); §2.1.8 (HT line 1079–1094) | supported; page range is R02 |
| 5.5 | KZ Proposition 4.4.8, p.44 (KZ line 1938–1962); (4.4.9.1) (KZ line 1966) | supported |
| 5.6 | KZ Proposition 4.4.10, p.45 (KZ line 1973–1993) | supported: projection tensors, centre acting through a lift, exactness after ⊗Q_ℓ |
| 5.9 | KZ Theorem 4.4.6, p.43 (KZ line 1900–1903); §4.4.11, pp.45–46 (KZ line 1994–2031) | supported, including the j-pieces and the p-power quasi-isogeny |
| 6.1 | KZ §5.2.1, pp.48–49 (KZ line 2112–2166) | supported: index set {λ dominant, λ ≤ μ}, Bruhat order, top stratum smooth, field of definition by the Frobenius orbit |
| 6.3 | KZ Proposition 5.2.3, p.49 (KZ line 2169–2173); Corollary 5.2.7, pp.52–53 (KZ line 2322–2351) | supported; the top-stratum step is in the proof of Proposition 5.3.5 (KZ line 2411–2418), which §7.4 cites |
| 7.5 | KZ §5.3.2, p.53 (KZ line 2370–2373); §5.3.6, p.55 (KZ line 2428–2431) | supported |

Also read: KZ Definition 4.2.2, Proposition 4.2.3, Lemma 4.2.4 (KZ line 1481–1523); KZ Theorem 4.4.4, Corollary 4.4.13, Theorem 5.1.4, Lemma 5.3.3, Proposition 5.3.5; KPZ §7.1.2, Theorems 7.1.8 and 7.2.21, Propositions 7.1.11, 7.1.14 and 7.2.19, Corollary 7.2.24, §2.1.4 and Proposition 2.1.5, Lemma 7.2.5, Definition 7.2.7; HT Lemma 2.1.4, §2.1.5, Proposition 2.1.6, §2.1.7.

**Mechanical locator pass.** Each of the 93 parenthesised locators of the README (KZ 39, KPZ 25, HT 19, KP 7, K17 3) was matched to the page marker of the first line of the cited item in the cached text. All pages agree except R02. Two ranges are wide but contain the item and need no change: HT Proposition 2.1.6 is stated on p.23 (HT line 1036) with its preamble on pp.22–23; KZ §4.1.5 begins on p.29 and the part cited at `README.md:249` is on p.30 (KZ line 1299–1303).

**Adversarial table** (sampled targets, headlines, passages the repair changed, and the targets of the findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions, elliptic point | E: y²=x³+x over F₅ | x=0..4 give 1,0,1,1,0 affine points; #E=4; trace 2; H¹: T²−2T+5; H₁: T²−(2/5)T+1/5; over F₂₅ trace 4−10=−6, det 25 | keep |
| Conventions, G_m norm | ζ of order 24 | ζ·ζ⁵=ζ⁶; dual ζ⁻⁶=ζ¹⁸; ζ²; ratio ζ⁻¹²=−1 | keep |
| gap contract (F01) | lift over O_K, K finite over Q̆_p | O_K complete, residue field F̄_p perfect, A an abelian scheme: hypotheses met; conclusion is HT (1.3.4.2) at that point | keep |
| 1.2 | hyperspecial GL₂, empty tensor family | versal ring W[[t]], dimension d(h−d)=1·1=1; A_G=A; every deformation adapted; one branch | keep |
| 1.3 | x=x′; two branches over one Siegel point | identity: tensors equal, points equal; distinct branches: adapted rings select distinct components, tensors differ | keep |
| 1.5 | GL₂ hyperspecial; Γ₀(p) node over F_(p²) | both sides W(k′){t}^h; node: henselization of W[x,y]/(xy−p) at the origin, and the crossing point of M_loc is F_p-rational, so y∈M_loc(k′) exists | keep |
| 1.9, strictly local form | Γ₀(p) node; nodal cubic | k[[u,v]]/(uv): 2 minimal primes, quotients k[[v]], k[[u]] regular; nodal cubic: 2 regular branches, 1 non-normal global component | keep |
| 1.9, G^fix=G° global form | Y a component, T=π⁻¹(Y) | π open with geometrically irreducible fibres, so T irreducible and a component of S̃_k; its generic point maps to a generic point of M_k (q flat), so T lies in q⁻¹(Z), Z a normal component; q⁻¹(Z) smooth over Z, hence normal, so T is one of its connected components; T→Y smooth surjective, so Y normal | holds |
| 1.9, Iwahori GL₂ | X₀(p) mod p | π₁(GL₂)=Z torsion-free, fixer connected; 2 components, each ≅ X(1), smooth | holds |
| 2.1 | GU(1,1) split at p; GSp_(2g), g≥1 | Z^c=U(1)≅G_m at p, dimension 1, induced; Z^c=μ₂, dimension 0, not a torus | keep |
| 2.2 | G₂=GL₂ | E₂=Q, cover itself, composite Q: 1 place over p, degree 1 | keep |
| 2.3 | split type A; PGL_m(D), p ∣ ind D | index 1, p∤1: (NE) holds; index p: outside (NE), goes to §2.4 | keep |
| 3.1 | torus G_m | G_ad=1 so A_int°=1; A_int=(A_f^p)^×/closure(Z_(p)^×)≅Ẑ^(p,×)/{±1}≠1; diagonal pair (γ,φ(γ)⁻¹)↦γγ⁻¹=1 | keep |
| 3.4 | γ=diag(ℓ,1), K_ℓ=GL₂(Z_ℓ) | γ[[a,b],[c,d]]γ⁻¹=[[a,ℓb],[c/ℓ,d]]; c=1 gives ℓ⁻¹∉Z_ℓ; γ=1 gives K_ℓ | keep |
| 3.5 | torus | A_int°=1, E_int=Gal(E^p/E), star product over 1 is A_int×Gal(E^p/E) | keep |
| 3.8 headline | modular curve, hyperspecial and Iwahori | branches 1 and 2 at a supersingular point; relative dimension 1 | keep |
| 4.7 headline | modular curve; quaternion inner form | ordinary open of dimension 1, supersingular of dimension 0; slopes (1/2,−1/2) once each impossible, no ordinary class | keep |
| 4.8 | scalars 1/2, 1/5 at p=5, d=1 | 2∈Z_(5)^×, so 1/2∈(End⊗Z_(5))^×; 1/5=f/n gives n²=25·deg f with 5∤n, impossible | keep |
| 4.9 | δ_D=[[0,−1],[5,0]]; E: y²=x³−x over F₃ | δ_D²=−5; (δ_D⁻ᵀ)²=−1/5; x=0,1,2 give 3 affine points, #E=4, trace 0, π²=−3; closure of ⟨γ⟩ has 2 components; centralizer dimensions 2 (m=1), 4 (m=2) | keep |
| 4.13 headline | ordinary E/F₅; supersingular E/F₉ | I_x=Q(i)^×, dimension 2 = dim Z_GL₂(γ_ℓ); B^×, dimension 4 = dim GL₂ = dim D^× at p | keep |
| 5.5 | two elliptic factors | dim A₃=(dim V₁+dim V₂)/2=1+1=2 | keep |
| 5.6 | G₁=G₂=GL₂, identity cover | G₃={(g,gz): z²=1}°=diagonal GL₂; C_i=1; I_(x₃)→I_(x_i) of dimensions 2→2 with kernel of dimension 0 | keep |
| 5.6, surjectivity | central kernel, γ semisimple | g↦[g,γ] is a homomorphism from the preimage H of Z(f(γ)) to C_i, trivial on H° (T⊂Z(γ), and on H°_der); Z(γ) has finite index in H, equal after a neat power | holds |
| 5.9, 5.10 headlines | ordinary E/F₅ | canonical lift with CM by Z[i], Mumford–Tate torus of dimension 2 = rank GL₂; γ₀ has (trace, det)=(2/5,1/5) | keep |
| 6.1 | hyperspecial GL₂, μ=(1,0); Res_(F/Qp)GL₂, F ramified quadratic, μ=((1,0),(1,0)) | 1 index; image of μ in X_*(T)_I=Z² is (2,0), dominant λ≤μ: (2,0), (1,1), difference (1,−1)=α∨: 2 strata of dimensions 2 and 0 | keep |
| 6.3 headline | point of the (1,1) stratum above; marked point of degree m>1; constant map | a curve into the (2,0) stratum is required; degree m fails f(c)=x over F_q; constant map has empty higher-stratum preimage | keep |
| 7.2 | g=diag(1,1/5) | det(T−g)=T²−(6/5)T+1/5 | keep |
| 7.5 | SO₄⊂GL₄: r(θ)⊕r(φ) and r(θ)⊕r(−φ) | same characteristic polynomial; conjugate in O₄ by a reflection of determinant −1, not in SO₄ for θ,φ∉{0,π} | keep |
| 7.6 headline | uniqueness; passage to H¹ | Conj(G)(Q)→Conj(G)(Q_ℓ) injective; (2/5,1/5)↦((2/5)/(1/5),5)=(2,5) | keep |
| Examples | Y(9)→Y(3); Iwahori, j=diag(p,1) | |ker(GL₂(Z/9)→GL₂(Z/3))|=3⁴=81, −1∉K(3); c=p gives lower-left entry 1∉pZ_p | keep |

**Pinned declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, confirmed as the checked-out heads and the revisions of `lake-manifest.json`): `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:112) and `Isocrystal.frobenius` (:124); `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95); `AbelianVariety.End` (End/Basic.lean:74, `Additive (A ⟶ A)`); `Matrix.transpose_mul_J_mul_eq_det_smul` (SymplecticMultiplier.lean:63); `TauCeti.reductiveCommHopfAlgProperty` (Reductive/Basic.lean:71); `TauCeti.HopfAlgebra.conjugationAlgHom` (Hopf/Conjugation.lean:66), `productMap_comp_conjugationAlgHom` (:107), `conjugationAlgHom_counit_left`, `_counit_right`, `_coassoc` (:176, :196, :248); `TauCeti.ComoduleAlgebra.coinvariants` (ComoduleAlgebra.lean:136). All exist and say what the README says. Every backticked name in the README is one of these or a formula; none is presented as this roadmap's own.

**Lean.** `lake env lean` on `packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. One `import Mathlib`, one module docstring, the namespace, 0 declarations. The one-tactic probe and the `#check @name` comparison therefore have 0 inputs; I confirmed there is no declaration, and nothing changed.

**Headlines.** Seven headlines in the Summary and Scope: §3.8 (KPZ Theorem 7.2.21), §4.7 (density), §4.13 (HT Corollary 2.1.9), §5.9 (KZ Theorem 4.4.6), §5.10 (KZ Corollary 4.4.13), §6.3 (KZ Corollary 5.2.7), §7.6 (KZ Theorem 5.1.4). Each is named in the module docstring with the carrier it lacks. None is statable at the pins: each needs an integral model of a Shimura variety, and a grep of both pins for Shimura data, parahoric group schemes, Dieudonné modules and conjugacy quotients finds no carrier.

**Suppliers.** All 24 cited roadmaps were fetched at main or at their open heads and every cited section heading resolved (117 section ids; 0 missing). Contents checked: ArithmeticGaloisRepresentations §1.11 contains the target *Reductive quotients over fields and DVRs* with `Conj_H`, `χ_H` and the semisimple-class bijection; ReductiveGroupsPartIII §0.7 defines Out′, Conj′, Aut′ with the “same image iff Aut′-conjugate” statement, §3.5 is neatness and cyclic closures, §5.5 takes this roadmap's §7.6 as a hypothesis; GeometricSatakeAndFusionPartII §3.1 states normal Cohen–Macaulay geometric special-fibre components in the standard range (p>2, abelian type), which contains the corrected Hodge setup, and §3.7 and §7.6 are as cited; ReductiveGroupsPartII has *steinberg-quasi-split*; GlobalShtukasAndFunctionFieldLanglands §§6.1–6.2 state the constant twist and the irreducible companion; ShimuraVarieties §7.0i is over ℂ. No citation of a never-cite roadmap.

Dependency check, prescribed command with `--movable`, exit 0:

```text
depcheck: 246 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD and no CYCLE line.

**Gaps.** 21 slugs in the README, the same 21 in `design/plan.json`, each with a named supplier and section, each used in at least one *Needs:* line. Each `needs` sentence carries its hypotheses and excludes what the supplier has. `integral-hodge-realization-extension` is shared with FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (same supplier and section; that roadmap words it as the crystalline–de Rham form of the same comparison).

**Duplication and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id defined only by a revision, and no second copy. Object searches over main and the open heads (strongly acceptable triples, Kottwitz–Rapoport strata, tensor quasi-isogeny group, μ-ordinary locus, integral models of Hodge or abelian type): no second owner. “Strongly acceptable” in ArithmeticStatisticsPartV is a different notion (sieve families); GeometricSatakeAndFusionPartII mentions KR strata as a consumer of its Schubert curves; ReductiveGroupsPartII cites KP for parahorics only. The one mention of this roadmap elsewhere is in the consumers list of GlobalShtukasAndFunctionFieldLanglands.

Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, IgusaVarietiesAndTorsionConcentration and ReductiveGroupsPartII (the third list is empty); nothing shared: very-good embeddings and adapted lifts are owned by the first, local models and same-field Schubert curves by the second, Conj′ and the abelian-variety application by the third, B(G) by the fourth, PEL Newton strata by the fifth, fixers and parahorics by the sixth.

**Copyright.** Wording: the 15 sampled passages and 7 more (Conventions on R-smoothness against KPZ §2.1.4; the F01 contract against HT (1.3.4.2); §1.9 against KP Corollary 0.3; §4.8 against HT §2.1.3; §4.11 against HT Lemma 2.1.4; §2.1 against KZ Definition 4.2.2; the `rg3-stabilizer-closed-immersion` contract against KPZ Proposition 2.1.5(3)) were set beside the source lines. The longest shared runs are forced phrases of five or six words (“a closed immersion of reductive groups”, “extends to a closed immersion of”); hypothesis lists follow the mathematics, in a different order from the source. Arrangement: KZ's contents are §2 groups, §3 deformations, §4.1–4.4, §5.1–5.3, §6. KZ §4.1 is spread over Layers 0, 1, 4 and 5; KZ §4.2 over Layers 2 and 3; Layers 1, 3 and 4 rest on KPZ, KP and HT; Layer 7 joins KZ §5.1 and §5.3 after §5.2. The order 5→6→7 is forced (§7.4 needs §5.10 and §6.3; §6.3 needs §4.7). No table, figure or example list is taken over.

Source independence: 22 passages compared with 4 sources (KZ, HT, KPZ, KP), none shared; largest share KZ, 39 of 93 locators; contents compared with KZ: independent.

## Not verifiable

- The published versions of KZ (Annals), HT (Duke) and K17 (JAMS) were not collated with the recorded preprint or author versions; locators are for the versions `sources.toml` records.
- The 21 declared supplier gaps are contracts; their future proofs cannot be checked here.
- K17 was read only for its page markers (§2.1.2 on p.29, Corollary 2.1.7 on p.31); its statements were not compared again this round.
- Whether every Hodge-type group at p>2 lies in the “standard range” of GeometricSatakeAndFusionPartII §3.1 (triality excluded) rests on the classification of abelian-type data, which I did not recheck.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), printed p.34: the source says the inertia coinvariants of the abelianization are torsion; it should be torsion-free, as Lemma 4.2.4 requires; affects a stated result.
- **Misprint** in HT at §2.1.3, printed p.21: the source says the integral group is the intersection of the Q_p-points of the isogeny group with the automorphisms; it should be the Q-points, as in the proof of Lemma 2.1.4; affects nothing.
- **Misprint** in HT at §2.1.8, printed p.24: the source says neatness uses the group generated by an undefined x; it should be the group generated by γ; affects nothing.
- **Error** in KP at the proof of Theorem 4.2.7, printed p.186: the source says the local action map is a torsor; it should be the smooth action morphism; affects the proof; corrected in print at KPZ §7.3.1(1), p.85.
- **Gap** in KP at the proof of Lemma 3.1.17, printed p.169: the source says convergence in a topology for which the ring is not complete suffices; it should be convergence in the p-adic topology, for which it is complete; affects the proof; corrected in print at KPZ §7.3.1(2), pp.85–86.
- **Error** in KP at Lemma 4.6.13 and Corollary 4.6.15, printed pp.202–203: the source says every component piece has the fixed parahoric level; it should be the level conjugated by its coset representative; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87.

## For the human reviewers

- Licence: HT and K17 are read from author pages (`sources.toml`, `licence_class = "author-page"`), in versions dated 27 January 2021 and 27 August 2016; their numbering was not collated with the Duke and JAMS versions.
- Scope: the sources are refereed (KP, Publ. IHÉS 2018; KPZ, Forum Math. Pi 2026; HT, Duke 2022; KZ recorded as Annals 2025); the KZ text read is arXiv v2.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ce374632463b886948808e269ddad71a123c1187", "job": "REV-PKG-ShimuraVarietiesPartII~7", "model": "fable", "worker": "chris-x89"} -->
