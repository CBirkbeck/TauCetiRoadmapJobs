# FIX-RT-AutomorphicSpectralTheoryPartII~2

## RT-AutomorphicSpectralTheoryPartII~2a/F01 (P3) — applied

§2.3, depth/modulus Check. Old: the GL₂ diag(a,1) Check claimed that reading d_B^G≍|a| in place of δ_B^G gives a different weight. New: GL₂ is kept but stated as not separating the two (both ≍|a|, both 4 at |a|=4). The separating witness is now GL₃ diag(t²,t,1), t≥1: root values t, t, t², so the minimum is d_B^G≍t and the product is δ_B^G=t⁴ (2 against 16 at t=2, ratio t³ unbounded); at P=Q the modulus is 1 and there is no depth. I recomputed this from 2ρ_B=2(e₁−e₃). No other Check uses GL₂ to separate depth from modulus. The Conventions witness (δ=4, contributions 2 and 1/2) concerns the modulus only and is still correct.

## RT-AutomorphicSpectralTheoryPartII~2a/F02 (P2) — applied

Verified. AdelicAlgebraicGroups §3.1 defines the absolute a_M=Hom(X*_F(M),ℝ) and the relative a_P^G=ker(a_P→a_G) with dual (a_P^G)*. BPLZZ's a_M is Z(𝔸)M(𝔸)¹∖M(𝔸) (bplzz line 1149, footnote 6 at line 1154: "usually denoted a_M^G"). New Conventions paragraph: Layers 2–3 keep the absolute spaces. Layers 4–5 use (a_M^G)* for twists, inducing parameters, central quotients and splittings, with a G_m witness and a GL₂ (s,−s)/(s,s) witness. I replaced every occurrence in §§4.5–4.8 and 5.1–5.2: c_M*/(a_M^G)*, i(a_M^G)* twists, s∈(a_M^G)ℂ*, ℓ:h*→(a_M^G)*, and the 4.5 Check "c_M=a_M^G". I added a pointer in the Layer 4 conventions and new G_m Checks in §4.5 and §5.1. The needs of gap:central-character-affine-lattice and gap:cuspidal-data-central-comparison now name the relative space, in the README and in plan.json. As the review asked, §§3.1, 3.7 and 3.10 are unchanged.

## RT-AutomorphicSpectralTheoryPartII~2a/F03 (P2) — applied

Verified. In the parent roadmap, AutomorphicSpectralTheory §6.3 covers spectral multipliers from Arthur's Paley–Wiener paper and §6.4 covers compact convolution kernels with their spectral form. Factorization, central disintegration and the spectral identity are separate inputs, used in §§3.2, 3.8 and 3.10. I split the gap into gap:arthur-factorization-comparison (§6.3), gap:compact-kernel-central-comparison (§6.4) and gap:compact-kernel-spectral-comparison (§6.4), each with its own one-sentence needs, in both the README and plan.json. §3.2 cites the factorization contract, §3.8 the central one, and §3.10 both the factorization and spectral contracts. I named each contract in its route.

## RT-AutomorphicSpectralTheoryPartII~2a/F04 (P2) — applied

§2.10 API bullet. Old: "S is dense in every smooth weighted L² space and in C([G]_P)". New: "S is dense in every smooth weighted L² space". C-density stays in §2.11 (statement and API), whose Needs include §2.10, so the reverse edge is gone. The §2.10 statement paragraph never mentioned C.

## RT-AutomorphicSpectralTheoryPartII~2b/F01 (P3) — applied

