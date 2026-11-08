# Review of MotivesAndAlgebraicCycles (pull request #1313 at b8e693e)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since 41d21cc (4 insertions, 4 deletions, all in `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md`; `Suggested.lean` and `metadata.toml` untouched; `git diff --stat origin/main...HEAD` outside the folder is empty). The change set is exactly the two repairs the previous review asked for: the EtaleCohomologyFoundations contract (line 63), the finite-field Künneth paragraph of §7.4 (line 1352), the Layer 7 Dependencies sentence (line 1689) and the WeilConjectures paragraph under Downstream consumers (line 1705). Each was read against EtaleCohomologyFoundations and SchemeAndStackFoundations on main (eaf17b1), WeilConjectures at its open head, the §2.7 passage it now leans on, and the Katz–Messing and Milne caches; the gate, the dependency check, the elaboration and the `#check` probe were run again. No finding remains, new or carried.

## Previous findings

- R01 — repaired: line 63 now cites “the finite-dimensional `E`-vector spaces `H^i_c(X_kbar,E)` of §F.4.5 for `X` separated of finite type over `k`, a finite extension `E/ℚ_ℓ` and `ℓ` invertible in `k`, the `E`-linear automorphism induced by geometric Frobenius through `VanishingCycles.frobeniusCohomology`”; line 1352 writes `H^i_ℓ` for `H^i_et(X_kbar,ℚ_ℓ)` of §2.7, “the finite-dimensional `ℚ_ℓ`-vector space of EtaleCohomologyFoundations §F.4.5 … with the geometric Frobenius `F` of §F.10.2b”. The string `compactFrobeniusModule` and the hypothesis `hℓ` no longer occur in the folder (grep: 0 hits); the roadmap grep finds the name only in the EtaleCohomologyFoundations revision head, which this README no longer cites. Every object the two passages now name exists on main: §F.4.5 (`TauCetiRoadmap/EtaleCohomologyFoundations/README.md` lines 1041–1080) proves finite-dimensional `Hⁱ_(c)(X,ℚ_ℓ)` for separated finite-type `X` over a separably closed field with `ℓ` invertible and includes finite `E/ℚ_ℓ` by scalar extension; §F.10.1 (line 907) defines `VanishingCycles.geometricFrobenius` as the inverse of `FiniteField.frobeniusAlgEquivOfAlgebraic`; §F.10.2b (line 1108) states `VanishingCycles.frobeniusCohomology`, `q`-power scheme pullback is geometric cohomological Frobenius, inverse to arithmetic Galois action. The repair introduced no new problem: the base field of §F.4.5 is separably closed, and `kbar` over a finite field is perfect, so the algebraic closure qualifies; “as `X` is proper, compact-support and ordinary cohomology agree” is the `RΓ_(c)` of §F.4.5 specialised to proper `X`, and its `𝔾_m` Check is the non-proper control.
- R02 — repaired: line 1705 now opens “The finite-field Künneth theorem of §7.4 takes the canonical integral factor family as an explicit hypothesis, so that any later roadmap holding such a family can apply the theorem. **WeilConjectures** WC.6.1 constructs …”. WeilConjectures at its open head (1935 lines) still cites neither this roadmap nor Künneth projectors (grep for `MotivesAndAlgebraicCycles`, `Künneth projector`, `standard conjecture`, `C_ℚ`: 0 hits), and its `### 6.1 Integral factors for smooth proper schemes` (line 1271) states exactly the five properties the paragraph lists; the paragraph no longer asserts a consumer relation that roadmap does not make. WeilConjectures is line 116 of the merge order against 72 for this roadmap, so “later roadmap” is correct and the family stays an explicit hypothesis, never a `*Needs:*` edge.

## Verified sound

### Gate, build and elaboration

- The worker's gate at this head: every counter zero, `OK`. Re-run by this review from the worktree with `--base origin/main`: identical, every counter zero (`imports=0`, `residue=0`, `prnum=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`), `OK`.
- `lake env lean TauCetiRoadmap/MotivesAndAlgebraicCycles/Suggested.lean` from the worktree root: exit 0 in 9.3 s, exactly four `declaration uses sorry` warnings (lines 88, 102, 118, 141), nothing else.
- A scratch copy with `#check @name` for all four declarations elaborated once; the four elaborated types are identical to those of the previous review (Jannsen criterion keeps `Field K`, `Preadditive`, `Linear K`, `HasFiniteBiproducts`, `IsIdempotentComplete`, both endomorphism hypotheses and `a.toPreadditive = hadd`; coalgebra reconstruction keeps essential smallness, abelianness, linearity and the exact faithful linear fiber; neutral recognition additionally `MonoidalPreadditive`, `MonoidalLinear`, `SymmetricCategory`, `RigidCategory`, the `End(𝟙)=K` bijectivity and `ω.Braided`; the antipode theorem keeps `CommRing B`, `Bialgebra K B` and rigidity of `TauCeti.FGComoduleCat K B`). The Lean file is byte-identical to the one the previous review read, so the one-tactic padding probe and the missing-headline inventory of the previous reviews stand: the finite-field Künneth theorem is named in the docstring as not statable (no `ℓ`-adic cohomology with Frobenius and no Chow correspondences at Mathlib `6b7abb3` / Tau Ceti `a91d3aa`), and no statable headline is absent.
- The worker's signature scan again reports an unknown identifier `Reconstruction.has` at its line 155: that is its scanner reading the docstring words “structure has” as a declaration; the probe elaborated without error.

