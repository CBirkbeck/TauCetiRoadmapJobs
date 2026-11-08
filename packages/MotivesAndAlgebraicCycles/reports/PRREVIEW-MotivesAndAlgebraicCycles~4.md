# Review of MotivesAndAlgebraicCycles (pull request #1313 at 41d21cc)

**Verdict:** needs changes

Incremental re-review of the 28 lines changed since 04e21d3 (21 insertions, 7 deletions, both files of `TauCetiRoadmap/MotivesAndAlgebraicCycles/`; `git diff --stat origin/main...HEAD` outside the folder is empty, the long file list in the change set is the merge of main into the branch). The single finding of the previous review is repaired. The changed passages (the new EtaleCohomologyFoundations contract, the §4.15 locator, the rewritten finite-field Künneth paragraph of §7.4 with its three new Checks, the Layer 7 dependency sentence, the WeilConjectures consumer paragraph, and the Lean header and docstring) were read against main, the open heads and the sources; the gate, the dependency check and the elaboration were run again. Two findings, one of them blocking.

## R01 (P2) — `compactFrobeniusModule` does not exist in EtaleCohomologyFoundations on main

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:63` (“the compact-support Frobenius modules compactFrobeniusModule f E hℓ i, for `f : X ⟶ Spec k` separated of finite type, a finite extension `E/ℚ_ℓ` and the explicit hypothesis `hℓ : (ℓ : k) ≠ 0`”) and `README.md:1352` (“write `H^i_ℓ` for compactFrobeniusModule f ℚ_ℓ hℓ i of EtaleCohomologyFoundations §F.10.2b”).

**Claim:** Both passages cite a supplier declaration, with its argument list, that EtaleCohomologyFoundations §F.10.2b does not make. EtaleCohomologyFoundations is a roadmap on main, so it is cited as it is on main; its §F.10.2b there (`TauCetiRoadmap/EtaleCohomologyFoundations/README.md` lines 1108–1120) states only `VanishingCycles.frobeniusCohomology` with its four Checks, and the string `compactFrobeniusModule` occurs nowhere on main (README, Lean or metadata of any roadmap) nor in the pinned Mathlib and Tau Ceti. It occurs only in the open draft pull request that revises EtaleCohomologyFoundations (its README line 1582: “Compact-support Frobenius modules — compactFrobeniusModule. For `f : X ⟶ Spec k` separated of finite type …”, with exactly the `f E hℓ i` argument list and the `(hℓ : (ℓ : k) ≠ 0)` hypothesis copied here); a pull request that revises an existing roadmap is never a dependency. The name is written without backticks in both places, so neither the gate's identifier check nor the citation resolver sees it.

**Witness:** `grep -rn compactFrobeniusModule` over the content checkout at main (eaf17b1): no hit; over the pinned libraries: no hit; the roadmap grep: hits only in this README (lines 63, 1352) and in the EtaleCohomologyFoundations revision head (lines 1582, 1584, 1595).

**Why P2 and not a gap:** the mathematics §7.4 uses is on main under other names. §F.4.5 (lines 1041–1080) gives, for separated finite-type `X` over a separably closed field with `ℓ` invertible, finite-dimensional `H^i_(c)(X,ℚ_ℓ)` and finite `E/ℚ_ℓ` by scalar extension; §F.10.2b gives the geometric-Frobenius action through `VanishingCycles.frobeniusCohomology` (q-power scheme pullback is geometric Frobenius after normalized realization and rationalization). For smooth projective `X` this is everything the Künneth theorem needs. The defect is a supplier cited for a bundled declaration it does not state.

**Repair:** At line 63 replace the clause from “and the compact-support Frobenius modules” to “`hℓ : (ℓ : k) ≠ 0`” by: “and, on the finite-dimensional `E`-vector spaces `H^i_c(X_k̄,E)` of §F.4.5 for `X` separated of finite type over `k` and a finite extension `E/ℚ_ℓ` with `ℓ` invertible in `k`, the `E`-linear automorphism induced by geometric Frobenius through `VanishingCycles.frobeniusCohomology`”. At line 1352 replace “write `H^i_ℓ` for compactFrobeniusModule f ℚ_ℓ hℓ i of EtaleCohomologyFoundations §F.10.2b; as `X` is proper this is `H^i(X_kbar,ℚ_ℓ)` of §2.7 with geometric Frobenius `F`” by “write `H^i_ℓ` for `H^i(X_kbar,ℚ_ℓ)` of §2.7, the finite-dimensional space of EtaleCohomologyFoundations §F.4.5 with the geometric Frobenius `F` of §F.10.2b”. Line 1689 (sections only) needs no change. If the bundled module with its characteristic-polynomial API is wanted as a named supplier object, the alternative is to declare it: `What EtaleCohomologyFoundations must provide (gap:compact-frobenius-module): …` under the supplier's contract subsection with the same slug in `plan.json`; a revision pull request cannot be cited in its place.

## R02 (P3) — WeilConjectures does not consume §7.4 at its open head

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1705`: “**WeilConjectures** consumes §7.4's finite-field Künneth theorem. Its WC.6.1 constructs … These satisfy the theorem's hypothesis, and applying the theorem to them gives `C_ℚ` …”.

