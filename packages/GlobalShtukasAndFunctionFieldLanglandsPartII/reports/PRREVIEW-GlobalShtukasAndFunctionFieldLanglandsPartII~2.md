# Review of GlobalShtukasAndFunctionFieldLanglandsPartII (pull request #1845 at 0dfe33c)

**Verdict:** needs changes

Incremental re-review of the 129 lines changed since 1858508. The rewrite of §4.0 repairs all four previous findings. It introduces one P2 and two P3 defects, all in the new §4.0 text.

## R01 (P2) — §4.0 derives semisimplicity at I_∞ from geometric semisimplicity

**Location.** `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md` line 610 (Parameter agreement): "Kl_H,Ad is pure of weight zero, hence geometrically semisimple (DeligneWeightsAndPurity §8.19), so its restriction to I_∞ is semisimple and is unchanged by semisimplification". Also line 632, the last Check: "The inertia-invariant comparison uses only the geometric restriction."

**Claim.** Geometric semisimplicity of the pure sheaf Kl_H,Ad makes its restriction to a local inertia group semisimple. Hence W_(F_∞)-semisimplification does not change the I_∞-invariants, and the no-proper-Levi conclusion passes from Kl_H to L_(F_∞)(V_φ).

**Witness.** At 0 the same pure, geometrically semisimple sheaf has I_0 acting through exp(ad N), N principal (line 614). For H=PGL₂, (Kl_Ad)^(I_0)=ker(ad N) has dimension 1, while its W_(F_0)-semisimplification (weights −2, 0, 2) has I_0-invariants of dimension 3.

**Repair.** Replace the clause after "itself:" on line 610 with: "once (Kl_H,Ad)^(I_∞)=0 is proved below, the monodromy operator N_∞ of the H-valued representation is an I_∞-invariant vector of Lie H, hence zero. So I_∞ acts on every τ∘Kl_H through a finite quotient, the restriction to I_∞ is semisimple, and W_(F_∞)-semisimplification leaves the I_∞-invariants unchanged. xz, Corollary 4.5.7(ii), xz line 2482, records N_∞=0 for the companion."

Replace the last Check with: "At 0, Kl_H,Ad is geometrically semisimple but I_0 acts through the principal unipotent. For H=PGL₂ the I_0-invariants have dimension 1 before and 3 after W_(F_0)-semisimplification. At ∞ the vanishing of invariants forces N_∞=0, and both dimensions are 0. Geometric semisimplicity alone does not control local invariants."

Tested on the refuting instance: the corrected argument applies only where N_x=0, so it predicts the jump 1→3 at 0 and equality 0=0 at ∞.

## R02 (P3) — the automorphic anchor has no proof route; its *Needs* omit what it uses

**Location.** README line 608: "The Gross–Reeder representation V_φ, compactly induced to G₀(F_∞) from the character φ⊗1 of I₁·Z(G₀)(F_∞), is irreducible and supercuspidal, and there is exactly one cuspidal automorphic representation π(φ) … Steinberg at 0". See also line 606 and the *Needs* line, line 634.

**Claim.** Line 606 says this section proves these statements:
- V_φ is irreducible and supercuspidal.
- π(φ) exists and is unique.
- π(φ) is Steinberg at 0.
- The Satake classes of π(φ) are the Frobenius classes of Kl_H.

The inducing character is written φ⊗1, although line 606 defines φ as a k-valued functional on V; hny line 633 uses the character ψ∘φ.

**Witness.** The route (line 614) covers only the third statement. *Needs* cites KB §KB.1 only for sheaf targets (KB design lines 234–297). Uniqueness and Steinberg are cited to hny line 143–153, which attributes them to Gross [21].

