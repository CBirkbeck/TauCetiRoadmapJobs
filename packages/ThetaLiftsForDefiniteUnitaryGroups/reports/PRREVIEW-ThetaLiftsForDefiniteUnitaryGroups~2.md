# Review of ThetaLiftsForDefiniteUnitaryGroups (pull request #2897 at be62f3b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaLiftsForDefiniteUnitaryGroups/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding about ownership rather than an error in the mathematics: target 3.2 restates and re-plans the Rallis inner product formula that ThetaKernelsForUnitaryDualPairs §6.13a (i) already states for anisotropic targets, linear-lift form included, and the scope section claims the formula for definite pairs while also assigning it to that supplier. The signs, the rank-one Checks, the theta-line values and the example field of 6.11 were recomputed and hold. There are six small corrections and two format notes. Scope, licence and an untested arrangement check, all concerning the unpublished formal proof, are left to the human reviewers.

## R01 (P2) — Target 3.2 restates ThetaKernelsForUnitaryDualPairs §6.13a (i) and re-plans its proof, so the formula has two owners

An implementer of 3.2 is sent to re-prove the doubling method (the Route at line 1034) for a statement a supplier already makes. Two roadmaps then own the Rallis inner product formula for a definite pair.

ThetaKernelsForUnitaryDualPairs §6.13a (i) (its README line 1606, at its head) states the identity for `r = 0` and every `m ≥ 1`, with `C = [E : F]/c` and the bracket holomorphic at `s₀`. Its next bullet (line 1617) gives the linear-lift form, with `L^S(s + ½, BC(π) ⊗ χ)` and the matrix coefficient `⟨π(g)F₁, F₂⟩`. Take `U(V)` definite, `χ = χ_W` and `φ₁ = φ₂ = φ`: the result is the display of 3.2, constant and matrix coefficient included. Line 1030 calls 3.2 "the definite instance of the anisotropic case of ThetaKernelsForUnitaryDualPairs §6.13a, translated to the linear lift", but §6.13a already contains that translation. The scope section lists "the Rallis inner product formula for such a pair in every range" among this roadmap's own (line 2264). Its own boundary bullet assigns the formula in "every range for an anisotropic target" to the theta roadmaps (lines 2286–2292).

The smallest change is to state the identity in 3.2 as the instance of §6.13a (i), linear-lift clause. Its route then becomes "specialise §6.13a (i) to definite `V` and `φ₁ = φ₂ = φ`", replacing the doubling-method route. This roadmap would keep as its own targets what 3.2 adds:

- the local measures with `vol(K_v) = 1` outside `S`;
- the cross terms for sums of pure tensors;
- the orthogonality of non-isomorphic summands;
- the value of `Z_v` at `s₀` as the convergent matrix-coefficient integral.

The scope sentence would then claim the operator form of the formula for such a pair and its consequences (3.3–4.3). The third headline of the summary and the docstring of `Suggested.lean` would present the formula as imported.

## C01 — No source in the References is cited with a locator

None of the 26 published works in the References carries a theorem, section or page number. The formal proof is named as the source of the routes of 1.2, 1.7–1.9, 4.2–4.3, 5.2–5.3 and all of Layer 6, but no file or declaration is given. So a reader cannot check, for instance, that Li 1992 proves 4.2 as stated. Nor can they find the declarations behind 6.11, or behind the steps of 6.3 and 6.5 marked "route not given here". Give the theorem and page at each claim a published source supports (Li for 4.2, Finis for 1.9, Kudla for 0.2). For the targets taken from the formal proof, give its declaration names.

## C02 — Rapid decay of cuspidal functions is cited to a section that takes it as given