**Claim:** The paragraph asserts a consumer relation that the cited roadmap does not state. WeilConjectures (open head, read through the roadmap tool; 1935 lines) nowhere mentions MotivesAndAlgebraicCycles, Künneth projectors or a standard conjecture; its §6.1 (“Integral factors for smooth proper schemes”) constructs the factor family exactly as described here, with purity imported from DeligneWeightsAndPurity §7.15, and stops there. A reader following the consumer link finds no consumer.

**Witness:** grep of that README for `MotivesAndAlgebraicCycles`, `Künneth projector`, `standard conjecture`, `C_ℚ`: zero hits; `### 6.1 Integral factors for smooth proper schemes` at its line 1271 states unique `Π_i∈ℤ[T]`, image `det(1 − TF on H^i)` for every `ℓ≠p`, constant coefficient one, reciprocal roots pure of weight `i`, `Π_i=1` for `i>2d` or empty `X`, no projectivity or geometric connectedness.

**Repair:** Replace the first sentence by a statement of what §7.4 offers rather than of what WeilConjectures does: “The finite-field Künneth theorem of §7.4 takes the canonical integral factor family as a hypothesis so that any later roadmap holding it can apply the theorem. WeilConjectures §6.1 constructs, for every smooth proper scheme over a finite field, …”. The rest of the paragraph (the properties of the family and the resulting `C_ℚ` statement) is correct as written; “consumes” returns when that roadmap cites §7.4.

## Previous findings

- R01 — repaired: §4.15 now reads “(Friedlander–Voevodsky, Theorems 5.5 and 5.11, Theorem 5.13 and Corollary 5.14, pp.23–29.)”; cache c5edd971 line 951 is Theorem 5.13 and line 963 Corollary 5.14, both on printed p. 29 (page marker at line 970).

## Verified sound

### Gate, build and elaboration

- The worker's gate at this head: every counter zero (`imports=0`, `residue=0`, `depcheck=0`, `outside-folder=0`, `build=0`), result `OK`.
- `lake env lean TauCetiRoadmap/MotivesAndAlgebraicCycles/Suggested.lean` from the worktree root: exit 0 in 14.7 s, exactly four `declaration uses sorry` warnings (lines 88, 102, 118, 141) and nothing else.
- A scratch copy with `#check @name` for all four declarations elaborated once; the four elaborated types are identical to those of the previous review (Jannsen keeps `Field K`, `Preadditive`, `Linear K`, `HasFiniteBiproducts`, `IsIdempotentComplete`, both endomorphism hypotheses and `a.toPreadditive = hadd`; coalgebra reconstruction keeps essential smallness, abelianness, linearity and the exact faithful linear fiber; neutral recognition additionally `MonoidalPreadditive`, `MonoidalLinear`, `SymmetricCategory`, `RigidCategory`, the `End(𝟙)=K` bijectivity and `ω.Braided`; the antipode theorem keeps `CommRing B`, `Bialgebra K B` and rigidity of `TauCeti.FGComoduleCat K B`). The Lean diff since 04e21d3 is the header (`module`, `public import`, `@[expose] public section`) and three docstring lines; no declaration was added, removed or restated, so the one-tactic padding probe and the missing-headline inventory of the previous reviews stand.
- The module-system header is the form eight roadmaps on main already use (FlagVarieties, PrimitivePrimeDivisors, MorseNovikov, CoboundaryExpansion, AffineMorseLefschetz, PDE, TypeAHeckeAlgebras, PseudoholomorphicCurveAnalysis); the imports are still `Mathlib` and two existing `TauCeti.*` modules, and the gate's import check passes.
- The worker's signature scan reports an “unknown identifier `Reconstruction.has`” at its line 155: that is its scanner reading the docstring words “structure has” as a declaration; the probe above elaborated without error.
- The new docstring sentence is correct at the pins: no `ℓ`-adic cohomology with Frobenius and no Chow correspondences exist in Mathlib `6b7abb3` or Tau Ceti `a91d3aa` (grep for `geometricFrobenius` in the pinned Tau Ceti finds only the bialgebra-level `TauCeti.FiniteField.geometricFrobeniusBialgHom`, not a cohomology action), so the finite-field Künneth theorem is rightly named as not statable.