### Supplier direction

The dependency check with `--movable` against the board's merge order and the content checkout printed, in full:

```text
depcheck: 240 roadmaps, 2359 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The suppliers the diff names are all on main: EtaleCohomologyFoundations §§F.4.5, F.10.1, F.10.2b (README lines 1041, 907, 1108) and SchemeAndStackFoundations §0.29 (README line 1825; `qPowerFrobenius` of every `k`-scheme as the `a`-fold absolute Frobenius for `q=p^a`, over `k`, lines 1928–1931, Lean names at line 1953). WeilConjectures (merge order 116, this roadmap 72) is named only as the roadmap that constructs the hypothesis of §7.4's theorem and never on a `*Needs:*` line, a supplier table or a “Supplied by” clause; the Layer 7 Dependencies sentence lists only the two main suppliers.

### Cross-roadmap citations resolved

| Citation | Where resolved | Result |
| --- | --- | --- |
| EtaleCohomologyFoundations §F.4.5 (lines 63, 1352, 1689) | main, README lines 1041–1080 | Finite-dimensional `Hⁱ_(c)(X,ℚ_ℓ)` for separated finite-type `X` over separably closed `k` with `ℓ` invertible; finite `E/ℚ_ℓ` by scalar extension with `O_E` lattices; independence of the integral model; `𝔾_m` Check separates compact from ordinary. Matches the contract's wording. |
| EtaleCohomologyFoundations §F.10.1 (line 63) | main, line 907–920 | `VanishingCycles.geometricFrobenius` = inverse of `FiniteField.frobeniusAlgEquivOfAlgebraic`, so an automorphism: the “`F` is invertible” step of §7.4 is supplied. |
| EtaleCohomologyFoundations §F.10.2b (lines 63, 1352) | main, lines 1108–1120 | `VanishingCycles.frobeniusCohomology`: `q`-power scheme pullback is geometric cohomological Frobenius on realized, rationalized cohomology of systems descended over `k`; Checks `q⁻¹` on `ℚ_ℓ(1)`, trace `q` on `H²c(𝔸¹)`. Matches “pullback along `SchemeFrobenius.qPowerFrobenius` acts as `F`”. |
| SchemeAndStackFoundations §0.29 (line 63, 1352, 1689) | main, lines 1825–1953 | `SchemeFrobenius.qPowerFrobenius` defined and proved over `k`. |
| §2.7 of this roadmap (line 1352) | README lines of `### 2.7` | `EtaleRealization k ℓ` with `H^j_et(X_kbar,ℚ_ℓ)` for `ℓ≠char k`; its first Check (geometric Frobenius acts by `q` on `H²(ℙ¹,ℚ_ℓ)`) agrees with the §7.4 `ℙ¹` Check `Π₂=1−qT`. |
| WeilConjectures WC.6.1 (line 1705) | open head, line 1271 | Unique `Π_i∈ℤ[T]`, image `det(1−TF on H^i)` for every `ℓ≠p`, constant coefficient one, degree `dim H^i`, reciprocal roots pure of weight `i`, `Π_i=1` for `i>2d` or empty `X`; no projectivity. The five properties listed here are all stated there. |
| The 13 resolver leads | main READMEs of EtaleCohomologyFoundations and SchemeAndStackFoundations; StandardConjectures | Unchanged since the previous review: StandardConjectures is a downstream consumer named in the Downstream section, and the twelve planned supplier names all occur in those roadmaps' READMEs on main (`frobeniusCohomology`, `geometricFrobenius` at lines 1110 and 914). |

### Source locators of the changed passages

| Passage | Source opened | Result |
| --- | --- | --- |
| §7.4 finite-field Künneth (changed sentence and the route it introduces) | Katz–Messing, cache 9283138c, lines 173–181 (Theorem 2(1), printed p. 76), lines 190–196 (proof, p. 77; page marker at line 185) | Theorem 2(1): for projective smooth absolutely irreducible `X/𝔽_q` the Künneth components of the diagonal are rational algebraic cycles, `ℚ`-combinations of graphs of Frobenius and its iterates. Proof: the `det(T−F|H^i)` are pairwise coprime by the integrality input and Theorem 1; choose `e_i≡δ_ij`; Cayley–Hamilton. The README's route is this proof; it drops “absolutely irreducible” legitimately, since its hypothesis is the factor family with the root condition and the argument never uses connectedness (the `Spec 𝔽_(q²)` and `ℙ¹⊔pt` instances below). |
| §2.7 locator (seeded target, cited by the changed sentence) | Milne, *Lectures on Étale Cohomology*, cache ac4f122f: contents lines 56–61 (§19 p. 123, §21 p. 130, §24 p. 144), page markers at lines 4780 (p. 123), 5001 (p. 130), 5173 (p. 134), 5562 (p. 145); “this completes the proof of Theorem 21.5” at line 5183 (p. 134) | “§§19, 21–24, pp.123–126, 130–145” and “Theorem 21.5 and its proof, pp.132–134; §24, pp.144–145” are the right sections and pages. |

