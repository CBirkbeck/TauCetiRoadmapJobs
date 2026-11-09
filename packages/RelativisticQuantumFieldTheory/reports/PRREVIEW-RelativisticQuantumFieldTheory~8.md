# Review of RelativisticQuantumFieldTheory (pull request #1772 at 4d88833)

**Verdict:** accepted

This is an incremental re-review of the 40 lines that changed since ed01009, all in `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md`. `Suggested.lean` and every file outside the folder are unchanged.

- R01–R09 are all repaired, and the repairs introduce no new defect.
- R10 and R11 are corrections to two existing records of the board manifest. The repair reply answers that a repair job may only add records, never change one. That reason is correct, so the two findings are settled and not raised again. The values the worker still has to set are under Previous findings.
- The gate passes, `Suggested.lean` elaborates with only its 14 `sorry` warnings, and the dependency check reports 0 problems.

No findings at this head.

## Previous findings

- R01 — repaired: "Expanding `|Dφ|²=(∂_μφ̄−ieA_μφ̄)(∂^μφ+ieA^μφ)` gives the one-photon term `−ieA^μ(φ̄∂_μφ−∂_μφ̄φ)`, which is `−eA_μj^μ` … On an incoming `e^(−ip·x)` and an outgoing `e^(ip′·x)` the one-photon term is `−e(p+p′)·A`" (README line 5108).
- R02 — repaired: the §4.15 Check (line 1366) now states one-particle Reeh–Schlieder as density. It proves it through the forward-tube continuation of `x↦⟨h,K(f(·−x))⟩`, and keeps `f=(□+m²)g` as a negative control for the pointwise claim.
- R03 — repaired: "that is `wt(c)+q≤0`. With nonnegative coefficient weights this forces `wt(c)=q=0`. In the stage `k[g]/(g^(N+1))` with `wt(g)=−1` it admits `c=g^j` with `q=j`" (line 4255).
- R04 — repaired: "Questions 3–4 of Borcherds–Barnard §8.3 (p. 65) ask for these results" (line 4125). The repair also moved the surface-term remark to "§8.3 (p. 66)" (line 4423), which is correct: borcherds-qft lines 2431–2433 follow the page-66 marker.
- R05 — repaired: "For the even jets the Hopf structure is the library's … `SymmetricAlgebra.instBialgebra` … `TauCeti.SymmetricAlgebra.instHopfAlgebra` … This roadmap owns the rest of the field-jet carrier: … the ℤ/2-graded extension by the odd jets" (line 1463). The supplier contracts are at lines 34 and 46.
- R06 — repaired: "The characterisation is the library's … Mathlib's `MonoidAlgebra.isGroupLikeElem_iff_mem_range_single_one` (stated over any commutative domain and for any exponent type)" (line 1438). A new negative-control Check over `ℤ/6ℤ` is at line 1445.
- R07 — repaired: "Use the scalar-electrodynamics, sourced-Maxwell and Dirac Lagrangians of LocalVariationalFieldTheory §3.8–§3.10 and the Noether currents of LocalVariationalFieldTheory §4.1 as the classical input of §9.4 … §9.6 … and §9.13" (line 5033).
- R08 — repaired: "(Weinberg, *The Quantum Theory of Fields I*, §5.5, the causal Dirac field, written in his `(−,+,+,+)` metric …)". "The lecture notes" is gone, and `*Needs:*` now adds "Weinberg §5.5" (lines 869, 877).
- R09 — repaired: "Bostelmann, Definitions 2.1 and 4.1, Lemma 3.5, Theorems 3.3, 3.6 and 4.3, (4.6)–(4.7)" (line 1053). The References entry (line 5578) matches.
- R10 — not repaired, settled: the manifest entry `bm23` still reads `title = "Fermionic Bogoliubov transformations"` and `locator = "Theorem 2.8"`, unchanged since f79894f7. The repair reply: "this job may only add to [the manifest], never change". The reason is correct, so this is not re-raised.
- R11 — not repaired, settled: the manifest entry `os75` still has `status = "certified"`, sha256 `b6013daa…`, the five-line Incapsula page. The reply confirms the finding but states no reason. The same constraint applies (changing an existing record), so this is not re-raised.

For the worker, outside the folder and with no change to the pull request, in `packages/RelativisticQuantumFieldTheory/sources.toml`:
- `bm23`: set `title = "Quadratic Hamiltonians in Fermionic Fock Spaces"`, `locator = "Theorem 3.2; Proposition 2.12 (44)–(46)"` and `version_note = "numbering of v7 (22 April 2026); Theorem 3.2 is Theorem 2.8 in v2 (3 October 2023)"`.
- `os75`: set `status = "uncertified"` with `doi = "10.1007/BF01608978"`, and drop the block page's `sha256` and `fetched_from`.