### Supplier direction

The dependency check with `--movable` against the board's merge order and the content checkout printed, in full:

```text
depcheck: 240 roadmaps, 2353 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The suppliers the diff adds are both on main: EtaleCohomologyFoundations (§§F.10.1, F.10.2b; headings at its README lines 907 and 1108) and SchemeAndStackFoundations (§0.29 at its README line 1825, `qPowerFrobenius` of every `k`-scheme as the `a`-fold absolute Frobenius for `q=p^a`, proved to be over `k`, at lines 1927–1931 and its Lean list at line 1953). WeilConjectures is later in the merge order (line 116 against 72) and is mentioned only as the source of a hypothesis and as a consumer, never on a *Needs:* line; the factor family is an explicit hypothesis of the §7.4 theorem, so no upward edge exists (R02 concerns only the wording).

### Cross-roadmap citations resolved

- EtaleCohomologyFoundations §F.10.1 on main: `VanishingCycles.geometricFrobenius` defined as the inverse of `FiniteField.frobeniusAlgEquivOfAlgebraic` (README line 914; `Suggested.lean` line 383); the contract's description matches.
- EtaleCohomologyFoundations §F.10.2b on main: `VanishingCycles.frobeniusCohomology`, q-power scheme pullback is geometric cohomological Frobenius after normalized realization and rationalization, inverse to arithmetic Galois action (README lines 1110–1113); the contract's “pullback along `SchemeFrobenius.qPowerFrobenius` is geometric Frobenius on rational cohomology” matches. `compactFrobeniusModule`: absent (R01).
- WeilConjectures §6.1 at its open head: the five properties the Downstream paragraph lists (constant coefficient one, image `det(1−TF|H^i)` for every `ℓ≠p`, roots of absolute value `q^{-i/2}` in every complex embedding, `Π_i=1` above twice the dimension, uniqueness) are all stated there; the consumer claim is not (R02).
- The 13 resolver leads: StandardConjectures as a downstream consumer and twelve planned EtaleCohomologyFoundations / SchemeAndStackFoundations names, all of which occur in those roadmaps' READMEs on main; the two new ones (`VanishingCycles.frobeniusCohomology`, `VanishingCycles.geometricFrobenius`) resolve as above.

### Source locators of the changed passages

| Passage | Source opened | Result |
| --- | --- | --- |
| §4.15 localization locator (seeded target) | Friedlander–Voevodsky, cache c5edd971 lines 786 (Thm 5.5, p.23), 908 (Thm 5.11, p.27), 951 (Thm 5.13, p.28), 963 (Cor. 5.14, p.29) | The repaired locator names the right statements; resolution hypothesis present in each. |
| §7.4 finite-field Künneth | Katz–Messing, cache 9283138c (author-page copy, OCR), line 173 (Theorem 2(1), printed p. 76), lines 190–196 (proof, p. 77) | Theorem 2(1): for `X` projective smooth absolutely irreducible over `𝔽_q`, the Künneth components of the diagonal are rational algebraic cycles, `ℚ`-combinations of graphs of Frobenius and its iterates, independent of the theory. Proof: by the integrality/independence input and Theorem 1 the `det(T−F|H^i)` are pairwise coprime; choose `e_i≡δ_ij`; Cayley–Hamilton. The README's route is this proof. The README drops “absolutely irreducible”: legitimate, since its hypothesis (the factor family with the root condition) is stated for all smooth projective `X` and the argument never uses connectedness; the `Spec 𝔽_(q²)` Check exercises the disconnected case. |
| §7.4 locator pages | same cache: page 5 marker line 147 carries the Theorem, page 6 (line 186) prints running head “…77” | “pp.76–77” correct. |
| WeilConjectures §6.1 description | WeilConjectures open-head README lines 1271–1278 | Properties as listed; source there is Deligne II Cor. 3.3.9. |

The other seeded targets (0.5, 0.5a, 2.6, 2.8, 3.6, 4.3, 4.6, 4.10, 4.18, 6.7, 6.8, 7.6a, 7.17, 7.18) are untouched since 04e21d3 and keep the verification of the previous two reviews.

### Adversarial values

New rows for every changed statement, then the untouched rows of the previous report, each marked “r3” and unchanged in value. `F` is geometric Frobenius, `q=#k`, `Π_i` the factor family, `P_i` its monic reversal.

