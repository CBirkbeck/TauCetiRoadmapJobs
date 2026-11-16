# Review of ArithmeticLocallySymmetricSpacesPartII (pull request #2401 at 568b4e2)

**Verdict:** needs changes

## R01 (P2) — the cohomological comparison at a non-neat level is cited to a source, not owned

**Location:** `TauCetiRoadmap/ArithmeticLocallySymmetricSpacesPartII/README.md` line 660 (§5.5): "Define H_bc¹ as the image in ordinary group cohomology of these cuspidal base-change classes through the comparison of fgt10 §3.3"; line 670: "*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.4.2–R17.4.6; §5.4."

**Claim:** `dim H_bc¹(SL₂(O_F), E_n) = Z_F(n) − ν_{F,n} h_F/2` needs an injection of the multiplicity space of `π_{2n+2,0}` at level SL₂(Ô_F) into H¹(SL₂(O_F), E_n). No target or supplier gives it at a non-neat level; §§5.6–5.8 and the lower bound of `bianchi_groupCohomology_linear_growth` rest on it.

**Witness:** SL₂(ℤ[i]) contains −I and S₄, so it is not neat. ArithmeticLocallySymmetricSpaces §ALS.5b.5 on main: "The statement assumes `K` neat". §4.1 states its comparison "For a neat level K_f". fgt10 line 979 is a citation, not a supplier.

**Repair:** Add to §4.1, after the neat-level paragraph, the target: "For a compact open K_f that is not neat, choose a neat K′_f ⊆ K_f normal in K_f (§3.2, intersected over the finitely many K_f-conjugates) and put Γ = SL₂(F) ∩ K_f, Γ′ = SL₂(F) ∩ K′_f, Q = Γ/Γ′, which is K_f/K′_f by strong approximation (AdelicAlgebraicGroups §4.2). The comparison of ArithmeticLocallySymmetricSpaces §ALS.5b.4 is compatible with level maps, so the injection H_cusp^q(Y(K′_f), V_κ) → H^q(Γ′, V_κ) of §ALS.5b.5 is Q-equivariant. Its Q-invariants give an injection of ⊕_ε Hom(π^ε_κ, L²_cusp^{K_f}), of dimension Σ_ε m_ε(κ,K_f), into H^q(Γ′, V_κ)^Q = H^q(Γ, V_κ) (restriction and corestriction), for dim V_κ > 1; for F imaginary quadratic it is an injection S_κ(K_f) → H¹(Γ, E_n)." Add the matching API bullet, and to §4.1's *Needs:* add AdelicAlgebraicGroups §4.2, §3.2 and Tau Ceti `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`. In §5.5 replace "through the comparison of fgt10 §3.3" by "through the injection of §4.1 at the level SL₂(Ô_F), which is not neat", and extend its *Needs:* line and the Layer 5 Dependencies with "§4.1; ArithmeticLocallySymmetricSpaces §ALS.0.7; AdelicAlgebraicGroups §4.2". Tested on ℚ(i), n = 0: S₂ = 0 injects into H¹(SL₂(ℤ[i]), ℂ) = 0.

## R02 (P3) — §3.4 passes from the supplier's Ore rank over ℤ_p[[G]] to the skew rank over A without a stated step

**Location:** `TauCetiRoadmap/ArithmeticLocallySymmetricSpacesPartII/README.md` line 484 (§3.4): "They are finitely generated A-modules of skew rank zero."; line 488: "*Needs:* §2.6; §3.3; CompletedCohomologyPartII §4.2; … §5.7; … §6.3; §0.1."

**Claim:** CompletedCohomologyPartII §5.7 gives rank zero of H̃_j over the integral algebra O[[U]] in the sense of its §5.5. §3.4 uses rank_A(ℚ_p ⊗ H̃_j) = 0 in the sense of gap:skew-rank, which its *Needs:* line omits.