6.3's route (line 1564), 6.7's *Needs* line (line 1916) and the supplier contract (line 2478) cite AutomorphicFormsOnReductiveGroups §4.2. That section opens by using "the supplied cuspidal kernel subspace and its rapid-decay … theorems" (main README line 604), and names ArithmeticLocallySymmetricSpaces ALS.F.6 as the supplier (line 691), which covers automorphic forms. The form 6.3 needs, for smooth cuspidal functions of uniform moderate growth, is AutomorphicSpectralTheory §3.4: the truncation of such a function is rapidly decreasing, and a cuspidal function is its own truncation. Cite that section.

## C03 — The scope assigns to the theta roadmaps all theta theory free of compactness, yet 6.3 states such results here

The boundary bullet (lines 2278–2287) gives MetaplecticAutomorphicForms and ThetaKernelsForUnitaryDualPairs "all theta theory that does not use compactness at infinity". The two square-integrability bullets of 6.3 (lines 1544 and 1552) are statements about an arbitrary unitary pair `(X, W)`, use no compactness, and are owned here. The supplier's §§5.7a–5.7b state convergence, not square-integrability, so the object has one owner, but the sentence says otherwise. Qualify it, for instance "… except the square-integrability criteria of 6.3, which are stated here".

## C04 — The summary and the scope speak of "a definite lattice" where 5.4 needs a totally positive definite one

5.4 assumes `V` totally positive definite (line 1302), as HermitianFormsAndLattices §7.1 does for `θ_L^{(k)}` on `ℋ_k^Φ`. At a place where the sign is negative the series is not holomorphic there. The summary (line 54) and the scope (line 2266) say "a definite lattice". Say "totally positive definite" in both places, as the docstring of `Suggested.lean` already does.

## C05 — In the anisotropic case of 6.8 the constant should be `c`, not `c̄`

The route (line 1980) says that integrating `K(h, h′)` against `f` in `h′` gives `c̄ · I_X(Ψ₁)(h)`. With `θ^*_X(f, Ψ)(g) = ⟨f, θ(g, ·; Ψ)⟩` and the Petersson product of the Conventions (linear in the first variable, line 183), the inner integral is `θ^*_X(f, Ψ₂)(g) = c`. The result is therefore `c · I_X(Ψ₁)(h)`. Only `c ≠ 0` is used afterwards, so nothing else changes. Write `c`, or state the convention under which `c̄` is right.

## C06 — The description reports a `sorry` warning that the file cannot produce

The validation paragraph says "the targeted Lake build succeeds with `sorry` as the only warning". `Suggested.lean` declares nothing and contains no `sorry`, and elaborating it gives no warnings. Say "succeeds with no warnings (the file declares nothing)".

## N01 — The Remark after the hypotheses of 6.11 is process narrative

The Remark at line 2107 ("The stages of the route have been examined in the wider range …, which is not claimed here") narrates past work. Drop it, or state the wider range as an open question.

## N02 — The owner of `minkowskiBound` is not named

1.6 (line 536, and its Checks and Examples) uses `minkowskiBound` from FiniteGroupInvariants 10.2 on main. It reaches it through HermitianFormsAndLattices §5.2(c), and this README never names FiniteGroupInvariants. Mathlib's `NumberField.mixedEmbedding.minkowskiBound` (`Mathlib/NumberTheory/NumberField/CanonicalEmbedding/ConvexBody.lean:444`) is a different object, a geometry-of-numbers bound. Name FiniteGroupInvariants 10.2 at the first use.

## Questions for the author

- 6.10 assumes `ε₀ ≥ 2`, but I found no step of its route that uses it: not 5.3, 6.3a, 6.8 (ThetaKernelsForUnitaryDualPairs §3.47c(1) has no such condition) or the Rallis formula for the exchanged pair. Is it needed, perhaps for local matching at the real places? I did not check ThetaKernelsForUnitaryDualPairs §3.47b's proof for this.

## Verified sound