The other seeded targets of this round (0.2, 0.5b, 3.1, 4.1, 4.4, 4.8a, 5.5, 6.1, 6.6, 6.7, 7.6, 7.12, 7.13, 7.18) lie outside the changed passages and keep the verification of the previous full reviews.

### Adversarial values

New rows for every changed statement, then the rows of the previous report for the untouched statements, each marked “r4” (or “r3” where r4 carried it) and unchanged in value. `F` is geometric Frobenius, `q=#k`, `Π_i` the factor family, `P_i` its monic reversal.

| Statement | Instances tried | Computed values on the two sides / excluded alternative | Result; change |
| --- | --- | --- | --- |
| Contract line 63: `H^i_c(X_kbar,E)` finite-dimensional for `X` separated of finite type, `E/ℚ_ℓ` finite, `ℓ` invertible | `X=𝔾_m`, `E=ℚ_ℓ`; `X=ℙ¹`; `E=ℚ_ℓ(√q)` | `𝔾_m`: compact-support groups in degrees 1, 2 (`ℚ_ℓ`, `ℚ_ℓ(−1)`), ordinary in degrees 0, 1, both finite-dimensional, not equal (§F.4.5's own Check), so the contract rightly speaks of `H_c` and §7.4's equality with ordinary cohomology needs properness, which it has; `ℙ¹`: `H⁰_c=H⁰=ℚ_ℓ`, `H¹=0`, `H²_c=H²=ℚ_ℓ(−1)`; `E` by scalar extension: dimensions `1,0,1` unchanged, `F` still acts by `1`, `q` | Retain |
| Contract line 63: the Frobenius on `H^i_c(X_kbar,E)` is an automorphism | `ℙ¹`, `H²`; a nilpotent action (excluded) | `F=q` invertible; §F.10.1 defines `F` as the inverse of an `AlgEquiv` and §F.10.2b makes it inverse to the arithmetic Galois action, so no nilpotent action is admitted | Retain |
| §7.4 `H^i_ℓ=H^i_et(X_kbar,ℚ_ℓ)` of §2.7 with `F` of §F.10.2b, `ℓ≠p` | `ℙ¹/𝔽_q`; `ℓ=p` (excluded) | `Π₀=1−T`, `Π₂=1−qT`, roots `1`, `q⁻¹` of absolute values `q⁰`, `q⁻¹` ✓, agreeing with the §2.7 Check “`F` acts by `q` on `H²(ℙ¹)`”; `ℓ=p` is excluded both here and in §2.7's fourth Check, and §F.4.5 requires `ℓ` invertible, so the generalities agree | Retain |
| §7.4 `deg Π_i=dim H^i_ℓ` and `P_i=T^{deg Π_i}Π_i(T⁻¹)` is the characteristic polynomial | `H`=line with `F=q`; `H=0`; `F` nilpotent (excluded) | `det(1−Tq)=1−qT`, reversal `T−q`=charpoly ✓; `H=0`: `Π=1`, `P=1` ✓; a nilpotent `F` would give `det(1−TF)=1` of degree `0<dim H`, so the degree equality needs `F` invertible, which §F.10.1 supplies and the root clause also forces (no root `0`) | r4; unchanged |
| §7.4 coprimality of `P_i,P_j` for `i≠j` | `ℙ¹`: `P₀=T−1,P₂=T−q`; `E/𝔽_q`: `P₁(1)=q+1−a`, `P₁(q)=q(q+1−a)` | Roots have absolute values `1≠q` (q≥2); `q+1−a≥(√q−1)²>0` by `abs(a)≤2√q`, so `P₁` is prime to `P₀` and `P₂` | r4; unchanged |
| §7.4 CRT polynomials and Cayley–Hamilton | `ℙ¹`: `e₀=(q−T)/(q−1)`, `e₂=(T−1)/(q−1)` | `e₀(1)=1,e₀(q)=0`; `e₂(1)=0,e₂(q)=1`; `e₀+e₂=1` ✓; a degree `i` with `H^i=0` has `P_i=1` and `e_i=0`, so the empty projector is `0` | r4; unchanged |
| §7.4 graph convention | `Γ` = graph of `qPowerFrobenius` in `Corr⁰(X,X)`; `ℙ¹` | §0.2: the graph of `f` acts by pullback `f^*`; §F.10.2b: `φ^*=F`; on `H²(ℙ¹)` pullback by the degree-`q` map is `q` (pushforward would be `1`), matching `T−q`; with `φ_*=F⁻¹` instead, `e_i(F⁻¹)` would not be `δ_ij` | r4; unchanged |
| §7.4 class determined by degreewise actions | `X=ℙ¹`, `H^{2}(X×X)(1)=ℚ_ℓ^{2}` | Künneth: `End(H⁰)⊕End(H²)=ℚ_ℓ²`; a class acting by `(1,0)` is `π₀` and by `(0,1)` is `π₂`; §2.3 states the “zero iff all degreewise actions zero” theorem used | r4; unchanged |
| §7.4 uniqueness of `Π` | `Π,Π'` with equal images at one `ℓ` | `ℤ[T]→ℚ_ℓ[T]` injective, so `Π_i=Π'_i` | r4; unchanged |
| §7.4 `Spec 𝔽_(q²)` Check | `d=0`, `H⁰=ℚ_ℓ²`, `F` swaps | `det(1−TF)=1−T²`, roots `±1`, `abs=1=q⁰` ✓; `e₀≡1 mod (T²−1)`, `e₀=1`, `e₀(Γ)=Δ` ✓ | r4; unchanged |
| §7.4 `ℙ¹` negative control | `Π₂:=T−q` | image `T−q≠1−qT`; root `q`, `abs(q)=q≠q⁻¹` ✓ both clauses fail | r4; unchanged |
| §7.4 empty `X` and disconnected `X` | `X=∅`; `X=ℙ¹⊔pt` | `∅`: all `Π_i=1`, every `e_i=0`, trivially `C`; `ℙ¹⊔pt`: `P₀=(T−1)²`, `P₂=T−q`, coprime; `e₀` acts as `1` on `H⁰=ℚ_ℓ²` | r4; unchanged, no connectedness needed |
| Layer 7 Dependencies sentence (line 1689) | the three cited sections; WeilConjectures (excluded) | §F.4.5, §§F.10.1–F.10.2b, §0.29 exist on main at the lines above; the factor family is a hypothesis of the theorem, so no edge to WeilConjectures (order 116 > 72) | Retain |
| Downstream paragraph (line 1705): properties of `Π` and “any later roadmap holding such a family” | WeilConjectures §6.1 at its head; `ℙ¹` | constant coefficient one (`det(1−0·F)=1`), `Π_i=1` for `i>2d`, roots `q^{-i/2}`, uniqueness: all five stated at its line 1271; `ℙ¹`: `Π=(1−T,1,1−qT)` satisfies every clause; WeilConjectures is later in the order, so the sentence claims nothing of it beyond §6.1 | Retain; R02 closed |
| 4.15 locator | FV Thm 5.13 / Cor 5.14 | abstract blow-up triangle and its long exact sequence, pp. 28–29 | r4; unchanged |
| Lean docstring sentence | pins | no `ℓ`-adic cohomology carrier, no Chow correspondences at the pins | r4; unchanged |
| Conventions: `CH_j(X)_R=CH_j(X)⊗ℤR` | `R=𝔽₂`, `R=0` | `H_0(C⊗ᴸR)=H_0(C)⊗R`; `0=0` | r3; unchanged |
| 0.5b Check: degree-zero divisor action | `ℙ¹_ℂ`; genus-one, nontorsion `P` | `0` in `CH¹(ℙ¹)`; `[P]−[O]≠0` yet algebraically trivial | r3; unchanged |
| 0.6 Check: componentwise degree zero | `ℙ¹⊔ℙ¹`, `(1,−1)` | not algebraically trivial; `(0,0)` acts by 0 | r3; unchanged |
| 2.8 Check: zero degree-two class | `ℙ¹⊔ℙ¹`; `E` | `cl=(1,−1)≠0`; `cl=0`, Chow class `≠0` | r3; unchanged |
| 3.6 Tannakian over `F'/F` | `Vec_F`; odd super line | neutral; fails in char ≠2; footnote 12 | r3; unchanged |
| 4.11 cyclic condition | odd line; `T=𝟙` | `(−1)²=+1`; `1` | r3; unchanged |
| 4.15 `E_0(pt;R)` | `R=ℤ,𝔽₂,0` | `R[0]`; `ℤ,𝔽₂,0` | r3; unchanged |
| 4.15 `A_{r,0}(pt,X;R)=CH_r(X)⊗R` | `X=pt`; `𝔸¹`, `r=0` | right exactness; `0=0` | r3; unchanged |
| 4.15 point sections of cdh complex | `Y=pt` | identity refines every cover | r3; unchanged |
| 4.15 derived reduction Check | `ℤ→2→ℤ`, `⊗ᴸ𝔽₂` | `H₁=H₀=𝔽₂` vs `0,ℤ/2` | r3; unchanged |
| 4.15 coefficient change | `ℤ→𝔽₂→0` | associativity; `3↦1↦0` | r3; unchanged |
| 4.15 affine identification | affine equidimensional | FV 4.2(2) ⊗ᴸR | r3; unchanged |
| 4.16 Check `A_{0,0}(U,X;R)` | `U` smooth projective, `X=pt` | `R^{π₀(U)}` | r3; unchanged |
| 4.17 `Mᶜ(X)=E_0(X;R)` | pt; `𝔸¹` | `R`; `R(1)[2]` | r3; unchanged |
| 4.18 representability with `R` | pt, `𝔽₂`, `0` | `𝔽₂=𝔽₂`, `0=0` | r3; unchanged |
| 4.18 internal Hom | `ℤ(r)[2r]` compact | `RHom⊗ᴸR` | r3; unchanged |
| 4.18 `Hom(M(X),M(Y)[i])` | `i=0,1`; `ℤ/4` | `0` for `i=1`; `CH⊗R` | r3; unchanged |
| 4.18 Check `CH^b(X)⊗R` | `ℙ¹`, `b=1`, `𝔽₂` | `𝔽₂` | r3; unchanged |
| 4.18 point Check | pt; `𝔸¹` | `R`; `R` | r3; unchanged |
| 5.7 base-field adapter | `𝔾_m/ℚ` | `dz/z⊗1↦dz/z` | r3; unchanged |
| 5.7 Check `𝔾_m`, `𝔸¹` | trivial connection | `H⁰=H¹=ℂ`; `2πi`; `0` | r3; unchanged |
| Supplier contract line 58 | trivial connection | residue 0 | r3; unchanged |
| 0.1 correspondence grading | pt; ℙ¹; empty | `ℚ`; degree 0; `0` | r3; unchanged |
| 0.1 composition | `E₂₁,E₁₂` | `E₁₁≠E₂₂` | r3; unchanged |
| 0.2 graph/transpose | pt→ℙ¹ | `Corr⁰(ℙ¹,pt)`; `Corr⁻¹(pt,ℙ¹)` | r3; unchanged |
| 0.2 external product | 2,3 | 6 | r3; unchanged |
| 0.3 projectors | pointed genus-one curve | ranks (1,2,1) | r3; unchanged |
| 0.4 algebraic equivalence | `(1,−1)` | not trivial | r3; unchanged |
| 0.5 numerical testing | `ℙ¹×ℙ¹` | `(u−v)(u+v)=0`; `(u−v)u=−1` | r3; unchanged |
| 0.5 normalization | pt; total relation | `deg 1=1`; `1=0` excluded | r3; unchanged |
| 0.5a supports/purity | empty; `(𝔸¹,{0})` | `0`; degree 2 twist 1 | r3; unchanged |
| 0.5b residue convention | `t,u,t³u` | 3,0; composite 0 | r3; unchanged |
| 0.5c inseparable multiplicity | `𝔽_p(t)`, `t^{1/p}` | degree `p` | r3; unchanged |
| 0.6 universal support | `ℙⁿ`; curve | dim 0; dim 1 | r3; unchanged |
| 0.6 coniveau range | `d=3,s=2` | `p=0` only | r3; unchanged |
| 0.6 real restriction | two real components | `(1,1)` | r3; unchanged |
| 0.7 indices | anisotropic conic; ℙ¹; ∅ | 2 vs `χ=1`; 1; 0 | r3; unchanged |
| 0.8 torsion cycle | order-two `τ` | `τ⊗ℚ=0`; parity 1 | r3; unchanged |
| 1.1 twisted Hom | unit twists; zero projector | `ℚ` iff `m=n`; zero object | r3; unchanged |
| 1.2 Tate/additivity | `𝟙(1)⊗L`; empty sum | `𝟙`; `0` | r3; unchanged |
| 1.3 duality | `𝟙(m)`; ℙ¹ | `−m`; `h(ℙ¹)(1)` | r3; unchanged |
| 1.4 Chow/identity principle | `L`; unit | `ℚ,0`; `ℚ` | r3; unchanged |
| 1.5 universal extension | `F(L)=U` | `U⁻¹`; `𝟙` | r3; unchanged |
| 1.6 projective formula | ℙ²; ranks 0,1 | `h₁²+h₁h₂+h₂²`; `0`; `h(X)` | r3; unchanged |
| 1.7 adequate quotients | numerical pt; total | `ℚ` vs `0` | r3; unchanged |
| 2.1 Koszul symmetry | degree 1,2 lines | `−1` vs `+1` | r3; unchanged |
| 2.2 Weil dimensions/trace | ℙ¹; `E`; two ℙ¹ | 2,0,4 | r3; unchanged |
| 2.3 Tate rescaling | `λ=2` | `×1/2`, `×2` | r3; unchanged |
| 2.3 homological ⇒ numerical | class zero | pairing 0 | r3; unchanged |
| 2.4 Chern normalization | codim-two point | `c₂=−[pt]` | r3; unchanged |
| 2.5 normalized comparison | ℙ¹ point | `2πi`; trace 1 | r3; unchanged |
| 2.6 field trace | `ℚ(i)/ℚ` | 2 both sides | r3; unchanged |
| 2.6 de Rham Chern sign | `O(1)` on ℙ¹ | `−2πi`; `+2πi` | r3; unchanged |
| 2.7 Frobenius | ℙ¹/𝔽_q | `q`; `1/q`; `1` | r3; unchanged, now also the witness of the §7.4 identification above |
| 2.7 prime restriction | `ℓ=char k` | rank 0 | r3; excluded by hypothesis |
| 2.8 finite-map formula | component inclusion; degree 2 | `diag(1,0)`; `2id` | r3; unchanged |
| 3.1 trace radical | genus-two curve | `−2`; dim 6 | r3; unchanged |
| 3.1 characteristic-zero need | `id` on `𝔽_p^p` | traces 0, not nilpotent | r3; unchanged |
| 3.2 Jannsen criterion headline | dims 0,1,2 | `0,K,M₂(K)` | r3; unchanged |
| 3.2 radical control | `K[ε]/ε²` | radical `≠0` | r3; unchanged |
| 3.3 numerical semisimplicity | pt; zero | `ℚ`,`0` | r3; unchanged |
| 3.4 lifting | upper triangular | `e,f` idempotent | r3; unchanged |
| 3.5 signed symmetry | genus-two; odd line | `−2,−1` vs `6,1` | r3; unchanged |
| 4.1 finite correspondences | `𝔸¹→pt` and transpose | finite; dim-one fibre | r3; unchanged |
| 4.1 inseparable graph | Frobenius of `𝔸¹` | `p·id` | r3; unchanged |
| 4.2 transfer tensor | `2id` | 2; 4 | r3; unchanged |
| 4.2 disjoint sums | two points squared; ∅ | 4; 0 | r3; unchanged |
| 4.3 Nisnevich condition | `Spec ℂ→Spec ℝ`; id | no lift; lift | r3; unchanged |
| 4.3 cohomological obstruction | `𝔾_m` on ℙ¹, 𝔸¹ | `ℤ` vs `0` | r3; unchanged |
| 4.4 Suslin differential | constant simplicial group | `0,id,0,…` | r3; unchanged |
| 4.4 Tate/weight one | `𝔾_m`; pt | `R(1)`; `k^×` | r3; unchanged |
| 4.5 homotopy tests | `𝔾_a` vs `𝔾_m` | not onto; iso | r3; unchanged |
| 4.5 contraction | `𝔾_m` | `ℤ` then `0` | r3; unchanged |
| 4.5 finite-field descent | degrees 2,3 | `−2+3=1` | r3; unchanged |
| 4.6 derived tensor | `ℤ/2⊗ᴸℤ/2` | `H⁻¹=H⁰=ℤ/2` | r3; unchanged |
| 4.6 boundedness | `⊕R[−n]` | unbounded | r3; unchanged |
| 4.7 higher cycles | pt | `ℤ`; `0` | r3; unchanged |
| 4.8 localization/homotopy | `𝔸¹` | `CH₀=0,CH₁=ℤ` | r3; unchanged |
| 4.8a specializations | length-`p` fibre | `p` vs 1 | r3; unchanged |
| 4.8b smooth-pair coordinates | `(𝔸²,𝔸¹)`; codim 0 | ranks 1, 0 | r3; unchanged |
| 4.9 cancellation function | `n=1`; `n=0` | degree 1; denominator 0 | r3; unchanged |
| 4.9 cancellation headline | unit, Tate | `R=R`; `0=0` | r3; unchanged |
| 4.10 complex comparison | `K=F[1]` | `F` vs `0` | r3; unchanged |
| 4.10 cdh topology | thickening; empty-centre blowup | same reduced data; identity | r3; unchanged |
| 4.11 geometric compactness | unit; infinite sum | compact; not | r3; unchanged |
| 4.11 tensor inversion | `ℕ`; `ℚ` | `ℤ`; `ℤ/p⊗ℚ=0` | r3; unchanged |
| 4.12 projective bundles | `ℙ⁰,ℙ¹,ℙ²`; rank 0 | 1,2,3; 0 | r3; unchanged |
| 4.12 Mayer–Vietoris sign | trivial cover | `0` vs `2i` | r3; unchanged |
| 4.13 blowup splitting | divisor; point on surface | 0; 1 | r3; unchanged |
| 4.13 Gysin boundary | `(𝔸¹,{0})` | `+1` | r3; unchanged |
| 4.14 relative cycles | `st=1` | fibre at 0 empty | r3; unchanged |
| 4.16 cycle duality | pt; ℙ¹ | shifts 0, +1 | r3; unchanged |
| 4.16 Gysin sequence | `c=1` | `r+1`; `i−1` | r3; unchanged |
| 4.17 compact support headline | pt; 𝔸¹; ∅ | `R, R(1)[2], 0` | r3; unchanged |
| 4.17 higher-Chow headline | `H^{2,1}(ℙ¹)`; `a>2b` | `R`; `0` | r3; unchanged |
| 4.18 Chow embedding headline | `L`; `𝟙(1)` | `R(1)[2]`; `R(−1)[−2]` | r3; unchanged |
| 4.18 projective Hom | `ℙ¹×ℙ¹`, `ℤ/2` | `(ℤ/2)²`; `0` | r3; unchanged |
| 4.19 compact duality headline | 𝔸¹; pt | `R`; `R` | r3; unchanged |
| 4.19 Tate extension | `Hom(R,R(1)[1])` | `k^×⊗R` | r3; unchanged |
| 4.20 motivic measure headline | ℙ¹; 𝔾_m | `L+1`; `L−1`; `−[M]` | r3; unchanged |
| 5.1 endomorphism coalgebra | `K²`; two vertices | `M₂(K),K`; `K²` | r3; unchanged |
| 5.2 reconstruction headline | `Vec_K`; `K[ε]/ε²` | `K`; dim 2 | r3; unchanged |
| 5.3 pair motives | `(X,X)`; `(𝔾_m,{1})` | `0`; `ℚ(−1)` | r3; unchanged |
| 5.4 cellular filtration | `(𝔸¹,{0,1})` | rank 1 | r3; unchanged |
| 5.5 total complex | two degree-one differentials | `±1` | r3; unchanged |
| 5.6 tensor symmetry | two degree-one classes | `+1` | r3; unchanged |
| 5.6 canonical localization | `ℚ[t]→ℚ` | kernel `(t−1)` | r3; unchanged |
| 5.7 generators/rigidity | two-point support; `ℤ/2` | two Tate summands; `0` | r3; unchanged |
| 5.8 correspondence action | `rΔ` | `0,−id,2id` | r3; unchanged |
| 5.8 equivariance | `S₃`; char 2 | `1/6` unavailable | r3; unchanged |
| 5.9 Nori realization headline | pt; `R(1)[2]` | `ℚ_N[0]`; `L_N[−2]` | r3; unchanged |
| 5.9 choice independence | `(𝔸¹,{0,1})` | rank 1 persists | r3; unchanged |
| 6.1 finite reconstruction | `𝔾_m` weight 1 | weight 2 outside hull | r3; unchanged |
| 6.2 neutral reconstruction headline | `Rep(𝔾_m)`; `Rep(μ_p)` | `K[t,t⁻¹]`; `K[t]/(t^p−1)` | r3; unchanged |
| 6.2 antipode headline | group-like `t` | `S(t)t=1` | r3; unchanged |
| 6.2 antipode degenerate | `1`; primitive `x` | `1`; `−x` | r3; unchanged |
| 6.3 finite type vs finite | `𝔾_m`; trivial | infinite-dim; `K` | r3; unchanged |
| 6.3 functor of points | `μ₂`, char 2, `K[ε]` | `(1+ε)²=1` | r3; unchanged |
| 6.4 coequalizer | `E₁₂,E₂₁` | `E₁₁≠E₂₂` | r3; unchanged |
| 6.4 finite pieces | weights in `S` | `#S` | r3; unchanged |
| 6.5 heap | 5,2,3 | 6; `h(x,y,y)=x` | r3; unchanged |
| 6.5 nonabelian heap | `S₃` | `(132)` vs `id` | r3; unchanged |
| 6.5 unpointed torsor | `t²=−1/ℝ` | no point; `±i` | r3; unchanged |
| 6.6 integral coefficients | `2(y−x)=0` | `ℤ⊕ℤ/2` | r3; unchanged |
| 6.6 matrix coefficients | entry (1,2) | 1 vs 0 | r3; unchanged |
| 6.7 formal periods | `1;ℓ` | `1; 2πi; (2πi)⁻¹` | r3; unchanged |
| 6.8 actions/extension | `b,d` unipotent | `bd≠db` | r3; unchanged |
| 6.9 torsor headline | `Φ=I` | `I`; `bΦd≠db` | r3; unchanged |
| 6.9 Tate coactions | `t` | `u⊗t, t⊗v` | r3; unchanged |
| 6.10 Artin case | quadratic; `S₃` | 2, 6; not 36 | r3; unchanged |
| 6.10 pure Tate | `1⊕L` | `ℚ×ℚ`; `+1` | r3; unchanged |
| 7.1 Hodge inverse image | `tate 0, tate(−1)` | `ℚ`; full inverse image | r3; unchanged |
| 7.2 Tate target | `pt⊔pt` | `ℚ_ℓ²`; `(1,0)` | r3; unchanged |
| 7.2 strong Tate | unipotent Frobenius | fixed dim 1, no complement | r3; unchanged |
| 7.2 rational injection | finite field vs ℂ | `0` vs nontorsion | r3; unchanged |
| 7.3 Lefschetz inverse | `deg η=a` | `a[pt]`; `1/a` | r3; unchanged |
| 7.3 primitive positivity | `u−v` | `−2`; `+2` | r3; unchanged |
| 7.3 compared realization | `h↦2h` | trace `1→2` | r3; unchanged |
| 7.4 Frobenius projectors (old Check) | `ℙ¹/𝔽₂` | `1,0` and `0,1` | r3; unchanged, derived from `Π` above |
| 7.4 norm coefficient | `n=3` | 48 vs 216 | r3; unchanged |
| 7.5 filtration headline | curve; ℙⁿ | `F¹=Pic⁰⊗ℚ`, `F²=0` | r3; unchanged |
| 7.5 projector descent | `ℚ→ℚ²` | `(1,0)` not in image | r3; unchanged |
| 7.6 motivic t-structure | `M(ℙ¹)` | degree `−2` | r3; unchanged |
| 7.6a equivariant groups | `C₂` | `ℤ,ℤ/2`; `0,ℤ/2` | r3; unchanged |
| 7.6b real/complex purity | codim 1 | shifts 1, 2 | r3; unchanged |
| 7.7 admissibility | real point; pair | 1, 2 | r3; unchanged |
| 7.7 zero/out-of-range | ∅; codim > dim | 0 | r3; unchanged |
| 7.8 blowup indices | `c=1,2,3` | 0,1,2 | r3; unchanged |
| 7.8 excluded zero centre | pt along itself | `ℤ→0` | r3; correctly excluded |
| 7.8 projective space | ℙ² | `1,h,h²,0` | r3; unchanged |
| 7.9 genus/one-cycles | anisotropic conic | 0; 1 | r3; unchanged |
| 7.9 norm parity | nonreal point | 2 vs 1 | r3; unchanged |
| 7.10 dimension restriction | real genus-one curve | odd | r3; unchanged |
| 7.11 quaternionic action | `T` | `T²=−1` | r3; unchanged |
| 7.11 invariant-line obstruction | `Tv=av` | `abs(a)²≠−1` | r3; unchanged |
| 7.11 Euler example | `B×ℙ¹` | `χ(O)=0` | r3; unchanged |
| 7.12 coefficient boundary | Bockstein on `BC₂` | iso | r3; unchanged |
| 7.13 torsion calculation | `ℤ⊕ℤ/2⊕(ℝ/ℤ)³⁰` | `ℤ/2⊕(ℚ/ℤ)³⁰` | r3; unchanged |
| 7.14 cycle questions | line in ℙ³; conic | present; absent | r3; unchanged |
| 7.15 compatible classes | unit; twist; Artin | `ℚ;0;0` | r3; unchanged |
| 7.16 rank predicate | rank 0 | dim 0; `s=1` | r3; unchanged |
| 7.17 rational vs complex positivity | `u−√2v` | positive on `ℚ²`; isotropic | r3; unchanged |
| 7.17 primitive exponent | `d=3,p=2`; `d=2,p=1` | `m=0`; `m=1` | r3; unchanged |
| 7.17 height normalization | degrees 1,2,3 | `1,2,6`; `1` | r3; unchanged |
| 7.18 rank specialization | `n=2` | dim 1; 1 vs 3 | r3; unchanged |
| 7.19 archimedean factor | `r=1`, degree 2 | `−π/4`; `>0` | r3; unchanged |
| 7.19 local/cardinality premise | `q=3` | `4≠0` | r3; unchanged |
| 7.19 nonvanishing conclusion | dim 2 | nonzero yes, dim 1 no | r3; unchanged |

### Pinned declarations and ownership

The pins are unchanged (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) and the Lean file is unchanged, so the fourteen declarations the previous reviews opened are cited by the same four statements and still resolve (probe above). For the changed passages the objects are the finite-dimensional `ℓ`-adic cohomology with its Frobenius automorphism, the `q`-power scheme Frobenius, the Künneth projectors and the integral Frobenius factors. By object: nothing at the pins (grep of the pinned sources for `geometricFrobenius`, `qPowerFrobenius`, `charpolyRev` finds only `FiniteField.frobeniusAlgEquivOfAlgebraic`, `TauCeti.FiniteField.geometricFrobeniusBialgHom` and `Matrix.charpolyRev`, no cohomology action); on main, EtaleCohomologyFoundations §§F.4.5, F.10.1–F.10.2b and SchemeAndStackFoundations §0.29 own the cohomology and Frobenius objects and are now cited, not rebuilt; at the open heads through the roadmap grep, `compactFrobeniusModule` occurs only in the EtaleCohomologyFoundations revision (lines 1582, 1584, 1595), which this README no longer cites, the factor family only in WeilConjectures §6.1 (cited as the source of a hypothesis), and the Chinese-remainder construction of Künneth projectors from the Frobenius graph only in this roadmap (its §7.4, owned here by the Scope section's assignment of §§7.3–7.4). `scratch/overlaps.md` lists no open pull request changing this roadmap, no dropped id in either direction and no id only a revision defines; the five closest roadmaps by vocabulary (MotivicEtaleKTheory, SchemeKTheoryOperations, EtaleDualityAndPerverseSheaves, KTheoryFiniteLocalFields, LefschetzStructures) are unchanged since the previous review, which found no shared owner. Ownership against open pull requests other than those the brief lists by path, or readable through the roadmap tool, was not checked further.

### Shape

The contract paragraph sits under the supplier heading and now names only sections and declarations that exist on main; §7.4 keeps its locators and ten Checks; the Layer 7 Dependencies paragraph names three main suppliers by section; the Downstream paragraph describes what §7.4 offers and what WeilConjectures §6.1 states. The declaration name written without backticks in the previous head is gone. No process words, pull-request numbers, LaTeX delimiters or local paths were added (gate counters zero).

## Not verifiable

- **KunnemannPicard** (§7.17): unchanged and outside the changed passages, still the publisher verification page only.

## Source issues

- none