| Statement | Instances tried | Computed values on the two sides / excluded alternative | Result; change |
| --- | --- | --- | --- |
| 7.4 `deg Π_i=dim H^i_ℓ` and `P_i=T^{deg Π_i}Π_i(T⁻¹)` is the characteristic polynomial | `H`=line with `F=q`; `H=0`; `F` nilpotent (excluded) | `det(1−Tq)=1−qT`, reversal `T−q`=charpoly ✓; `H=0`: `Π=1`, `P=1` ✓; a nilpotent `F` would give `det(1−TF)=1` of degree `0<dim H`, so the degree equality needs `F` invertible, which §F.10 supplies (geometric Frobenius is an automorphism) and the root clause also forces (no root `0`) | Retain |
| 7.4 coprimality of `P_i,P_j` for `i≠j` | `ℙ¹`: `P₀=T−1,P₂=T−q`; `E/𝔽_q`: `P₁(1)=q+1−a`, `P₁(q)=q(q+1−a)` | Roots have absolute values `1≠q` (q≥2); `q+1−a≥(√q−1)²>0` by `abs(a)≤2√q`, so `P₁` is prime to `P₀` and `P₂` | Retain; three new Checks correct |
| 7.4 CRT polynomials and Cayley–Hamilton | `ℙ¹`: `e₀=(q−T)/(q−1)`, `e₂=(T−1)/(q−1)` | `e₀(1)=1,e₀(q)=0`; `e₂(1)=0,e₂(q)=1`; `e₀+e₂=1` ✓, agrees with the earlier `ℙ¹` Check; a degree `i` with `H^i=0` has `P_i=1`, every `e_j` is `≡0` mod the others and `e_i=0` works, so the empty projector is `0` | Retain |
| 7.4 graph convention | `Γ` = graph of `qPowerFrobenius` in `Corr⁰(X,X)`; `ℙ¹` | §0.2: the graph of `f` acts by pullback `f^*`; §F.10.2b: `φ^*=F`; on `H²(ℙ¹)` pullback by the degree-`q` map is `q` (pushforward would be `1`), matching the Check's `T−q`; with `φ_*=F⁻¹` instead, `e_i(F⁻¹)` would not be `δ_ij` (the reversal `P_j^*` is not `P_j`) | Retain; convention pinned by §0.2 and §2.7 |
| 7.4 class determined by degreewise actions | `X=ℙ¹`, `H^{2}(X×X)(1)=ℚ_ℓ^{2}` | Künneth: `End(H⁰)⊕End(H²)=ℚ_ℓ²`; a class acting by `(1,0)` is `π₀` and by `(0,1)` is `π₂`; §2.3 states the “zero iff all degreewise actions zero” theorem used | Retain |
| 7.4 uniqueness of `Π` | `Π,Π'` with equal images at one `ℓ` | `ℤ[T]→ℚ_ℓ[T]` injective, so `Π_i=Π'_i`; the root clause is then automatic from the other `Π` | Retain |
| 7.4 `Spec 𝔽_(q²)` Check | `d=0`, `H⁰=ℚ_ℓ²`, `F` swaps | `det(1−TF)=1−T²`, roots `±1`, `abs=1=q⁰` ✓; `j∈{0}`, `e₀≡1 mod (T²−1)`, `e₀=1`, `e₀(Γ)=Δ` ✓ | Retain |
| 7.4 `ℙ¹` negative control | `Π₂:=T−q` | image `T−q≠1−qT`; root `q`, `abs(q)=q≠q⁻¹` ✓ both clauses fail | Retain |
| 7.4 empty `X` and disconnected `X` | `X=∅`; `X=ℙ¹⊔pt` | `∅`: all `Π_i=1`, every `e_i=0`, trivially `C`; `ℙ¹⊔pt`: `P₀=(T−1)²`, `P₂=T−q`, coprime; `e₀` acts as `1` on `H⁰=ℚ_ℓ²` (Jordan block permitted, full charpoly used) | Retain; no connectedness needed |
| Contract line 63 `E=ℚ_ℓ`, proper `X` | `𝔾_m` (nonproper, excluded) vs `ℙ¹` | `H^*_c(𝔾_m)` in degrees 1,2 ≠ `H^*` in degrees 0,1 (§F.4.5 Check), so “compact support is ordinary cohomology” needs properness, which §7.4 has | Retain |
| Downstream paragraph properties of `Π` | WeilConjectures §6.1 | constant coefficient one (`det(1−0·F)=1`), `Π_i=1` for `i>2d`, roots `q^{-i/2}` | Retain; R02 wording only |
| 4.15 locator | FV Thm 5.13 / Cor 5.14 | abstract blow-up triangle and its long exact sequence, p. 28–29 | Retain; previous R01 closed |
| Lean docstring sentence | pins | no `ℓ`-adic cohomology carrier, no Chow correspondences at the pins | Retain |
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
| 2.7 Frobenius | ℙ¹/𝔽_q | `q`; `1/q`; `1` | r3; unchanged |
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
| 7.4 Frobenius projectors (old Check) | `ℙ¹/𝔽₂` | `1,0` and `0,1` | r3; unchanged, now derived from `Π` above |
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