| Statement | Instances tried | Values computed (README / mine) | Result | Change |
|---|---|---|---|---|
| 1.1 lift of a definite pair | `K_∞`-isotypic `F`, `φ_∞` | vanishing unless `σ ≅ σ_λ^∨` / `K_∞`-average projects `σ ⊗ σ_λ` to invariants, nonzero iff `σ ≅ σ_λ^∨` | holds | none |
| 1.2 class-set comparison (headline 1) | Schur on `K_∞` | `vol·(dim σ_λ)⁻¹⟨ℓ,v⟩Φ′` / integral gives `(dim)⁻¹⟨ℓ,v⟩⟨ℓ′, k_φ(t_c,t′) f(t_c)⟩`; law matches DiscreteSeries §7.5b | holds | none |
| 1.4 adjoint lift | exchanged pair; adjoint factor | sign `−ε`, form `−B`, factor `c_W/c_V` / `ε_new = sgn(W^♭)sgn(V) = −ε`; `Tr(δ⁻¹⟨w,w′⟩·(−δ)⟨v,v′⟩) = −B`; same factor | holds | none |
| 1.6 integrality | `n=1` over `ℚ(i)`, `ℚ(√−3)`; one class `{±1}` | `M(2)=24`, `1/2`, `D_K=2` / `M(2) = 2³·3 = 24`; `4, 6 ∣ 24`; §7.5b rational-model hypothesis identical | holds | N02 |
| 1.7 Fock pairing Check | `T = δ₀`, `P = z²` | `−2^{1/4}/π` / `π⁻²∂²(2^{1/4}e^{−πz²/2})(0) = −2^{1/4}/π`; Gaussian's transform `1` has zero jet | holds | none |
| 1.8 theta line Check | `ℚ(i)`, `n=d=1`, `Â = ℤ̂ ⊕ ℤ̂i` | `1.2920`, norm `1`, `≈1.6692` / computed `1.291996`, `1.0000000`, `1.669254` | holds | none |
| 1.9 induced CM types | `𝔞 = ℤ[i]`, `D = 4` | `r=1/4`, `H=|w|²`, dim `16` / `1/(4·1)`; `2·¼·2|w|²`; `rDN(4ℤ[i]) = ¼·4·16 = 16`; `Im H = E` | holds | none |
| 2.1 weights (headline 2) | vacuum both signs; `n=0`; `n=2,d=1` | central weight `−n a_v`; `det^{m_V/2}`; no occurrence / `n(m_W−d)/2` (`ε=−1`), `n(d+m_W)/2` (`ε=+1`); agree | holds | none |
| 2.2 Satake at split places | `n=d=1`; `n=0`; `n=d` | `c_w μ_w(ϖ)⁻¹`; segment alone / scalar action `gh`, substitute `g ↦ gh⁻¹`; `χ̃_V(t,t⁻¹) = χ_{V,w}(t)` | holds | none |
| 3.2 Rallis formula (headline 3) | `n=0`; `n=d=1`; §6.13a (i) | `2|φ(0)|²`; `C = 2/1` / GanQiuTakeda2014 line 1619: `c=1` for `s>0`, `2` for `s≤0`; Tamagawa `∫θ = (2/c)E` | true, duplicated | R01 |
| 3.3 range | trivial rep of `GL_n` | absolutely convergent iff `Re s > n/2` / factors `L(s+1−n/2+i)`, `i<n`; worst needs `Re s > n/2`; `d ≥ 2n+1 ⇒ s₀ ≥ (n+1)/2` | holds | none |
| 3.4 injectivity | real factor; Iwahori level, `n=2` | rank one; kernel / `∫⟨σ^∨(g)v,v⟩σ(g)dg = (dim)⁻¹|u⟩⟨u|`; `θ_φ = θ_φ∘e` | holds | none |
| 4.1 bad places | real place; bump vector | `vol·‖pr‖²`; `c ≥ ‖φ‖²vol(H_v)` / matrix-coefficient average; support in `U`, `F` fixed by `U`; supplier §3.9a(iii) states bump vectors | holds | none |
| 4.2 nonvanishing (headline 3) | `n=0`; trivial `π` | always; `ε m_W ≤ −d` / `λ=0`: `(−a)^n` a partition iff `a ≤ 0`, and `a=0` if `n>d` | holds | none |
| 5.2 norm | `(n,d) = (1,2), (1,3), (2,3)` | `L(1)`; `L(3/2)`; `L(3/2)L(1/2)` / `d/2 − i`, `i<n`: same; matches LocalFactors §7.1 | holds | none |
| 5.3 nonvanishing | `d` even, `|m_W| ≥ d`, `k ≤ 0` | `k > −|m|/2` / needs `d > n−1` (given `d>n`); `Γ_ℂ(k+|m|/2)` finite; LFunctions Layer 7 covers Grossencharacters | holds | none |
| 5.4 genus theta series | `ℚ(√−3)`, `O_E²`, `k=1`; duals | `r(L,1)=12`, `|U(L)|=72` / `6+6`; `6²·2`; `𝔇_{E/ℚ} = 𝔇_{E/F}𝔇_F` gives `𝔇_F L^#` | holds | C04 |
| 6.1 triples | `W` split; elementary divisors | `r_W ≤ p+q < N/2` / Witt cancellation gives `V ≅ V′ ⊕ H^{ε₀}`, `a − r_V ≤ N/2`; `(1,0)` against `(k,k)` | holds | none |
| 6.2 matching data | `κ < −N`; inert places | inequality implied / `|a−2p|+|a′−2q| ≤ N`; `a ≡ a′` makes `N` even, as §3.47a needs | holds | none |
| 6.3 square-integrability | stages `j < q` | `r_W ≤ p+q−j < a′−2j` / needs `a′ > p+q+j`, holds since `a′ > 2(p+q)+1` | holds | C02, C03 |
| 6.6 up the tower | `p=0` steps; `q=0` | `dim V′_j ≥ 3` iff `a′ ≥ 2q+1` / `a′−2(q−1) ≥ 3`; `ε m_W = κ ≤ −dim W₀` | holds | none |
| 6.8 back-lifts | Fejér kernel; doubling | density `≤ 1/(K+1)`; `c̄ I_X` / kernel `1` at `z=1`, `0.763`, `0` elsewhere; integral gives `c I_X` | holds up to conjugation | C05 |
| 6.10 compact case | the two signs; exchanged pair | `ε = −1, +1`; `C = 1` / `m = −κ` and `κ`, both give `ε m = κ`; `s₀ = (a′−N)/2 < 0 ⇒ C = 2/2` | holds | question |
| 6.11 example (headline 4) | `ℚ(√69,√37)`, `E = F(√−3)` | `(P1)–(P4)`, `κ = −18 < −16` / `(69/37) = (2/37)⁵ = −1`; `−23 ≡ 1 mod 3`; `ζ⁻⁹ = ζ⁻³`, product over 4 places `1` | holds | N01 |
| 6.12 recursion | steps 2 and 4 of 6.11 | `C = C′₁C_β/C₀`, `C₁C_α/C′₀` / `c(G₁) = (C′₁/C₀)c_β c(G)`; `|c_v| = Nv^{c(1/2−n)}` from `|G| = Nv^{c/2}` | holds | none |