**Witness:** CompletedCohomologyPartII §5.7 at its open head: "torsion means rank zero after restriction to a torsion-free uniform open domain"; its §5.5: "rank over the Ore division ring" of `Λ_U=O[[U]]`. A = ℚ_p ⊗ ℤ_p[[G]] is a different ring.

**Repair:** In the §3.4 route, after "makes every M_j of skew rank zero", add: "Here CompletedCohomologyPartII §5.7 is applied with O = ℤ_p and U = K₀ = G, which is uniform and torsion-free, so no restriction is needed: every element of H̃_j is killed by a nonzero element of ℤ_p[[G]] (§5.5 there). That element is nonzero in A because ℤ_p[[G]] has no p-torsion, so every element of M_j is killed by a nonzero element of A and rank_A M_j = 0 by the torsion criterion of gap:skew-rank." Add "CompletedCohomologyPartII §5.5; gap:skew-rank" to the *Needs:* line of §3.4 and to the Layer 3 Dependencies. Tested on G = ℤ_p, H̃ = Λ/(γ−1): killed by γ−1 ≠ 0 in A, and rank_A(A/A(γ−1)) = 0.

## Verified sound

The previous review, of this same head, listed no finding, so there is none to re-check.

| Target | Instance | Roadmap value | Computed / source value | Result |
| --- | --- | --- | --- | --- |
| §0.1 proper-face polynomials | m = 3, c_∅ = 2, c_{0,2} = 3 at (2,5,4); m = 2 on (t,t) | 26; x₀x₁ not bounded by any B_c | 2 + 3·2·4 = 26; t² against (Σc_s)t; fu24 lines 130–137 (degree ≤ r−1, multiplicity-free) | holds |
| §0.2 saving | B = 2+3x₀+5x₁ at (2,4), a = 2; x = (1,t) | 28 ≤ 40; no saving | 2+6+20 = 28, 10·8/2 = 40; a = 1 gives (Σc)·t | holds |
| §0.3 generic cyclic quotients | m = 1, k ≥ α; α = (3,3), k = (1,t); δ = Δ₁−Δ₂ | 2α − α²/(k+1) ≤ 2α; 2(t+1) ≤ 6(t+1)+12; (n+1)² | (k+1)²−(k+1−α)² = 2α(k+1)−α²; telescoping gives 2Σα_i∏_{j≠i}(k_j+1); eigenvalues ½n(n+2) equal; fu24 lines 385–409, 447–458, 492–554 | holds |
| §1.1 multiplicity and H₀ | M = A; character a | dim W both sides; a·a⁻¹ = 1 | Hom_A(A,W) = W; free twist has H₀ of dimension dim W*; fu24 line 1120 | holds |
| §1.2 cyclic estimate | δ = 1; δ = 0; m = 1 | 0; excluded; constant | A/A = 0; Hom_A(A,W_k) has dimension D(k+1), no proper-face bound; fu24 lines 725–729, 1128–1130; aw14 lines 473, 730–743 | holds |
| §2.1 free approximations | A/Aδ; (X,Y) ⊂ ℚ_p[X,Y] | (a,ℓ,rank N,rank T) = (0,1,1,0); rank 1, two generators | kernel of A → A/Aδ is Aδ ≅ A; Koszul kernel of rank 1; fu24 lines 1122–1123 | holds |
| §2.5 degree-one identity | ℓ = 2, a = 1, D = 6 | U_N + U_M | (6+U_N) − 12 + (6+U_M); four-term sequence fu24 lines 1145–1147 | holds |
| §2.6 local theorem | m = 2, i = 7; p = 2 | H₇ = 0; excluded | 7 > 3m = 6 (NoncommutativeAndEquivariantIwasawa §0.12); −I ≡ I mod 2 has order 2 | holds |
| §2.7 finite-dimensional support | M = W_(1,2); W₀ ⊕ W_(1,2) | 1 ≤ 1 ≤ 6; length 2 ≤ 7 | dim 2·3 = 6; 1 + 6 = 7; aw13 lines 3623–3625 (§10.13 Lemma, p. 77), 437–441 (§2.5, p. 9) | holds |
| §3.3 realizations | t = (3,0) over ℚ(i); κ = 6 | dimension 4, −I ↦ −1; 9 | 4·1; (−1)³; 3·3; marshall12 lines 174, 609, 631–635; fu24 line 1161 | holds |
| §3.4 descent bound | imaginary quadratic; total degree 2 | cutoff 6 = 3d; terms (0,2),(1,1),(2,0) | dim ∏_{v∣p} G_v = 3·2; fu24 lines 1165–1179 | holds, with R02 |
| §4.1 cusp forms, sign patterns | F = ℚ, Γ(3), κ = 4; signature (0,1) | dim S₄ = 1, H¹_cusp = 2; one pattern | 3(0−1) + (4/2−1)·4 = 1; m_+ = m_− = 1; fgt10 lines 974–979; marshall12 lines 123–129 | holds at neat level; R01 |
| §4.2 sharp bound | SL₂(ℤ), Sym¹⁰, Sym²²; ℚ(i), t = (n,n), a = n+1 and a = 1 | 3, 5 (r₂ = 0 fails); C(n+1); C(n+1)² | 11−5−3 = 3 = 2·1+1; 2·2+1 = 5; (n+1)·dim ≤ C(n+1)²; fu24 lines 89–90 | holds |
| §4.3 parallel weights | signature (1,1), κ = 4 | exponent 2, size 16 | Δ = 4·4² = 64, 64/4 = 16; fu24 lines 93–94 | holds |
| §4.4 Bianchi upper bound | d = 2, κ = 2(n+1) | O(κ); O(n+1) | κ²/κ; fu24 lines 93–98 | holds |
| §5.1 cusp torus | z = (1,i); n = 1, 2, 3 | det −2i; ranks (3,3), (8,8), (15,15); cohomology (1,2,1) | (4,8,4), (9,18,9), (16,32,16) minus ranks; kernel and cokernel of e on Sym^n of dimension 1; fgt10 lines 146–152 | holds |
| §5.3 fixed-type formula | N = 1, k = 12, 2; N = 2, k = 6, 8; N = 3, σ = ω, k = 4 | 1, 0; (0,1,0), (0,0,1); ½ | 11/12−6/12+3/12+4/12; 1/12−6/12−3/12−4/12+1; 5/12+3/12+4/12 = 1; 14/12−6/12+4/12 = 1; 3/12+3/12 = ½ | holds; fgt10 Prop. 4.18 fails without σ^ι ≃ σ |
| §5.4 finite types | ℓ = 3; ℓ = 2, ν₂ = 2, 3; ℓ = 7 | (−1,2), parity +1; dims 6, 2 and 12, 4; −2 | 2(−1)⁰ = 2, −(−1/3) = +1, quotient GL₂(𝔽₃)/Q₈ ≅ S₃; 2·3, 2·1, 4·3, 4·1; 2(−1)¹; fgt10 lines 1357–1396 | holds |
| §5.5 base-change count | ℚ(i), n = 0, 1; ℚ(√−3), n = 0, 1, 2; \|R(π)\| = 2 | 0, ½; (0,0,½); 4 descents of weight ¼ | ν_{ℚ(i),n} = 1 iff n odd; ν = 1 iff n ≡ 2 (3); 2^{−2}·4 = 1; fgt10 lines 1182–1216 | formula holds; R01 |
| §5.6 positivity | u = 1, 2, 5, 3, 7 | A/B = 5/3, 3, 5; B = 0 with A = 1/6, 1/3 | (5/24)/(1/8); (9/24)/(1/8); (5·6/24)/(1/4); 4/24; 8/24; general (2/3)(5/2)3^{s−1}; fgt10 lines 1292–1308, 1420–1421 | holds |
| §5.7 lower bounds | Γ = SL₂(O_F); Q orientation | index 1; invariants equal | (−1)^{2n} = 1 on E_n; χ = 0 gives dim H² = dim H¹ for n > 0 at neat level | holds |
| `weightRep`, `embeddingStdRep` | γ = (i 1;−1 0); t = (1,0); t = 0 | trace 1 on E₁; −I ↦ −1; dimension 1 | i·(−i) = 1 against i² = −1; (−1)^{1+0}; 1·1 | holds |
| `finrank_groupCohomology_weightRep_le` | ℚ(i): t = 0, i = 0, 1; t = (n,0); 𝔞 = O_F | dim ≤ C; C(n+1); Γ = SL₂(O_F) | H⁰ = 1, H¹ = 0; a = 1 forced; kernel of the map to SL₂ of the zero ring is everything | holds |
| `bianchi_groupCohomology_linear_growth` | ℚ(i), n = 99, 100, 0; ℚ(√−2) | 33.3, 8.4; n₀ needed; slopes ½, ¼ | (5/24+1/8)·100, (5/24−1/8)·101; H¹(SL₂(ℤ[i]),ℂ) = 0; 3/8 ± 1/8 | holds; lower bound rests on R01 |
| gap:skew-rank, gap:canonical-dimension-zero | ℚ_p[X,Y]; A/Aδ; W_k⁰ | ranks 1, 1, 0; canonical dimension 3m−1; integral 1 against rational 0 | Ext¹(A/Aδ,A) = A/δA ≠ 0; (3m+1)−3m; 3m−3m | precise; same slugs in the README |