The pins are unchanged (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`); the fourteen declarations the previous reviews opened are cited by Lean statements the diff does not touch and still resolve (probe above). For the changed passages the objects are the geometric Frobenius on `ℓ`-adic cohomology, the `q`-power scheme Frobenius, the Künneth projectors and the integral Frobenius factors: searched by object in the pinned sources (`geometricFrobenius`, `qPowerFrobenius`, `charpolyRev`: only `FiniteField.frobeniusAlgEquivOfAlgebraic` in Mathlib, `TauCeti.FiniteField.geometricFrobeniusBialgHom` in Tau Ceti, `Matrix.charpolyRev` in Mathlib; no cohomology action), on main (EtaleCohomologyFoundations §§F.10.1–F.10.2b and SchemeAndStackFoundations §0.29 own the Frobenius objects and are cited, not rebuilt) and at the open heads through the roadmap grep (`compactFrobeniusModule`: only the EtaleCohomologyFoundations revision, R01; the factor family: WeilConjectures §6.1, cited as a hypothesis source; Künneth projectors from Frobenius: only this roadmap). The Künneth construction of §7.4 is owned here (Scope: §§7.3–7.4 own the standard-conjecture predicates and their cases). Ownership against open pull requests other than those the brief lists by path, or readable through the roadmap tool, was not checked further.

### Shape

The new contract paragraph sits under the supplier heading, §7.4 keeps its locators and ten Checks (three new, each with a computed value and a wrong-definition control), the Layer 7 Dependencies paragraph names the two suppliers by section, and no process words, pull-request numbers, LaTeX delimiters or local paths were added (gate counters zero). The only shape defect is the unbackticked declaration name of R01.

## Not verifiable

- **KunnemannPicard** (§7.17): unchanged, outside the changed passages, still the publisher verification page only.
- Katz–Messing, recorded as uncertified by the previous reviews, is now read from the author's page copy (cache 9283138c, an OCR'd GDZ scan); its Theorem 2(1) and proof are as cited above, so it leaves this list.

## Source issues

- none