- Overlap check: read ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities, SeesawForThetaChains, ThetaChainsOnDefiniteUnitaryGroups, CongruenceModulesOfThetaLifts, MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicSpectralTheory. The Rallis formula for a definite pair is shared with ThetaKernelsForUnitaryDualPairs, whose §6.13a (i) is the owner (R01); nothing else is shared; definite pairs, class-set lifts and Layer 6 are owned here and cited by the other four family roadmaps.
- Dependency check (candidate merge order): `depcheck: 171 roadmaps, 2003 edges, 0 problem(s)`.
- Supplier citations resolved: about 105 section citations into 21 roadmaps, on main and at the open heads; every cited section exists. Content was read for the sampled targets, among them ThetaKernelsForUnitaryDualPairs §§3.46, 5.7b, 6.13a, DiscreteSeries §§7.5a–7.5b, AbelianSchemes A5.2–A5.4, HermitianFormsAndLattices §7.1, MetaplecticAutomorphicForms §§6.4, 6.13, LFunctions Layer 7, AnalyticNumberTheoryPartII §§5.3g–5.3h, AutomorphicFormsOnReductiveGroups §§4.2–4.3.
- Library declarations opened at the pins: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `NumberField.AdeleRing` (`AdeleRing.lean:56`), `IsDedekindDomain.FiniteAdeleRing` (`RingTheory/DedekindDomain/FiniteAdeleRing.lean:95`), `Matrix.unitaryGroup` (`LinearAlgebra/UnitaryGroup.lean:105`), `NumberField.mixedEmbedding.minkowskiBound` (`CanonicalEmbedding/ConvexBody.lean:444`), Tau Ceti `TauCeti.GlobalNumberFields.HeckeCharacter` (`NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70`), `ZLattice.thetaSeries` (`NumberTheory/ModularForms/ThetaSeries/Basic.lean:102`).
- Elaboration: `Suggested.lean` elaborates with no output. It declares nothing, so there is no `#check @name` comparison to make. A scratch file with `#check` of the six library names in its docstring elaborates. No headline is statable at the pins: Tau Ceti has no unitary group schemes of Hermitian spaces, Weil representations or class sets.
- Source passages read: GanQiuTakeda2014 Theorem 7.1 (p. 33, line 1619) and Theorem 1.3 (pp. 6–7, line 263); Announcement pp. 1 and 4 (lines 5–53, 149–190). The README has no source locator to check.
- Source independence: 7 passages compared with 2 sources (GanQiuTakeda2014, Announcement), none shared beyond standard names and formulas. The README gives no source locators; by attribution in the References, [FormalProof] has the largest share, about 21 of 75 section attributions. Contents not compared with it (not read).
- Research link: Layers 3–5 are the Rallis inner product formula, nonvanishing in the stable range and the Siegel–Weil comparison for definite unitary pairs (Rallis 1984; Li 1992; Kudla–Rallis 1994; Gan–Qiu–Takeda 2014). Layer 6 and the theta chains built on Layer 1 are inputs of the announced proof of GRH (Alpöge 2026). Rests on the README's References and Announcement line 158.