Verified: the §1.9 statement extends the real multiplier Tμ of §1.7, and §3.3 quantifies over C([G]_P) of §2.11. Neither was reachable through the listed Needs. Added §1.7 to the §1.9 Needs and §2.11 to the §3.3 Needs. Neither §1.7 (Needs §1.6, §0.5) nor §2.11 (Needs §2.4, §2.8, §2.10) reaches back, so no cycle is introduced.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| §2.3 depth vs modulus Check | GL₂ diag(a,1), \|a\|=4; GL₃ diag(t²,t,1), t=1,2 | GL₂: d≍4, δ=4. GL₃ t=2: roots 2,2,4, min 2, product 16; t=1: 1 and 1 (ratio 1, so t≥1 large separates) | true; ratio t³ unbounded |
| Conventions relative space | G=M=G_m/ℚ; GL₂ Borel; M=G general | G_m: dim a_M=1, dim a_M^G=0; GL₂ (s,−s) on z=diag(z,z): \|z\|^{s−s}=1; (s,s): \|z\|^{2s}; M=G: a_G^G=0 | true |
| §4.5 central quotient | G_m with ω=1, χ∞=0 vs 1; diagonal torus of SL₂ (c_M=a_M^G) | G_m: quotient c_G* is 1-dimensional, differential pinned at 0, 1 rejected; SL₂ torus: quotient 0, condition automatic | consistent with the §4.5 Checks and the §4.7 rank-zero coset |
| §5.1 occurrence | G_m, ω=1, σ=1, T all finite places | only s=0; χ∞=1 does not occur; full-group nonoccurrence Check holds | consistent |
| §5.2 splitting ℓ:h*→(a_M^G)* | M=G | (a_G^G)*=0, so s_w=0: the full-group case uses an invariant polynomial or a Hecke element, as the route already says | consistent |
| Three Arthur contracts | one-point group; circle; GL₂ δ=4 | factorization f=f·1+0 (g₁=δ₁, Z=0); K⁰=K=f(1); δ^(−1/2)=1/2 fixed by the central contract alone | independent |
| §2.10 density | compact quotient; modular cusp | S=C=C∞, dense; C-density proved only in §2.11 | acyclic |

## Checks run

- `lake env lean packages/AutomorphicSpectralTheoryPartII/Suggested.lean` (rerun after the final edits): exit 0. It printed only three `declaration uses 'sorry'` warnings, at lines 87, 100 and 110, for the three theorems. The only change to `Suggested.lean` this round is the `module` header (see the last item below). It has no `variable` or `include`, and the ten elaborated signatures in the job's signature file match their README statements in §§0.1–0.3, so no `#check` comparison was needed.
- Dependency check (rerun after the final edits): `depcheck: 201 roadmaps, 1424 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Gap consistency: all 31 slugs in plan.json `gaps` (29 before, plus 2 from the F03 split) match the README's "Exact supplier contracts" lines on supplier, needs and section (mechanical comparison). Nothing outside `gaps` changed in plan.json.

## Gate failures repaired

- tex=7 (gap:compact-kernel-central-comparison): the `needs` sentence used TeX-style subscripts `K_{f,P}`, `K_{f,P,χ}`, `K⁰_{f,P,χ}` and `∫_{A_P∞}`. In the README contract line and the matching plan.json `needs`, the kernels and the identity are now inline code spans without braces (`K_f,P`, `K_f,P,χ`, `K⁰_f,P,χ(x,y) = ∫ K_f,P,χ(x,ay) δ_P(a)^(−1/2) da`, the integral over `a ∈ A_P∞`). The mathematics is unchanged. README and plan.json still agree word for word, plan.json still parses, and the dependency check still reports `depcheck: 201 roadmaps, 1424 edges, 0 problem(s)`.

- tex=2 (gap:compact-kernel-spectral-comparison): the `needs` sentence wrote `K⁰_{f,χ}` and `ia_P^{G,*}` with TeX-style braces outside code spans. In the README contract line and the matching plan.json `needs` (word for word), it now reads "the support component `K⁰_f,χ`", "coefficient `|𝒫(M_P)|^(−1)`" and "the imaginary relative space `i(a_P^G)*`". The last is the space written `ia_P^{G,*}` in §3.10 and is consistent with the relative-space convention of the F02 repair. The mathematics is unchanged. A scan of the README for `_{`, `^{`, `\(`, `\[` and `$` outside code spans now finds nothing. plan.json parses, differs from the base only in `gaps`, and its 31 entries match the 31 README contract lines.

## Notes for the maintainer

- AutomorphicSpectralTheory gains two new contracts, gap:compact-kernel-central-comparison and gap:compact-kernel-spectral-comparison, both §6.4. gap:arthur-factorization-comparison now names only §6.3. That section's text is Arthur's spectral multiplier, so the factorization f=f*g₁+(f*Z)*g₂ is a genuine addition requested there. Ownership: all three remain contracts on a supplier earlier in the merge order; no new target was stated here.
- No Lean names changed; no other roadmap cites a name that changed.
- No suspicious instructions were found in the review texts.
- The new and split contracts are all on AutomorphicSpectralTheory, which is on main and earlier than this roadmap in the merge order. No construction moved into this roadmap and none moved out, so no new ownership question arises against the open roadmap pull requests.
- Module-system warning: Lean warned that `Suggested.lean` imports `Mathlib`, which is built for the module system, without a `module` header. The file now starts with a `module` line, then a blank line, then the single line `import Mathlib`. Nothing else changed: no import was added and no declaration was edited. The file elaborates again (exit 0, only the three `sorry` warnings), and the module warning is gone.