- Source locators checked against the text: 37 citation groups, 50 source mentions (fu24 31, fgt10 11, marshall12 3, serre77 3, aw13 1, aw14 1), including every sampled target; serre77 lines 625–627 (p. 20), 1521–1530 (p. 52), 5190–5196 (p. 169). The README flags no locator as unverified.
- Library declarations opened at the pins: 36 (all of From Mathlib and From Tau Ceti), each at its file and line, 14 also by `#check`; among them `IsNoetherianRing.strongRankCondition` (Mathlib/LinearAlgebra/InvariantBasisNumber.lean:250), `nonempty_oreSet_of_strongRankCondition` (Mathlib/LinearAlgebra/Dimension/Localization.lean:299, needs `IsDomain`), `Representation.piTensorProduct` (TauCeti/RepresentationTheory/Tensor/Pi/Basic.lean:48), `map_subtype_id_comp_corestriction` (TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean:165).
- Cross-roadmap citations resolved: 63 section ids in 12 roadmaps, each heading found on main or at the supplier's open head; statements read for NoncommutativeAndEquivariantIwasawa §§F.1, 0.11, 0.12, 0.14, 0.15, 1.12, LocallyAnalyticDistributionsPartII §§0.2, 3.10, 4.1, 4.14, 5.2, CompletedCohomologyPartII §§5.1, 5.5, 5.7, 6.3, ArithmeticLocallySymmetricSpaces §§ALS.0.11, 1.5, 5b.4, 5b.5, FreeGroupsAndLimitGroups §4.5, BianchiModularForms §§1.2–1.3.
- Gate, re-run at this head: every check passes. Dependency check: `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`, no UPWARD or CYCLE line; the merge order lists this roadmap at line 211, after LocallyAnalyticDistributionsPartII (210). Outside-folder diff: empty. Main has no copy of this roadmap.
- Elaboration: `lake env lean` on `Suggested.lean` gives the two `sorry` warnings only. The 4 elaborated types agree with README §§3.1, 4.2, 5.8; no binder is lost. One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`) closes neither theorem: no padding. `roadmaps grep` finds the 4 declaration names in no other roadmap.
- Headlines: the local theorem (§2.6), the cusp-form bound (§4.2) and the support forms (§5.8) are named in the module docstring with the carrier each lacks; the two ordinary-cohomology forms are stated.
- Pull-request text against this head: title, summary block and prose agree with it; it says the pull request adds the roadmap.
- Shape: every layer ends with Examples and Dependencies; each definition (§§0.1, 0.3, 2.1, 3.1, 4.1, 5.5) has at least three Checks.

Overlap check: read LocallyAnalyticDistributionsPartII, CompletedCohomologyPartII, AutomorphyLiftingBeyondTaylorWiles, QuaternionicModularForms, TorsionCohomologyInfrastructure (open, by vocabulary) and ArithmeticLocallySymmetricSpaces (main); the list by named results is empty. Growth of generic quotients of Û: owner this roadmap, LocallyAnalyticDistributionsPartII lists it under "Applications outside this roadmap". Ore rank of Iwasawa modules: CompletedCohomologyPartII §5.5 uses it over O[[U]], this roadmap contracts it to NoncommutativeAndEquivariantIwasawa §F.1 (R02 states the link). Coefficient modules E_k: owner BianchiModularForms §1.3 for GL₂, `weightRep` kept as a stated variant. Nothing else shared.

Source independence: 16 passages compared with 6 sources (§§0.3, 1.1, 2.1, 2.5, 3.4 and both theorem docstrings against fu24; §§5.1, 5.3, 5.4, 5.5, 4.1 against fgt10; §3.3 against marshall12; §2.7 against aw13; the aw14 reference note; §5.3 API against serre77), none shared beyond formulas and standard names; largest share fu24, 31 of 50 locators; contents compared with fu24 §§1–7: independent (Layer 0 takes fu24 §3 with its own §§0.1–0.2, Layers 1–2 split fu24 §6, Layers 3–4 split fu24 §7, Layer 5 has no counterpart, fu24 §§4–5 are in another roadmap; the order is forced by §0.3 → §1.2 → §1.4 → §2.2 → §2.6 → §3.4 → §4.2).

## Not verifiable

- fgt10 Lemma 4.19 trace values at ℓ = 2 (ν₂ = 2, 3): the source omits the computation and cites Bushnell–Henniart, which is not in the cache; the ℓ = 3 values were recomputed.
- fgt10 Theorem 4.17's sum over local types: the source omits it ("tedious but elementary"); only the leading coefficients at u = 1, 2, 3, 5, 7 were recomputed from the type dimensions.

## Source issues

- **Misprint** in fu24 at Theorem 1.2, (3), p. 2: the source says the minimum runs over 1 ≤ i ≤ r = [F:ℚ] for an (r₁+r₂)-tuple; it should run over the r₁+r₂ place weights; affects nothing.
- **Error** in fu24 at equation (2), p. 2, and Corollary 1.3, p. 3: the source says compactly supported cohomology has dimension 2^{r₁} dim S_k; it should be Marshall's subspace of classes vanishing near the cusps, since compact support adds the number of cusps for Bianchi n > 0; affects nothing.
- **Gap** in fu24 at Theorem 3.2, proof, p. 11: the source says the estimate follows for all k but argues only for k ≥ α; it should also bound the strips with some k_i < α_i, by dim W_k ≤ α_i ∏_{j≠i}(k_j+1); affects the proof.
- **Misprint** in fu24 at Proposition 3.4, proof, p. 10: the source says f raises and e lowers weights; it should be the reverse under [h,e] = 2e of (6); affects nothing.
- **Error** in fgt10 at Proposition 4.18, p. 25: the source says the multiplicity formula holds for every σ of the right parity; it should require σ∘Ad(diag(−1,1)) ≃ σ, since an order-three character of SL₂(𝔽₃) at k = 4 gives ½; affects a stated result.
- **Gap** in fgt10 at Corollary 4.20, proof, p. 27: the source says it suffices that the coefficient of n+1 is non-negative; it should be strictly positive, which A_F > B_F gives; affects the proof.
- **Misprint** in fgt10 at §3.3, before (3.9), p. 17: the source says the criterion holds for any unitary representation; it should say irreducible unitary, since a multiple of π_{2n+2,0} also has cohomology; affects nothing.

## For the human reviewers

- none