**Repair.**
1. Add a proof route for the anchor. A function on Bun_G₀(0,2)(k) that is (I₁,ψ∘φ)-equivariant is determined by its values on Ω and is cuspidal (hny, Lemma 2.1 and Remark 2.2, p. 12, hny line 636, hny line 644; sheaf form: KB §KB.1 *clean-datum*). For simply connected G₀, Ω=π₁(G₀) is trivial, so the space is one-dimensional. Frobenius reciprocity for compact induction (SmoothRepresentationsOfLocalGroups §SR.2.1) and irreducibility of V_φ give π(φ)_∞≅V_φ. The Satake match follows from the eigenisomorphism through the sheaf–function dictionary (GlobalShtukasAndFunctionFieldLanglands §1.4).
2. Add the following to line 634: KB §KB.1 (*clean-datum*, *hecke-action*), SmoothRepresentationsOfLocalGroups §§SR.2.1 and SR.3.1, and FunctionFieldArithmetic §§6.2–6.4.
3. Cite Gross–Reeder at its theorem for irreducibility and supercuspidality of V_φ.
4. Either cite Gross's paper at its theorem for "Steinberg at 0", or replace that clause with "with nonzero vectors invariant under the opposite Iwahori at 0", which is what hny Lemma 2.1 uses. §4.2 needs only existence, cuspidality, π_∞≅V_φ and the Satake match.
5. Write the inducing character as (ψ∘φ)⊗1.

## R03 (P3) — HNY Theorem 2's hypothesis on p is misdescribed

**Location.** README line 612: "(hny, Theorem 2, p. 17, hny line 976, whose hypothesis that p is good is removed by xz, Corollary 4.5.7 and Remark 4.5.8(i) …)".

**Witness.** hny line 976–977 assumes p good only when G is not simply laced: p>2 for B_n and C_n, p>3 for F₄ and G₂. Simply-laced types at bad primes are already covered, for example E₈ at p=5 and D_n at p=2.

**Repair.** Write "whose hypothesis on p for non-simply-laced types (p>2 for B_n and C_n, p>3 for F₄ and G₂) is removed by xz …". Check against the source: E₈ at p=5 is inside HNY's range under the corrected wording and outside it under the current one.

## Previous findings

- R01 — repaired: line 95 imports §§KB.0, KB.1, KB.4, KB.6 and KB.11 by target name; FormalConnectionsOpers, AffineLieAlgebras, andre-bessel, zhu-fg and both PDE gaps are gone; line 99 cites EtaleDualityAndPerverseSheaves §5.2. The rewrite introduced R01–R03 above.
- R02 — repaired: no RD.6.97 citation remains. `formal-to-differential-maximal-slope` is gone from `design/plan.json`, whose 13 gap slugs are exactly the README's 13.
- R03 — repaired: line 905 reads "The example is SmoothRepresentationsOfLocalGroupsPartII §5.26; ch26, Corollary 6.32(1), p. 25, ch26 line 1192, is the statement it corrects, and its proof contains no such example."
- R04 — repaired: line 402 *Needs* adds "SmoothRepresentationsOfLocalGroupsPartII §5.1 (polar decomposition …); SmoothRepresentationsOfLocalGroupsPartII §6.1 (the τ-fixed dual group)". Line 410 (Layer 2 Dependencies) adds the same.

## Verified sound

**Gate, build, outside diff.** I re-ran the gate at 0dfe33c and every scanner reports 0 (set_option, sorry-data, imports, statement-hygiene, dropped, readme-ids-missing, depcheck, stray-files, outside-folder, source-material), result OK. The worker's gate (`scratch/gate.md`) adds build=0. `lake env lean` on `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/Suggested.lean` exits 0 with no output: the file declares nothing, so there is no `sorry` warning and no `#check` probe was needed. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check** (`gate --depcheck … --movable`):

