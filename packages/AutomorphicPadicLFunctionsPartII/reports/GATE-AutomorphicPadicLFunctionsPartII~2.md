# GATE-AutomorphicPadicLFunctionsPartII~2: answers to the human review of head 93bdf3a

Review answered: CBirkbeck, 2026-10-25T22:54:46Z (three numbered findings and a "checked and found sound" list). The first finding makes two separable points (the all-type sign, and the §8.4 extension across types), so it is split into H01 and H02. Repairs are in commit `ff6772c3` on top of `93bdf3a`. Only `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/README.md` changed; `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — applied differently

The density argument is correct, but what it proves is that the roadmap's formula and the *printed* unsigned KS-v4 Theorem 5.27 exclude each other. It does not prove the roadmap's formula false. The printed theorem is not a valid anchor. Its proof applies Theorem 3.27 (KS-v4 line 3514), and that theorem's derivative step (proof of Proposition 3.23, KS-v4 line 1977) writes `(πr)^a` where each `∂_z exp(2πi Im H_r(λ,z))` contributes `−π r barλ`.

Repair:
- **§8.3 (README line 1244).** The unproved sentence "weighting, inversion and coset summation give the displayed factors without an additional constant sign" is replaced by the test-function argument the review asked for. For an arbitrary finite-order twist, the integrand on each coset is `t^a s^β F̃_i` with `F̃_i` locally constant, so §7.4 applies. Every translated coordinate in §7.4 has the same index, and §7.4 evaluates `P_Aρ`, not `P_A(ρ∘[−1])`, so ε is common to a character and all its twists. The paragraph also states what a reflection or an Artin translation would do instead.
- **§8.5 (README line 1307).** The paragraph now says where and why the target differs from the printed Theorem 5.27. For even d, ε is constant and the two formulas differ only by that constant.
- **§8.5 Checks (lines 1323–1325).** Added:
  - the review's χ₃η_k / χ₄ example as a cross-type regression check;
  - a check showing that flipping the Fourier kernel of §7.3 reverses the predicted limit. The identity behind it is `ε = (−1)^(d(d−1)/2+1)·χ(q_f(−1))·χ_fin(−1)`.
  - Hida–Tilouine's statement of Katz's CM-field measure (HT-1993, Theorem II, p.193). Its factor `(−1)^(m₀Σ)` equals `(−1)^(|α|+|β|)`, so a parity-dependent sign does occur in a single all-type formula.
- **Circular checks.** The two checks at lines 1271 and 1321 compared a weight-four moment with its own signed formula. They are reworded so they no longer claim to test ε.

The review's suggested repair (drop ε, or move it by a reflection) is not applied. With the test function carried through, the roadmap's own chain (§4.3 → §7.1 → §7.4 → §8.3) has no reflection. That chain is the structure of KS-v4 Corollary 5.25 and the proof of 5.27 (KS-v4 lines 3496–3575). The review accepts its kernel conventions and the §4.3 local identity. Inserting a reflection would need an identified sign error in KS-v4 §5.5, and none has been found.

## H02 (CBirkbeck) — applied

The review is right that the Kummer condition of §8.4 tests only twists of one fixed avatar. On that family ε is constant (and `−M` satisfies the same congruences as `M`), so the congruences alone cannot fix values at other types. The proof route (README line 1292) used to end with "Show the auxiliary relations identify all resulting bounded extensions". It now gives the actual mechanism:
- `δ_c*μ_f` and `μ_(f,c)` agree on the twists of χ₀, hence everywhere, since both are bounded;
- for χ of another type, choose c with `δ_c(χ)≠0` and divide the all-type formula of §8.3;
- in conductor one, choose c, c′ with `δ_c(χ)δ′_(c′)(χ)≠0`.

A Check was added at line 1299 recording that a twist-family congruence cannot detect a type-only sign.

## H03 (CBirkbeck) — applied

§2.6, proof route (README line 454): "a sum of Koszul complexes, exact below the top degree" is replaced by the truncated-Koszul computation, following HK-2018, Proposition 7.1.2 and Corollary 7.1.3, pp.29–30 (HK-2018 lines 1329, 1389):
- Below de Rham degree 2d, the second page consists of nonzero endpoint cokernels in `H^i_dR(A/k)⊗Sym^n(H)`.
- So `H^i_dR(A,π*Sym^n H)→H^i_dR(A,P♮^(n))` is surjective for i<2d, and its composite to level n−1 is zero. That is the vanishing of the transition maps.
- In degree 2d, the edge map to `O_A` followed by the trace identifies every level with k, with identity transitions.

The locators were added to the §2.6 citation and to the HK-2018 reference entry. The d=1 dimension check at line 458 already agreed (2, 3, 1 at n=1) and is unchanged. No other occurrence of the "exact below the top degree" wording remains.

## H04 (CBirkbeck) — answered

This concerns the pull-request description, which this job may not edit. The README makes no claim about other authors' pull requests. The point itself is correct:
- This roadmap consumes only P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4 and P4.1–P4.3 of AbelianSchemesAndArithmeticModuliPartII (#1405).
- #1405 itself consumes LieGroupoidsPoisson G0.1 (#1050, kim-em, open at f1e1e4c), in its README lines 37, 303, 305, 1425 and 1455.
- So the whole-pull-request merge chain includes #1543 → #1405 → #1050, although no consumed interface depends on it.

The worker should remove the blanket "depends on no other author's open pull request" sentence from the description, or list the transitive prerequisites.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.6 truncated Koszul second page | d=1, n=0 and n=1 | n=0: no differentials, dims 1, 2, 1. n=1: H⁰=Sym¹H (2); H¹=coker(Λ²H⊗Sym⁰→Λ¹H⊗Sym¹)=4−1=3; H²=1 | matches line 458 (n+1, n+2, 1) | route rewritten |
| §2.6 surjectivity and zero transition | d=1, n=1, i=0 and i=2 | i=0: H→H⁰(P♮^(1)) is an isomorphism (2=2), and its composite to H⁰(O_A)=k is 0, matching line 459. i=2: E₂^{1,1}=coker(Λ¹→Λ²⊗H), a 2→2 isomorphism, so 0; H²(P♮^(1))→H²(O_A) is 1→1, an isomorphism | consistent | — |
| §8.3 coset integrand | (α,β)=(2,1), t=2, s=3, χ_fin trivial | t^α s^β·t⁻¹ = 4·3/2 = 6 = t^a s^β | matches line 1270 | — |
| §8.3 reflection versus translation | χ₄, d=1, weighted integrand t³ | (−t)³ = −t³; equals (−1)^d·χ₄(q_f(−1))·t³ = (−1)(+1)t³ | consistent | stated in text |
| §8.4 choice of c with δ_c(χ)≠0 | χ=λ⁻⁴, c=(7); general critical χ | 49−2401 = −2352 ≠ 0. δ_c(χ)=0 needs χ(c)=Nc⁻¹, but for χ₄, \|χ₄(c)\|=Nc⁻² | always possible | route rewritten |
| §8.4 congruences cannot fix the sign | m=0, one character | M(χ₀)∈O ⟺ −M(χ₀)∈O | confirms H02 | Check added |
| §8.5 ε constant for even d | d=2, α=(1,1), β=0 and α=(2,2), β=(1,1) (w=−1); d=4 | ε=(−1)^{1+2+1}=+1; ε=(−1)^{1+6+1}=+1; d=4: ε=(−1)^{6+even+1}=−1 | constant | text scoped |
| §8.5 cross-type test, map μ₄→(ℤ[i]/f)× | f=(1+i)³ | target has order 8·½=4. i−1, −2 and −i−1 have (1+i)-valuations 1, 2, 1 < 3, so the map is injective, hence bijective; U_f=1, Cl_f=1 | correct | Check added |
| §8.5 cross-type test, signs | χ₃, χ₄, ψ at q_f(−1) | ε(1,2,0)=(−1)^4=+1, ε(1,3,0)=(−1)^5=−1; ψ(q_f(−1))=σ(−1)⁻¹=−1; Σ-component −1, barΣ-component +1 | correct | — |
| §8.5 cross-type test, U(χ₄)≠0 | v above 5 | \|χ₄(v)\|=5⁻²; \|χ₄(v)⁻¹/5\|=5≠1 and \|χ₄(barv)\|=1/25≠1, so both Euler factors are nonzero; Local=1 | nonzero | — |
| §8.5 kernel flip | χ₃η_k, χ₄ | Local⁺=χ_fin,Σ(−1)·Local: −1 for χ₃η_k, +1 for χ₄ | reverses the limit | Check added |
| Identity ε=(−1)^(d(d−1)/2+1)χ(q_f(−1))χ_fin(−1) | χ₄; χ₃η_k; λ⁻⁴ at f=(3) | χ₄: (−1)(+1)(+1)=−1 ✓. χ₃η_k: (−1)·[(−1)(−1)]·(−1)=+1 ✓. λ⁻⁴ at f=(3): (−1)(+1)(+1)=−1=ε(1,3,0) ✓ | holds | — |
| HT-1993 parity | #Σ=1 with (m₀,d)=(2,1) and (1,0); #Σ=2 with m₀=1 | (−1)^2=+1=(−1)^{3+1}; (−1)^1=−1=(−1)^{1+0}; (−1)^2=+1 with \|α\|+\|β\|=2+2\|d\| | (−1)^{m₀Σ}=(−1)^{\|α\|+\|β\|} | Check added |
| KS-v4 line 1977 derivative | λ=1, h=1 | ∂_z e^{−2πiy} = ½(−i)(−2πi)e^{−2πiy} = −π e^{−2πiy}, i.e. −π·barλ; printed sign is +π | omission confirmed | cited |
| d=1 Green's-function sign | ∂_z(z+λ)⁻¹ | −(z+λ)⁻²: the a=1 coefficient is −1 and a=2 is +2 (line 741) | consistent with (−1)^a | — |

## Signatures, ownership, sources

- **Signatures.** `Suggested.lean` is unchanged. I compared the elaborated types in the job's `signatures.md` (4 declarations) with README §§3.3–3.4: the binders d, `0<d`, Λ, `DiscreteTopology`, `IsZLattice`, h, positivity, ν, z, w (and Λd with its membership hypothesis) all appear, and no binder was dropped.
- **Ownership.** No new construction or target was added. HT-1993 is cited as evidence for a sign, not as a supplier.
- **Sources.**
  - HT-1993 was read from Numdam, an open repository, through the sources service. `sources.toml` is outside this job's edit scope (there is none in the folder), so the worker should record `HT-1993`: theorem, Theorem II, cited for §8.5.
  - HK-2018 was re-read at arXiv v1; the new locators Proposition 7.1.2 and Corollary 7.1.3 should be added to its entry.
  - No text was missing; `needs-references.toml` was not created.

## Build and gate

- `lake build TauCetiRoadmap.AutomorphicPadicLFunctionsPartII.Suggested`: **Build completed successfully (8976 jobs)**, with two `declaration uses 'sorry'` warnings (lines 67 and 90).
- Gate summary line: `gate AutomorphicPadicLFunctionsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`--depcheck --movable`): `depcheck: 55 roadmaps, 637 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