The README's own citations of both works (lines 5581 and 5607) are already correct.

## Verified sound

**Gate, build and dependency check at 4d88833.**
- My rerun of `gate … --base origin/main` exits 0. Every check is 0, including `outside-folder`, `stray-files`, `statement-hygiene`, `readme-ids-missing`, `sorry-data`, `depcheck` and `source-material`. My rerun prints no `build` field; the worker's gate at this head reports `build=0`.
- `lake env lean TauCetiRoadmap/RelativisticQuantumFieldTheory/Suggested.lean` exits 0 in 40 s. It prints 14 `declaration uses sorry` warnings and nothing else, at lines 92, 101, 133, 141, 160, 188, 202, 245, 289, 309, 316, 337, 347 and 358 (identical to ed01009).
- `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2324 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge order: NoncompactQuantumSymmetry 155, QuantumFoundations 209, StochasticCalculus 210, this roadmap 211. LocalVariationalFieldTheory (222), which §9.1 now cites by section, is on main (content c44dcc8), so it is an allowed supplier.
- `git diff --stat origin/main...HEAD` outside the folder is empty. `git diff --stat ed01009..HEAD` touches only README.md. `overlaps.md` and `citations.md` list nothing.

**Lean side (file unchanged since ed01009).** These results carry over from the previous report:
- `#check @name` on all 44 declarations: no lost binder (`signatures.md` agrees: 0 of 44).
- The padding probe: all 14 `sorry`s survive `rfl`, `infer_instance`, `simp`, `norm_num`, `fun_prop`, `positivity` and `exact?`.
- The headline list against the docstring.

No README change touches a statement that `Suggested.lean` states.

**Library declarations opened this round (12).** Each was checked at the branch pins (Mathlib f6090c7, Tau Ceti 358314d) and at main's pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d), with the same file and line at both.
- `SymmetricAlgebra.instBialgebra`, `comul_ι` (`Δ(ι x)=ι x⊗1+1⊗ι x`) and `counit_ι` (`=0`): `Mathlib/RingTheory/Bialgebra/SymmetricAlgebra.lean` lines 27, 39 and 44, over `[CommSemiring R]`.
- `ExteriorAlgebra.prodEquivTensor`: `Mathlib/LinearAlgebra/ExteriorAlgebra/Product.lean` line 109. It is `ExteriorAlgebra R (M × N) ≃ₐ[R]` the ℕ-graded tensor product of the exterior powers, over `[CommRing R]`.
- `GradedTensorProduct`: `Mathlib/LinearAlgebra/TensorProduct/Graded/Internal.lean` line 73.
- `MonoidAlgebra.instCoalgebra`: `Mathlib/RingTheory/Coalgebra/MonoidAlgebra.lean` line 39.
- `MonoidAlgebra.isGroupLikeElem_iff_mem_range_single_one`: `Mathlib/RingTheory/Bialgebra/MonoidAlgebra.lean` line 236, in a section with `[CommRing R] [IsDomain R]` and no structure on `M`.
- `MonoidAlgebra.single_left_injective` (`hr : r ≠ 0`) and `MonoidAlgebra.single_mul_single`: `Mathlib/Algebra/MonoidAlgebra/Defs.lean` lines 245 and 545, inside `namespace MonoidAlgebra` (lines 106–937).
- `IsGroupLikeElem`: `Mathlib/RingTheory/Coalgebra/GroupLike.lean` line 37. Its fields are `counit_eq_one` and `comul_eq_tmul_self`.
- `TauCeti.SymmetricAlgebra.instHopfAlgebra` and `TauCeti.SymmetricAlgebra.antipode_ι`: `TauCeti/Algebra/HopfAlgebra/SymmetricAlgebra/Basic.lean` lines 67 and 82, over `[CommRing R]`.
- Negative search: neither library has a coalgebra or Hopf structure on `ExteriorAlgebra` at either pin. `TauCeti/LinearAlgebra/ExteriorAlgebra/TensorProduct.lean` contains only `map_id_rTensor_ι`. So §5.6's ownership of the odd, ℤ/2-graded part stands.

**Ownership.** `roadmaps grep` for super-Hopf or graded-Hopf structures on exterior algebras over main and the open heads finds only CharacteristicClasses (main, line 1617, C5a.5; line 1629). It concerns the cohomology Hopf algebra of a compact Lie group, a different object, so the field-jet super-Hopf carrier has no second owner.