## Not verifiable

- [FormalProof], the Lean repository cited for the routes of 1.2, 1.7–1.9, 4.2–4.3, 5.2–5.3 and Layer 6: not read. The README gives no file or declaration locators, and the code was not downloaded.
- The other 25 published references (Weil, Mumford, Bargmann, Finis, Kudla, Harris–Kudla–Sweet, Rogawski, Kashiwara–Vergne, Howe, Gross, Minkowski–Serre, Rallis ×3, Piatetski-Shapiro–Rallis, Li, Mínguez, Labesse, Kudla–Rallis, Ichino, Yamana, Zelevinsky, Shalika and Piatetski-Shapiro, Godement–Jacquet, Tate): cited without a theorem or page, so there was no locator to check. Gan–Qiu–Takeda was read for the wording comparison only.

Automatic checks set aside as false positives: run against the repository's default merge order instead of the candidate order, the dependency check reports this roadmap as not yet placed, although the candidate order places it right after NonordinaryCMSpecialValues. The check for files changed outside the folder lists the three family-index files, which are this pull request's own.

## Source issues

- none

## For the human reviewers

- Scope: Layer 6 (6.1–6.12) and the routes of 1.2, 1.7–1.9, 4.2–4.3 and 5.2–5.3 rest on an unpublished formal proof and its announcement of 20 November 2026 (README References). No refereed source states 6.11–6.12. Layers 0–5 rest on refereed literature.
- Licence: the licence of the formal-proof repository (github.com/leanprover-community/riemann-hypothesis) was not checked. `Suggested.lean` declares nothing, so no Lean is adapted from it.
- Not tested: the source cited for the most targets, the formal proof, was not read, so the wording and arrangement checks were not made against it.