```
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

**The new §4.0 proof route, step by step.**
- KB rigidity gives Irr_∞(E)=r and *log-extension* gives Irr_0(E)=0.
- RD.6.55 with RD.5.46 duality gives χ_c(E)=−r. RD.6.55 itself reads "χ(G_m/K,E)=−Swan_∞(E) when E is tame at 0".
- The L-functions are equal. deg L=Σ(−1)^(i+1)h^i_c=−χ_c is unaffected by cancellation, so χ_c(Kl_Ad)=−r.
- curveEulerPoincareSwan with χ_c(G_m)=0 and tameness at 0 gives Swan_∞=r.
- Geometric semisimplicity (DWP §8.19) gives a reductive monodromy closure that contains exp(N). Jacobson–Morozov then gives a principal sl₂, so (Lie H)^π₁=0, and duality gives H²_c=0.
- The extension-by-zero sequence is exact, dim ker(ad N)=r, and injectivity forces (Kl_Ad)^(I_∞)=0.
- Every step is correct. The only defect is the inference in the separate paragraph flagged as R01.
- KB.7 *etale-monodromy* (KB design line 845) compares global monodromy groups only. So §4.0's étale local transfer is not a second plan of a KB target.

**Cross-roadmap citations resolved (24/24 in the changed text).**
- KloostermanSheavesAndBesselIsocrystals, on the board design (`packages/KloostermanSheavesAndBesselIsocrystals/design/README.md`):
  - targets: KB.0 *affine-depth* (line 102), KB.1 *eigenobject* (234), *trace-companions* (282), KB.2 *invariant-parameter* (338), *oper-slice* (355), *quantized-hitchin* (386), *zhu-identification* (403), KB.3 *tensor-comparison* (480), KB.4 *bessel-isocrystal* (505), *log-extension* (536), KB.6 *rigidity-local* (750: Irr_∞=rank H, invariants and N_∞ zero, outside even-A at p=2), KB.11 *all-prime-corollaries* (1279: every almost-simple H at every p, A₄ at p=2);
  - open contracts G3, G4, G6 and G7 (lines 1330–1370), as the README's contract paragraph says;
  - KB's G and H are "split pinned automorphic group" and its dual (line 11), with trivial tame character, as stated.
- EtaleDualityAndPerverseSheaves §5.2 `curveEulerPoincareSwan` (its README at #1040, lines 4920–4925): same hypotheses as the contract (smooth connected curve over an algebraically closed field, lisse ℚ̄_ℓ-sheaf).
- DeligneWeightsAndPurity §8.19 (#929, line 2719): normal finite-type 𝔽_q-scheme, one-ι purity gives geometric semisimplicity.
- PadicDifferentialEquationsAndRigidCohomology at #1002: RD.4.12 (line 7359), RD.5.46 (9690, finiteness, duality and the boundary sequence), RD.6.23 (11962, L-function as alternating product), RD.6.51–RD.6.55 (12672–12793).
- GlobalShtukasAndFunctionFieldLanglands at #1490: §1.4 (line 614; its API includes the stack trace formula), §§1.9–1.14, 5.3, 5.8–5.10, 7.6–7.9.
- SmoothRepresentationsOfLocalGroupsPartII at #1815: §5.1 (line 1057), §5.26 (1420), §6.1 (1567).
- On main: EtaleCohomologyFoundations F.0–F.4 (compact support F.2.5, inertia F.3a).

**Ownership.** `roadmaps grep 'simple supercuspidal|Gross.Reeder'` finds the Gross–Reeder anchor and π(φ) only in this README. KB states no product decomposition (grep for products and factors in its design), so §4.0 keeps the product statement, as the previous repair allowed.

The restriction of §4.0 to simply connected G₀ matches the source: hny line 147–148 states uniqueness of π(φ) only for semisimple simply connected G. §4.2 carries the anchor to reductive G through the reductive-central-reduction contract, as before. Its parameter transport is §3.3 (normal image, central kernel), which also covers inseparable isogenies such as SL₂→PGL₂ at p=2 (Check at line 493).

`scratch/overlaps.md` lists no other pull request changing this folder and no dropped id. No other roadmap cites a §4.0 sub-item: `roadmaps grep GlobalShtukasAndFunctionFieldLanglandsPartII` finds only #1490 line 2236 and #1815 line 1891, at layer level.

**Seeded sample, where it falls in the changed passages.**
- 4.0: hny line 135–153 (Gross–Reeder V_φ, unique π(φ) for semisimple simply connected G, p. 3–4); hny line 950–961 (Theorem 1 with tame principal unipotent at 0, and the Satake sentence, p. 17); hny line 976–981 (Theorem 2, see R03); ghs line 450–485 (Proposition 3.9 and proof, p. 10); ghs line 486–492 (Remark 3.10, p. 11); xz line 2478–2502 (Corollary 4.5.7, pp. 53–54); xz line 2503–2516 (Remark 4.5.8(i), (iv), p. 54).
- 5.4 (Check citation): ch26 line 1192, Corollary 6.32(1), p. 25; SRPII §5.26.
- 3.3, cited by §4.0: ghs line 266 (Theorem 2.1(iii), p. 6), line 284–307 (Theorem 2.3(iv)–(vi), pp. 6–7), line 320–323 (Corollary 2.4(ii), p. 7); fs line 1329–1342 (Theorem I.9.6(ii), (vi), (vii)).
- All match the statements as written. §3.3's kernel hypothesis is stricter than ghs (vi) and is justified by its relative-Frobenius Check.
- The other sample targets (0.2, 1.1, 1.3, 2.1, 2.2, 3.1, 3.7, 4.1, 4.5, 4.8, 8.4, 8.6) lie outside the diff. 1.1, 4.5 and 4.8 were read at their locators in the previous review.

**Library at the pins** (Mathlib f6090c70, Tau Ceti 358314d4). The changed docstring bullet for §4.0 is correct:
- TauCeti/NumberTheory/Padics/GroupAlgebra/Swan.lean is Swan's theorem on projective `ℤ_p[G]`-modules, not a Swan conductor.
- Mathlib/RingTheory/WittVector/Isocrystal.lean is the point-valued Witt-vector isocrystal, not an overconvergent F-isocrystal on a curve.
- No lisse-sheaf, local-system or automorphic-representation carrier exists (grep).

**Adversarial table.** Rows for changed statements are new. Rows marked "prev." are carried from the previous review at 1858508 for statements the diff leaves untouched, with that review's values.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 4.0 anchor: inducing subgroup I₁·Z(G₀)(F_∞) | SL₂ over 𝔽₃((1/t)); SL₂ over 𝔽₄((1/t)); SL₃ over 𝔽₄((1/t)) | Z(F)={±1}, order 2 prime to 3; μ₂(F)=1 at p=2; μ₃(𝔽₄) order 3 prime to 2; I₁ pro-p, so I₁∩Z=1 | product direct, inducing character well defined once read as ψ∘φ | R02 (notation) |
| 4.0 anchor: uniqueness | G₀ simply connected vs PGL₂ | Ω=π₁(G₀): trivial gives a 1-dimensional equivariant function space (hny Lemma 2.1); PGL₂ would give \|Ω\|=2 | s.c. restriction matches hny line 148; no route in README | R02 |
| 4.0 product decomposition | SL₂×G₂ | affine simple root lines 2+3=5=dim V; Swan 1+2=3; invariants 0+0=0 | consistent | none |
| 4.0 trivial group | rank 0 | Lie H=0, V=0, Swan 0; V_φ and π trivial; Steinberg of the trivial group is trivial | consistent | none |
| 4.0 parameter agreement: I-invariants under semisimplification | H=PGL₂ at 0 and at ∞ | at 0: dim ker(ad N)=1 vs 3 after W_(F_0)-semisimplification; at ∞: N_∞=0, so 0 and 0 | stated inference refuted at 0; conclusion at ∞ true by N_∞=0 | R01 |
| 4.0 degree of the L-function | L=∏det(1−tF\|H^i_c)^((−1)^(i+1)) for Sym²Kl₂(1) | h⁰_c=h²_c=0, h¹_c=1, L=1−T/4, degree 1=−χ_c | holds, cancellation-invariant | none |
| 4.0 p-adic GOS on G_m | E=Be†_Ad for A₁, G₂ | χ=0·rank−Irr_0−Irr_∞: −0−1=−1 and −0−2=−2 | matches RD.6.55 | none |
| 4.0 étale invariant count | A₁; G₂ | A₁: dim Lie 3, ker(ad N)=1, h¹_c=1; G₂: Sym²⊕Sym¹⁰=3+11=14, ker(ad N)=2, h¹_c=2 | injection into an r-dimensional H¹_c forces I_∞-invariants 0 | none |
| 4.0 Check: Kloosterman second moment | brute force over 𝔽₂, 𝔽₃, 𝔽₄, 𝔽₅, 𝔽₇ | ΣK(a)²=1, 5, 11, 19, 41 =q²−q−1; tr(F\|H¹_c Sym²Kl₂)=1 at every q; normalized 1/q (1/4 at q=4) | as stated | none |
| 4.0 Check: constant sheaf | rank 2 on G_m | χ_c=2·0=0 vs χ_c(Kl₂)=−1 | distinguishes | none |
| 4.0 Check: A₄ at p=2 | SO₃ adjoint character | (1·3+3·(−1)+8·0)/12=0 | as stated | none |
| 4.0 statement: HNY hypothesis | E₈ at p=5, D₄ at p=2 | both simply laced, inside hny Theorem 2 as printed (line 976) | "p is good" misdescribes the source | R03 |
| 4.2 route: G_sc×Z°→G | PGL₂; GL₂ at q odd and at p=2 | cokernel F^×/F^×²: order 4 (q odd); infinite at p=2 (U¹/(U¹)² infinite) | carried by the reductive-central-reduction contract as in the previous version; parameter by §3.3 | none |
| 5.4 Check (citation repaired) | q=4, coroots (a,b) | (−1)^a·2^b: −1, 2, −2, 2, −2, −4; without s_c, (3,2) gives 4 | matches SRPII §5.26 line 1420 | none |
| Suggested.lean docstring, §4.0 bullet | pins | no Swan conductor, overconvergent isocrystal or lisse sheaf at the pins | correct | none |
| Conventions, Tate/N directions (prev.) | q=4, r=diag(1,4), Ne₁=e₀ | rNr⁻¹=N/4; weights 0,2; N: gr₂→gr₀ | consistent | none |
| Conventions, Weil×SL₂↔WD (prev.) | upper generator e | Ad(diag(q^(−1/2),q^(1/2)))e=q⁻¹e | consistent | none |
| 0.1 geometric (prev.) | q=4: 2, 3; (3+4i)/5; e^i | weight 1; log₂3∉ℤ; modulus 1 of infinite order; transcendental | as stated | none |
| 0.2(b) S₃ (prev.) | q=5, q=4, inertia C₃ | 5≡2 mod 3 inverts C₃; trace values 1, −1; q=4≡1 allows trivial Frobenius | as stated | none |
| 0.3 purity (prev.) | diag(1,q), N=0, Salem quartic | pure of weight 1; N=0 fails; real root 1.72208380574 | as stated | none |
| 1.1 twist classes (prev.) | ℓ=7 over 𝔽₂: 1+i, 1+2i; ℓ=5: 3 | \|1+i\|=2^(1/2); \|1+2i\|=√5 not 2^(w/2); 3 a 5-adic unit | as stated | none |
| 1.2 boundary propagation (prev.) | Kl_n at 0; 3 on G_m/𝔽₄ | Weil q^(0..n−1); single gr_(n−1); no integer weight | as stated | none |
| 1.3 Frobenius cocharacter (prev.) | q=4, diag(2,1/2); torus | ω(α)=log 4>0; torus weight-2 control | as stated | none |
| 2.1 occurrence (prev.) | L[ε]/(ε²); G_m, ξ=3^deg | block dim 2 vs eigenspace 1; 3^d≠1 | as stated | none |
| 2.3 nonsplit (prev.) | Res PGL₂, t_w=1 | eigenvalues 1,1,−1,−1; C₂ projection nontrivial | as stated | none |
| 3.1 Frobenius bookkeeping (prev.) | q₁=4, deg v=2, α⁴+α+1=0 | α⁴=α+1≠α; α¹⁶=α; bounds 3→5→7 | as stated | none |
| 3.1 congruence model (prev.) | x∗y=x+y+zxy | (1+zx)(1+zy)=1+z(x∗y); special fibre G_a | as stated | none |
| 3.6 residue degree (prev.) | E/F unramified quadratic | ±q_F^(1/2) weight 1; ±q_F^(1/4) weight 1/2 | as stated | none |
| 4.1 ι-tempered (prev.) | Salem ζ; ζ₃; (3+4i)/5 | 1.72208 at real embedding; moduli 1 | as stated | none |
| 4.3 pseudo-coefficient (prev.) | PGL₂ | tr St=1, tr 1=−1, principal series 0 | as stated | none |
| 4.4 essentially discrete (prev.) | GL₂, q=4, χ(ϖ)=3 | central 9; pair (6,3/2); ratio 4 | as stated | none |
| 5.1 separators (prev.) | PSO₈, PSO₁₂, PGL₂×PGL₃, 𝔽₂((t)) | half-spin 2,0,−2 with 1,6,1; ±1 with 4,4; pairings 3/4, 1/2 | as stated | none |
| 5.2 lifting (prev.) | p=2 vs odd p; ±I | cd_p≤1, H²(G_K,ℤ/2)=0; traces ±2 | as stated | none |
| 5.4 PSU(2n+1) (prev.) | PSU₃ | ½ω₁ separated only by spin of Spin₃ | as stated | none |
| 6.1 elliptic (prev.) | GL₂ χ₁⊕χ₂; torus; V₄⊂PGL₂ | S_σ/G_m 1-dim; centralizer V₄ | as stated | none |
| 7.5 rationality (prev.) | [[0,−1],[1,0]] | X²+1 over Q(i) | as stated | none |
| 8.0 recognition (prev.) | Spin₈, Sp₆ classes | 1,6,1 vs 4,4; 3,3 vs 1,1,2,1,1; norms 3/4, 5/4 | as stated | none |
| 8.4 Property A (prev.) | small arrays | r(2)=2, c(3)=1>r(3)=0; signed array fails | as stated | none |
| 8.5 F₄ B₃ (prev.) | x=(5/2,1,1/2,0) | multiplicities 1,0,2 vs 1,0,1; printed point top weight 16 | as stated | none |
| 8.5 Sp₆ (prev.) | (2,2,2) | n_x(2)=1>0 | as stated | none |

## Not verifiable

- **KB citation numbering.** KloostermanSheavesAndBesselIsocrystals is neither on main nor in an open roadmap pull request (`scratch/citations.md`). Its package README sits on a board pull request this brief does not give. I resolved every KB citation against its board design (`packages/KloostermanSheavesAndBesselIsocrystals/design/README.md`), whose layer labels KB.k and target slugs the README uses. The package review on the board (`packages/KloostermanSheavesAndBesselIsocrystals/reports/REV-PKG-KloostermanSheavesAndBesselIsocrystals.md`) shows the package README numbering sections §k.n, for example §11.5 for the XZ Corollary 4.5.7 / Remark 4.5.8(iv) target. Once KB is ported, the "§KB.k (*slug*)" citations will need its final numbers. That cannot be checked now.
- **Primary sources not cached.** Gross–Reeder (supercuspidality of V_φ) and Gross's prescribed-local-behaviour paper (uniqueness of π(φ), Steinberg at 0) are not in the sources cache. The README cites neither directly; R02 asks for them or for the weaker statement.
- **Carried from the previous review.** The arXiv v3 wording of ghs Theorem 1.2 was not read. The E₇ and E₈ adjoint weight profiles were checked against ch26 Tables 2–3, not recomputed.

## Source issues

- **Error** in ghs at Remark 3.10, p. 11: the source says that the irreducibility proved by HNY and XZ makes Lafforgue's semisimple parameter composed with the adjoint representation irreducible; it should be that the parameter lies in no proper parabolic, since for G=SL₂ at odd p the adjoint inertia image preserves the torus line; affects nothing.