**Cross-roadmap and internal citations resolved.**
- LocalVariationalFieldTheory on main c44dcc8:
  - §3.8 (line 601): scalar electrodynamics with `D_μ=∂_μ+ieA_μ`, the same convention as RQFT §9.4.
  - §3.9 (line 631): MaxwellSourceAdapter.
  - §3.10 (line 663): FiniteDirac, `L_D`, `j_V`.
  - §4.1 (line 792): evolutionary symmetries and Noether currents, with scalar-electrodynamics examples.
- Internal:
  - RQFT §9.6 (line 5130) and §9.13 (line 5232), the targets §9.1 now names.
  - §3.8 (line 926), which proves continuity of `K` on Schwartz tests and density of the test-created vectors, as the new §4.15 Check uses.
  - §1.6 (line 398), `L_J=−F²/4−J_cl·A`, the sign the §9.4 Check cites.

**Sources checked at their locators.**
- borcherds-qft lines 2421–2428 (p. 65; Questions 1–4) and lines 2431–2433 (p. 66; surface terms and generalized eigenvectors).
- bostelmann05:
  - Definition 2.1 (line 180), Theorem 3.3 (217), Lemma 3.5 (334), Theorem 3.6 (374), Definition 4.1 (410);
  - (4.6) (444), Theorem 4.3 (448), (4.7) (460);
  - (4.8) (465), which is only expected ("should be possible to show", line 464) and is correctly no longer cited.

**Seeded sample.** The diff changes none of the sampled sections. Four of them read changed passages, and I checked each against the new text:
- §4.1 (Needs §3.4);
- §5.1 (A_fld is §5.6's graded carrier);
- §6.36 (its `k[a]/(a²)` witness against §6.38's budget);
- §6.39 (Needs §6.38).

The other sampled sections are untouched and depend on no changed passage. Their Checks were recomputed (rows S16–S26).

**Adversarial table.**
- C rows are the changed statements, with values computed this round.
- Carried rows cite the previous report (r7) for statements the diff leaves untouched.
- S16–S26 are sampled targets.

| # | Statement | Instances and computed values (each side) | Result |
|---|---|---|---|
| C1 | §9.4 Check 2 (line 5108) | `(∂φ̄−ieAφ̄)(∂φ+ieAφ)⊃ieA^μ(∂_μφ̄φ−φ̄∂_μφ)=−ieA^μ(φ̄∂_μφ−∂_μφ̄φ)`. With `j^μ=i(φ̄∂^μφ−∂^μφ̄φ)`, `−eA_μj^μ` is the same term. On `e^(−ipx)`, `e^(ip′x)`: `φ̄∂φ−∂φ̄φ→−i(p+p′)φ̄φ`, so the term is `−e(p+p′)·A` and the vertex `i·(−e(p+p′))=−ie(p+p′)`. Seagull: `i·e²·2=2ie²`. The full current `j_μ=i(φ̄∂φ−∂φ̄φ)−2eA_μ|φ|²` has the stated A-independent part. | sound |
| C2 | §4.15 Check 2 (line 1366) | `K(f(·−x))(p)=e^(iη(p,x))Kf(p)` (shift `y→y+x`). `|e^(iη(p,x+iy))|=e^(−η(p,y))≤1`, since `η(p,y)>0` for `p≠0` on the closed positive shell and `y∈V_+` (also at `m=0`). For `|x|<δ`, `supp f(·−x)⊂B+x⊂O`, so the boundary value vanishes on an open set and hence everywhere. A partition of unity writes any `C_c^∞` test as a finite sum of translates of tests supported in `B`. Control: `□e^(iη(p,x))=−η(p,p)e^(iη(p,x))`, so `K((□+m²)g)=(m²−η(p,p))Kg=0` on the shell. | sound |
| C3 | §6.38 Check 4 (line 4255) | `φ⁴` bubble: `ω=4−4−0=0`, so `wt(c)+q≤0`. `c=g^j`, `q=j`: `−j+j=0≤0`; `j=1` gives `(−1,1)`. `q≥1` forces `wt(c)≤−1`. Agrees with §6.36's `k[a]/(a²)`, `wt a=2` witness: `2+0>0`, excluded. | sound |
| C4 | §6.35 locator (line 4125) | borcherds-qft line 2425 (Q3, invariant prescriptions) and line 2427 (Q4, transitivity under finite renormalizations), p. 65. Q1–Q2 (lines 2423–2424) are symmetry-group questions. | sound |
| C5 | §6.40 locator (line 4423) | The page-66 marker is at line 2430; surface terms and generalized eigenvectors are at lines 2432–2433. | sound |
| C6 | §5.4 (lines 1438, 1445) | Mathlib line 236 holds for `[CommRing R] [IsDomain R]` and any `M`; `ℂ` is a domain. Over `ℤ/6`: `x⊗x=9[e⊗e]+12([e⊗g]+[g⊗e])+16[g⊗g]=3[e⊗e]+4[g⊗g]=Δx`, `ε(x)=7=1`, and the support has 2 elements, so `x` is not `single g 1`. `½([e]+[g])`: `Δx−x⊗x=¼([e⊗e]+[g⊗g]−[e⊗g]−[g⊗e])≠0`. | sound |
| C7 | §5.6 (lines 1463–1465) | Even part: `comul_ι`, `counit_ι=0`, `antipode_ι=−ι`. Odd route: `ψ↦(ψ,ψ)=inl ψ+inr ψ↦ψ⊗1+1⊗ψ` under `prodEquivTensor`, whose ℕ-sign `(−1)^(ij)` is the Koszul sign. `Δ(ψ₁ψ₂)=ψ₁ψ₂⊗1+ψ₁⊗ψ₂−ψ₂⊗ψ₁+1⊗ψ₁ψ₂`. For odd `u`: `Δ(u²)=u⊗u−u⊗u=0`, consistent with `u²=0`. Antipode: `m(S⊗id)Δψ=−ψ+ψ=0=ε(ψ)`, and `S(ψ₁ψ₂)=−S(ψ₂)S(ψ₁)=ψ₁ψ₂`. | sound |
| C8 | §3.4 (line 869) | `tr(γ·p+m)=4m=Σ_sū_su_s=2·2m`. `tr(γ·p−m)=−4m=2·(−2m)`, so `v̄v=−2m`. Weinberg's `η_00=−1` is the `(−,+,+,+)` signature stated. | sound (Weinberg uncertified) |
| C9 | §4.5 *Needs:* (line 1053) | All nine locators are at the bostelmann05 lines listed above. Lemma 3.5 (`φ∈Φ_FH ⇒` local `A_r`) is the body's reverse-inclusion step; (4.8) is not used. | sound |
| C10 | §9.1 (line 5033) | LVF §3.8/§3.9/§3.10/§4.1 at main lines 601/631/663/792 carry the named Lagrangians and currents. LVF's `j_V=−ψ̄Γψ` sign is reconciled in LVF itself (its positive-current remark), and §9.1 claims only "classical input". | sound |
| C11 | Scope line 14; contracts lines 34–35, 46 | All 12 names resolve at both pin pairs (list above). The "over a commutative ring" claim matches `[CommRing R]` at Tau Ceti line 67. | sound |
| S16 | §4.1 (reads §3.4) | Its Checks use only §3.3, §3.10 and the classical Dirac non-example; §3.4 changed only by its locator. | sound |
| S17 | §5.1 (reads §5.6) | "A_fld for the graded field-jet Hopf algebra" is §5.6's `SymmetricAlgebra ℂ V₀` graded tensor exterior carrier; no alias changed. | sound |
| S18 | §6.36 (cites FiniteEngineeringClosure) | `gφ⁶` pair: ports `6+6−4=8`, `L=2−2+1=1`, `ω=0`, `g²φ⁸∉W_6`. `aφ⁴` with `wt a=2` is excluded by `wt c+q≤0`. | sound |
| S19 | §6.39 (Needs §6.38) | `φ⁴`, `φ↦−φ`: `{1,φ²,(∂φ)²,φ⁴}` modulo divergences (`φ□φ≡−(∂φ)²`) gives `4|0`. QED vacuum polarization: `ω=4−2=2`. | sound |
| S20 | §0.8 | `∫e^(ia·x)e^(−|x|²/2)d⁴x=(2π)²e^(−|a|²/2)`. `𝓕f(ξ)=(2π)²e^(−2π²|ξ|²)` at `ξ=−η♭p/(2π)` gives `e^(−|p|²/2)`. `p⁰>0` maps to `ξ⁰=−p⁰/(2π)<0`. | sound |
| S21 | §1.4 | `tr P_T=3−1=2` and `P_T k=0`. On the torus, `−Δφ=ρ` is solvable iff the zero mode `∫ρ=0`. | sound |
| S22 | §3.2, §3.5 | `‖E_ha‖²=Σ|a(k)|²h^(−3)h³`. `ε=(0,ε¹,ε²,0)`: `−η(ε̄,ε)=|ε¹|²+|ε²|²>0`; `dim k^⊥=3∋k`, so the quotient has dimension 2; `ℓ=2h=±2`. | sound |
| S23 | §6.5 | `(2,0)+(−1,√3)+(−1,−√3)=0`, with no opposite pair. `Σ2^(−i)<∞`, so `∏(1+2^(−i))` converges; `Σ1/i=∞`, so `∏(1+1/i)` diverges. | sound |
| S24 | §6.20, §7.8 | `∂e^(ipx)=ip e^(ipx)` (natively `2πiξ`). `Γ(n/2−1)/(4π^(n/2)|x|^(n−2))` at `n=4` is `1/(4π²|x|²)`. | sound |
| S25 | §9.3 | `s(s+1)=l(l+1)−(Zα)²` gives `s=ν_l−1/2`, `b=2s+2=2ν_l+1` and `a=ν_l+1/2−Zαε/√(m²−ε²)`. `a=−n_r` gives `ε=m(1+(Zα)²/(n_r+ν_l+1/2)²)^(−1/2)`. `ν_0` is real iff `Zα≤1/2`. | sound |
| S26 | §11.4, §9.22, §7.3 | Graviton: `10−4−4=2`, `ℓ=2h=±4`. §9.22 is a scope statement whose Needs (§6.40, §9.18) exist. §7.3 is H10–H12 below. | sound |
| H1–H2 | §1.1 Green operators; prescription distributions | Carried from r7: `f=0` gives `u=0`; `|(p⁰+iε)²−ω²|≥ε²`. | sound (r7) |
| H3–H4 | §1.9 relations; shell decomposition | Carried from r7: `G_F−G_A=2πiD₊`, `G_F−G_R=2πiD₋`, sums `−2Q`; `δ₀` excluded by `hm`. | sound (r7) |
| H5–H6 | §5.16 quartic bounds and continuation | Carried from r7: `b₁=1/8`, `b₂=35/384`; `F(−ζ)=−F(ζ)`, limits `±√(2π)e^(j²/2)`. | sound (r7) |
| H7 | §6.9 extension below scaling degree | Carried from r7: `δ` has scaling degree `n`; uniqueness for `n=0`. | sound (r7) |
| H8–H9 | §7.6 reflection positivity, one-particle density | Carried from r7: the kernel factorises for `x₁,y₁>0`; `‖K_Ef‖²≤‖f‖²/(4m²)`. | sound (r7) |
| H10–H12 | §7.3 zero-mass limits | Carried from r7: `m|x|²/4→0`; Frullani `−log r/(2π)`; `n=3` gives `O(m)`, `n=2` excluded. | sound (r7) |
| S1, S2, S5, S6 | §1.5, §2.13, §4.13, §5.3 | Carried from r7: `x²/8` bound; `det=cosh2θ`; `[Ω,Ω]=1`; theta-graph isometries `4` and `2`. | sound (r7) |
| S8–S10 | §5.10, §5.19, §6.9 | Carried from r7: polarization identity; the Born rate `2πδ|Û|²/(4ωω′)`; `sd(G_F²)=4`. | sound (r7) |
| S13, S15 | §7.5, §9.7 | Carried from r7: `‖T_sf‖²≤‖f‖‖T_(2s)f‖`; `‖Jf‖²=1`, `(σ·Π)²=Π²−(eℏ/c)σ·B`. | sound (r7) |
| F4–F8 | §4.15 Jost/`η`, §9.8–§9.11, §6.23/§6.26, §7.4/§7.7, §10.2 | Carried from r7: `conj(η)η*=(−1)^(k+l)`; `Zα=0.5035`; `π²m⁴κ^(−2)/2`; matchings `1,1,3,15`; `c₀²(1−κ²)^(−1/2)=1`. | sound (r7) |

**Remarks on untouched text (no change requested).**
- Layer 9's `### Dependencies` (line 5405) names only LocalVariationalFieldTheory Layer 3. §9.1's `*Needs:*` line names Layers 3–5, and its new body also cites LVF §4.1. The mismatch predates this head.
- §5.6 still says "the stated complex conjugation involution" (line 1463), but no conjugation is stated in §5.6. The phrase is carried over from the earlier wording.

## Not verifiable

- Weinberg, *The Quantum Theory of Fields I* (`weinberg95`, settled as uncertified): §5.5 for the causal Dirac field (§3.4), cited by locator only. The section number and the `η_00=−1` signature agree with the book's standard numbering, but I did not read the text.
- Osterwalder–Schrader II (`os75`): the cache holds a bot-block page and the DOI is paywalled. The §7 locators are taken as stated (see R11).
- UNSW course notes (`unsw-qft`, waived) and the other uncertified books (Streater–Wightman, Haag, Reed–Simon II, Hörmander I, Bogoliubov–Shirkov, Tong, Strocchi 1967/1970) are cited by locator only. None of their locators changed at this head.

## Source issues

- none
