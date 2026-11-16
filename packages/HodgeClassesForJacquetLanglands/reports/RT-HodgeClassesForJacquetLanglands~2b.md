<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13148#issuecomment-6906287212 -->
Red team round 2 pass b (claude) of ff6a1d8

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the case `d = 0` is used by the end theorems but lies outside the hypothesis of §0.2

   - **Location.** `README.md:644` ("Let `(G, X)` be a Shimura datum of abelian type whose Shimura
     varieties are compact"), used at `d = 0` in `:727–729`, `:919–920`, `:939`, `:2749–2752`,
     `:2773–2775`.
   - **Claim.** §0.2 constructs the realizations `V_i` for all Jacquet–Langlands Hodge data, `d = 0`
     included (§0.5 defines `V_i` "of §0.2"; §10.8 uses that "`Gal(ℚ̄/ℚ)` acts trivially on every
     `ℓ`-adic realization").
   - **Witness.** For `F = ℚ`, `B` ramified at `{∞, 2}`, `h` trivial: `G^ad(ℝ)` is compact and `h`
     projects trivially to it, so SV3 fails. ShimuraVarieties §P.1 (head, line 22: "A pure datum …
     satisfies the `SV1`–`SV3` axioms") excludes it, so §§6.7, 8.1 and AutomorphicBundles §§3.4–3.5 do
     not apply; §8.6 treats tori only.
   - **Repair.** Add to §0.2, after the four constructions:

     > **The definite case.** The same objects are defined for a pair `(G, h)` with `G^ad(ℝ)` compact
     > and `h` trivial, which is not a Shimura datum (SV3 fails); for Jacquet–Langlands Hodge data with
     > `d = 0` it is `(Res_{F/ℚ}B_i^×, 1)`. Here `X` is a point, `K_h = G(ℝ)`, and
     > `Sh_K = G(ℚ)∖G(𝔸_f)/K` is a finite set, with model the constant finite étale `ℚ`-scheme. For
     > neat `K` the image of `Γ_g = G(ℚ) ∩ gKg⁻¹` in the compact group `G^ad(ℝ)` is finite, hence
     > trivial, so `Γ_g = Z(ℚ) ∩ K` acts trivially on `V` by the fibre condition. Define
     > `H⁰(Sh_K, 𝕍) = {φ : G(𝔸_f)/K → V : φ(γg) = ρ(γ)φ(g) for γ ∈ G(ℚ)}`, of Hodge type `(0,0)`, and
     > `H^i = 0` for `i > 0`; `𝕍_ℓ = 𝕍 ⊗ ℚ_ℓ` with trivial Galois action and the identity comparison;
     > Hecke operators by double cosets; Poincaré duality by `Σ_x ⟨φ(x), φ′(x)⟩` over `x ∈ Sh_K`; the
     > isotypic parts and their Matsushima description by gap:shimura-matsushima-comparison with
     > `K_h = G(ℝ)`. ShimuraVarieties §§6.7, 8.1 and AutomorphicBundles §§3.4–3.5 are not used in this
     > case.

     and in §0.5 write "of §0.2 (for `d = 0`, its definite case)". Tested on the witness with `k = 2`:
     `H⁰` is the `L`-valued functions on a finite set, `V_i` has rank one and type `(0,0)`, Galois acts
     trivially: the values §0.5 (Check 2) and §10.8 use.

2. **F02** (P2) gap:quaternion-ramification-classification asks for what an earlier roadmap and main already give

   - **Location.** `README.md:511–515`, `:2648–2649`, `:2829`; the same slug in `design/plan.json`.
   - **Claim.** No earlier roadmap provides "`E` embeds in `B` exactly when no place ramified in `B`
     splits in `E`".
   - **Witness.** EndoscopicTransferAndUnitaryTraceComparison §8.3 (head, README line 3093; merge order
     line 149, before this roadmap): "a `K`-embedding `E↪A` exists exactly when `[E:K]·ind(A⊗_K E)`
     divides `deg(A)`"; its Check (line 3097) is the quaternion case. ClassFieldTheory on main has
     `inv_restrict` (`TauCetiRoadmap/ClassFieldTheory/README.md:561`) and `brLocalization_injective`.
   - **Repair.** Delete the gap (README contract paragraph and the entry of `design/plan.json`), and
     replace the last clause of the §10.2 proof route, "apply the embedding criterion", by:

     > `E` embeds in `B_i` exactly when `2·ind(B_i ⊗_F E)` divides `2`, that is when `E` splits `B_i`
     > (EndoscopicTransferAndUnitaryTraceComparison §8.3, the field-embedding criterion). `B_i ⊗_F E`
     > splits exactly when it splits at every place `w` of `E` (ClassFieldTheory Layer 10,
     > `brLocalization_injective`), and its invariant at `w | v` is `[E_w : F_v]·inv_v(B_i)`
     > (ClassFieldTheory Layers 2 and 6, `inv_restrict` for the local class formation; at a real `v`,
     > Layer 10 `infiniteInvMap`), which is `0` unless `v` ramifies in `B_i` and splits in `E`.

     In the `*Needs:*` of §10.2 (`:2648–2649`) and the Layer 10 Dependencies (`:2829`) replace the gap
     by "EndoscopicTransferAndUnitaryTraceComparison §8.3; ClassFieldTheory Layers 2, 6, 10", and add
     both to the contracts (a subsection for EndoscopicTransferAndUnitaryTraceComparison §8.3;
     `inv_restrict` and `infiniteInvMap` in the ClassFieldTheory one) and to the Scope list. Tested: `B = (−1,−1)_ℚ`, ramified at
     `{∞, 2}`. `E = ℚ(√2)`: `∞` splits, invariant `1·½ ≠ 0`, no embedding. `E = ℚ(i)`: `2·½ = 0` at
     `∞` and at `2`, embeds. `B = M₂(ℚ)`: all invariants `0`, every `E` embeds.

3. **F03** (P3) §6.3 is stated in a setting defined two sections later

   - **Location.** `README.md:1920`: "In the anisotropic rank-three setting of §6.5, let `I_v(s)` be …";
     `:1927` uses `ad τ`.
   - **Witness.** The space `X`, the group `G` and `τ` are introduced in §6.4 (`:1944–1946`); §6.5
     (`:1965`) only says "Under the hypotheses of §6.4". The `*Needs:*` of §6.3 (`:1939`) is §3.1, so
     the target cannot be read in build order.
   - **Repair.** Begin §6.3 with: "Let `X` be the rank-three skew-Hermitian `B`-space of §1.6 with
     `U(X)` anisotropic over `F`, `G = GU_B(X)°`, `H_N^+ = {h ∈ B^×(𝔸) : Nrd(h) ∈ N(𝔸_E^×)}` and `τ`
     an irreducible unitary automorphic representation of `H_N^+`. Let `I_v(s)` be …", add §1.6 to its
     `*Needs:*`, and begin §6.4 with "In the setting of §6.3, assume that the lift `Π = θ(τ)` to `G` is
     nonzero and cuspidal."

4. **F04** (P3) a Check of §0.2 counts components with an undefined group that gives the wrong set

   - **Location.** `README.md:750–751`: "`Sh_K` has `π₀(Sh_K ⊗_E ℚ̄)` in bijection with
     `G(ℚ)⁺\G(𝔸_f)/K`".
   - **Witness.** The README defines only `G(ℚ)₊`, the stabilizer of `X⁺` (`:665–666`). Read as
     `G(ℚ) ∩ G(ℝ)⁺`: for `𝔾_m`, trivial `h`, `K(3)`, `ℚ_{>0}∖𝔸_f^×/K(3) = (ℤ/3)^×` has `2` points;
     the README's own value (`:872–873`) is `1`.
   - **Repair.** "in bijection with `G(ℚ)₊∖G(𝔸_f)/K`, `G(ℚ)₊` the stabilizer of `X⁺` as above (Mil17,
     Lemma 5.13, p. 57)". Tested: `ℚ^×∖𝔸_f^×/K(3) = Ẑ^×/{±1}K(3)`, one point.

Two P2 and two P3 findings, all new (S01–S04). Every round-1 finding is repaired at this head except
the one the repair disputed, which is not re-raised. No statement of `Suggested.lean` and no formula
of the README was found false on the instances computed; the findings are a case the end theorems use
that lies outside a target's hypothesis, a declared gap that earlier roadmaps already cover, and two
local defects.

## Round 1: verification of the repairs

| Finding | State at `ff6a1d8` | Witness (repaired passage) |
|---|---|---|
| 1a/F01, 1b/F12 (gap asks for the ramification classification) | repaired | `README.md:511–515`: "`E` embeds in `B` as an `F`-algebra exactly when no place of `F` ramified in `B` splits in `E` … The realization … and the classification … are GL2AutomorphicRepresentationsAndTransfer §R17.1.5"; §0.4 route `:895–904`; `design/plan.json` `gaps` has the same sentence. §R17.1.5 read at its head: both names and both statements are there. The narrowed gap is S02. |
| 1a/F02 (subquotients of de Rham) | repaired | `:575–579` gap keeps one-point rigidity only; `:2556–2557` "(PadicHodgeTheory §3.1 for `B = B_dR`)"; supplier §3.1 read: "Subobjects and quotients of an admissible object are admissible". |
| 1a/F03, 1b/F08 (§7.10 Check count) | repaired | `:2233–2236`: "there are `2² = 4` sign vectors … the four pairings are two up to scalars". Recomputed: `2^n = 4`; weights `±(k_v − 2) = 0` at `k_v = 2`. |
| 1a/F04 (Dependencies lines) | repaired | Script over all eleven layers: every `*Needs:*` item is in its layer's Dependencies line (Layer 0 and 1 list `TauCeti.Hodge` and Mathlib `exteriorPower` by file group). |
| 1b/F01 (Periods-I splitting) | repaired | `:479–489` gap now begins with the construction of `s̃_v` on equal-multiplier pairs; `:456–460`, `:1860–1861`, `:1895–1896`, `:2096–2099` cite the gap. Supplier §§3.23, 3.24, 3.32a read: consistent. |
| 1b/F02 (unitary stable range) | repaired | `:491–497` new gap; `:1873–1876`. Recomputed: `dim V_v = 1 ≤` Witt index `1` of the split plane (stable range); conservation `n₁ + n₂ = 2·1 + 2 = 4`, so a nontrivial `χ_v` occurs at dimension `2` in both towers (supplier §3.16, `d = 2` for unitary). |
| 1b/F03 (infinite central kernel) | repaired | `:664–677` effective-quotient descent stated in the target; contract `:352–357`. Recomputed on `ℚ(√2)`, `K(3)`: `Γ = ⟨−ε⁴⟩`, `Γ̄ = 1`, `N(−ε⁴) = 1`. |
| 1b/F04 (real Weil operators) | repaired | `:1608–1615`. The four formulas agree with IP23 lines 2124–2147 (p. 50). Recomputed: `ω(w)²φ(x) = i^{q−p}φ(−x)` against `ω(−1)φ(x) = (−1)^{m/2}φ(−x)`, ratio `(−1)^p = 1`; `χ_V(a)\|a\|^{m/2} = sgn(a)^{m/2}\|a\|^{m/2} = a^{m/2}`; Gaussian weight `(p − q)/2`. |
| 1b/F05 (arrangement) | disputed by the repair; not re-raised | The reason given (the Dependencies lines force `1→2→3→4→5` and `5,6→7→8→9→10`; no layer is named after a source section; the pairing with IP23 is not one to one: `Layer 0 ↔ §§2–3`, `Layers 1–2 ↔ §5`, `Layer 3 ↔ §§6–7`, `Layer 5 ↔ §4` out of order, `Layers 8–9 ↔ §11`) is not wrong on the facts. The mapping is reported to the human reviewers. |
| 1b/F06 (`artinComparison`) | repaired | `:542–544`, `:686–687` "(ComplexComparisonPartII §C6.6)"; §C6.3 and §C6.6 exist on main. |
| 1b/F07 (two PadicHodgeTheory citations) | repaired | `:699–712` routes through §§3.6, 3.3, 3.1 and ClassicalAdicEtaleCohomology §8.2. Supplier §3.6 read: "Equality only on an open subgroup … gives potential crystallinity"; §3.3: "crystalline⇒de Rham … imported", finite extensions detect; §8.2 contains Huber's Theorem 3.7.2 for proper `f` and torsion `Λ`. |
| 1b/F09 (§7.9 Check) | repaired | `:2203–2209`; supplier §2.6 has `Y_c v_ℓ=(k−ℓ)v_{ℓ−2}/2` and the Check `Y_c v_k = 0`. |
| 1b/F10 (`p₂,*`) | repaired | `:986–990`. Degrees: `2d + d − 2d = d`. |
| 1b/F11 (title) | repaired | `:1`. |

No repair introduced an error that I could find; the new text was recomputed in the table below.

## Verified sound

Counts: 4 declarations read (all of `Suggested.lean`); 75 targets read (all 2929 lines of the
README); 22 source locators opened this round (IP23 15, Mil17 4, FM06 2, Wal85 1); about 60 Checks
and worked values recomputed; 97 cited sections located at the open heads of 15 suppliers and 31
sections or names on main, with the text read for the 30 listed below; 16 pinned declarations found
at their declaration lines.

- **Dependency check** (command of the brief):

  ```
  depcheck: 242 roadmaps, 2280 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. The roadmap is at line 290 of the merge order.
- **Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found
  nowhere. No "never cite" roadmap is named.
- **Package scope.** The pull request's diff touches only `packages/HodgeClassesForJacquetLanglands/`.
- **Policy.** One `import Mathlib`; no `set_option`, `#eval`, `lemma`, sorry'd data; no pull-request
  number or process word in the README or the docstrings; the four backticked names of this roadmap
  are the four declarations.
- **Elaborated signatures.** No Lean was run in this pass (the brief allows none). The four
  elaborated types of the worker's listing were compared with §§1.3, 1.4, 1.7: no `variable` block,
  every binder is in its own signature, generality equal to the README's (any field, any ring
  endomorphism `σ`, any sesquilinear `H`).
- **Headlines and padding.** Headlines: IP23 Theorems 1, 3.2, 12.4; Propositions 5.3, 5.6–5.7,
  8.1–8.2, 9.5, 10.1, 11.6; Remark 11.10. Statable at the pins and stated: 5.3 and the point-level
  identity (5.10); the rest are named in the module docstring with the missing carriers.
  `existsUnique_isExteriorStar` is what makes the hypothesis of the other two non-vacuous. None of
  the three follows from one pinned lemma.
- **Supplier text read and found as cited.** GL2AutomorphicRepresentationsAndTransfer §R17.1.5;
  PadicHodgeTheory §§3.1, 3.3, 3.6, 7.2; MetaplecticAutomorphicForms §§2.4c, 2.5, 3.3, 3.9, 3.16,
  3.23, 3.24, 3.32a, 3.33–3.36; AutomorphicFormsOnReductiveGroups §2.6; AutomorphicBundles §0.2;
  ShimuraVarieties §§8.5–8.7; ClassicalAdicEtaleCohomology §8.2; MotivesAndAlgebraicCycles §7.15;
  EndoscopicTransferAndUnitaryTraceComparison §8.3; on main ClassFieldTheory (Layer 10 names, the
  former-numbering table for §5.4, `inv_restrict`), ComplexComparisonPartII §§C6.3, C6.6,
  ComplexKahlerGeometry (K6.0, K6.1 labels).
- **Pinned declarations (declaration lines).** Tau Ceti:
  `LinearMap.map_exteriorPower_finrank_eq_det_smul` and `Module.Basis.exteriorPowerTopEquiv`
  (`TauCeti/LinearAlgebra/ExteriorPower/Basis.lean`), `QuaternionAlgebra.rescaleJEquiv`,
  `normMulEquiv` (`SymbolEquiv.lean`), `tensorAlgEquivTensorMatrix` (`TensorProduct.lean`),
  `quaternionClass_mul` (`BrauerClass.lean`), `symPowerRep`
  (`RepresentationTheory/ClassicalGroups/SymmetricPower.lean`), `barHodgeStar`,
  `barHodgeStar_barHodgeStar`, `HodgeStructureOn.tateTwist`, `internalHom`, `singularTransfer`.
  Mathlib: `instIsPerfPairWedgePairing`, `isUnit_apply_topVector`, `pairingDual_ιMulti_ιMulti`,
  `H1ofAutOnUnitsUnique`, `MvPolynomial.funext`.
- **Gaps.** Nine slugs in `design/plan.json`, the same nine in the README, each with a named supplier
  and section. Eight are not raised; one is S02. Checked for precision:
  gap:norm-subgroup-restriction excludes one-dimensional representations by its central character
  (`χ²` is even at a real place, `ξ_E` is odd there); gap:unitary-stable-range is true as restricted
  (row below).
- **Ownership.** Searched by object over main and the open heads: no other roadmap states the
  operator `L`, the exceptional maps, Kudla–Millson or Funke–Millson forms (SiegelModularForms says
  it has none), the Periods-I splitting, a unitary stable range, or the end theorems. The four Lean
  names occur in no other `Suggested.lean`. ModularityAndLanglandsExtensions §3.21 cites IP23 §11.2
  for Adams–Johnson packets, a different statement from §8.2. The worker's overlap listing has no
  shared roadmap, second copy or dropped id.

### The adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `IsExteriorStar` | `H = diag(a_i)`, `d_U(e₁₂₃₄) = −1`; wrong model `−L` | six images `−a₁a₂e₃₄, a₁a₃e₂₄, −a₁a₄e₂₃, −a₂a₃e₁₄, a₂a₄e₁₃, −a₃a₄e₁₂` from the signs `+,−,+,+,−,+` of `e_K ∧ e_J`; `−L` gives `+a₁a₂ ≠ −a₁a₂` | determines `L`; agrees with §1.3 |
| `existsUnique_isExteriorStar` | `H = 0`; `σ` not surjective (`t ↦ t²` on `ℚ(t)`) | `H = 0`: `L = 0` unique by perfectness; general `σ`: `(u₁,u₂) ↦ Hu₁ ∧ Hu₂` is alternating and bilinear into the restriction of scalars along `σ` | true as typed |
| `IsExteriorStar.comp_self` | diagonal; `H = 0`; non-Hermitian `1 + E₁₂` | `L²e₁₂ = σ(−a₁a₂)(−a₃a₄)e₁₂ = ∏a_i`, right side `∏a_i/(σ(−1)(−1))`; `0 = 0`; README's control `L²e₁₃ = e₂₃` | true; hypothesis needed; `σ(c)c ≠ 0` |
| `IsExteriorStar.map_similitude` | general `g`; `ν = 0`; `g = t` | `vol(L(⋀²g u) ∧ y) = ν²·vol(Lu ∧ ⋀²g⁻¹y)`, `vol(⋀²g(Lu) ∧ y) = det g·vol(Lu ∧ ⋀²g⁻¹y)`; `ν = 0 ⇒ H = 0 ⇒ 0 = 0`; `t`: `t⁴/t⁴ = 1` | true |
| §0.2 fibre condition, `Res¹_{ℚ(∛2)/ℚ}𝔾_m` | `u = ∛2 − 1` | `(u+1)³ = 2` gives `u³+3u²+3u−1`, norm `1`; `T_ℝ ≅ Res_{ℂ/ℝ}𝔾_m` not split, `T` has no proper subtorus, `Z_s = 1` | as stated |
| §0.2 non-Hausdorff quotient | `(1,1;ε^{2m})`, `ε = 1+√2` | `ε² = 3+2√2`, conjugate `3−2√2`, both positive; totally positive units are `ε^{2ℤ}` | as stated |
| §0.2 spectral input at `K(3)` | `Γ = ⟨−ε⁴⟩` on `T(ℝ)¹` | four lines, sign `(−,−)`, shift `8 log ε`: two circles; `T(ℝ)`-invariants of dimension `1` | as stated |
| §0.2, `d = 0` | `F = ℚ`, `Ram(B) = {∞,2}` | SV3 fails; no supplier section applies | S01 |
| §0.2 component count | `𝔾_m`, `K(3)` | `ℚ^×∖𝔸_f^×/K(3)`: `1`; `ℚ_{>0}∖…`: `2` | S04 |
| §0.3 degree formula | `K(9) ⊂ K(3)` in `ℤ[√2]` | `ε⁴ ≡ −1+3√2`, `ε⁸ ≡ 1+3√2`, `ε¹² ≡ −1 mod 9`; orders `8`, `24`; points `1`, `3`; index `9`; `−ε⁴ ≡ 1−3√2` of order `3`; degree `3` | as stated |
| §0.4 route | `Ram = {∞₂,𝔭}`, `{∞₂,𝔮}` | invariants `½+½ = 0` at `∞₂`, `½` at `𝔭, 𝔮`; `\|S\| = \|R₁\|+\|R₂\|−2\|R₁∩R₂\|` even | as stated |
| §0.5 Checks | `Q₈`; `χ₃∘det` | `(2+2+6·(−2))/8 = −1`; `χ₃(−1) = −1` on `diag(−1,1) ∈ K₁(3^r)` | as stated |
| §0.6, §0.7 | weights `(2,4)`; `d` | `(3,−1),(2,0),(0,2),(−1,3)`; `d+d−2d = 0` | as stated |
| §1.5 | diagonal | `b(Le₁₂,e₃₄) = b(Le₃₄,e₁₂) = −i∏a_i`; `σ(b(Le₁₂,Le₁₂)) = −i(a₁a₂)²a₃a₄ = −J·b(e₁₂,e₁₂)` | as stated |
| §§2.1–2.6 | `β = (1+2i)+j·i`, `α = 2−i`, `J = −3`; block dimensions | `Nrd = 8`, `8/5`, `8(3+4i)/25`; `L₁e₁ = −a₁e₂`, `L₁e₂ = a₂e₁`; `5+5−1−1 = 8 = 7+2−1`; `N(Nrd(b₁)α₁⁻¹α₂) = Nrd b₁·Nrd b₂`; Gram `1, −J₁, −J₂, J₁J₂` | as stated |
| §§3.2–3.5 | centre; `y = (1,1,i,i)`; both composites of §3.4 | `(N²,N²,N²)`; `(1,1,−1)`; `k ↦ l ↦ k` with `(2k₂)/2 = k₂`, sum `2k₁`; `dim 𝔲∩𝔭 = (8−4)/2 = 2` | as stated |
| §4.2 | `z₁²`; `w² = −1` | `(x−∂/2π)²φ₀ = (4x²−1/π)φ₀`; ratio `(−1)^p = 1` | as stated |
| §4.4 | `e₁²` in `(2,2)`; `Q·y` | contraction of `Q` is `4`; `r(Q y) = Q′ r(y)`, killed by `P_{V′}` | as stated |
| §5.2 | `T`; `Z → T`; `j` | `T ≅ Res_{E/F}𝔾_m` through `α` (kernel `(B₁¹×B₂¹)/μ₂`, `8 − 6 = 2`); kernel `([−1,1],1)`; `η_T(j(s)) = η(s⁻¹) = 1`; `N(z⁻¹α) = 1` in §7.3 | as stated |
| §6.1 with gap:unitary-stable-range | `χ_v ≠ 1`, `χ_v = 1` at a ramified place | `(n₁,n₂) = (2,2)`; `(0,4)`: lift to the anisotropic plane vanishes | as stated |
| §6.2 domain | real `v` with `B_v` split | `B₁, B₂` both ramified or both split at `v`; `Nrd(B^×(F)) = F^×`, signs by weak approximation | as stated |
| §6.3 | `s = 3/2` | `ζ_v(4)ζ_v(6)ζ_v(8)/(ζ_v(3)ζ_v(1)ζ_v(−1))`, finite; `ζ^S(1)` | as stated; S03 on its setting |
| §§7.1–7.9 weights | `Σ`, outside | Schwartz `±(k_v+1)` against `τ` of weight `∓(k_v+1)`; `k_v + 1`; `ξ_E³ = ξ_E`; `η_v\|_{E_v¹} = χ_v²` | as stated |
| §8.1 | Asai of a base change | `Sym²σ ⊕ ∧²σ·ξ_E`, `∧²σ = ξ_E`, factor `ζ_F`; dihedral for `E′ ≠ E`: `L(s, ξ_Eξ_{E′})` regular nonzero | as stated |
| §§8.6–8.7 | rows `(1,1)`, `(0,4)`, `(3,3)` | `(k−1,k−1)`, `(0,2k)`, weight `2k+2`; after shift `(1,1)`, `(2−k,k+2)` | as stated |
| §§9.1–9.2 | `θ̂²`; lowest piece | `ν·det g·det g⁻¹ = ν`; `\|·\|^{1}·\|·\|^{−2} = \|·\|^{−1}`, so `ℚ_ℓ(−d)`; degrees `6,4,2` | as stated |
| §§9.3–9.4 | `v ∤ ℓ`; length-two `W` | `𝒪_v^×` finite times pro-`p`; kernel of `Hom(G_K,ℚ_ℓ) → H¹(G_K,ℂ_ℓ)` is the unramified line; coordinate pushouts are quotients | as stated |
| §10.2 with S02 | `(−1,−1)_ℚ`, `ℚ(√2)`, `ℚ(i)` | invariants `½`, `0` | repair holds |
| §10.6 | two-step choice | a nonzero `ℚ(k)`-coordinate polynomial, a coefficient `q(x) ≠ 0`, then a nonzero `ℚ`-coordinate polynomial in `c` | as stated |
| §§10.7–10.8, `d = 0` | rank one | type `(0,0)`; needs the definite case of §0.2 | S01 |

## Not verifiable

- No Lean elaboration was run; the elaborated types are those of the worker's listing.
- The locators not opened this round (about 100 of the README's 146 source mentions) rest on the
  round-1 passes; only the 22 listed were read again.
- The Periods-I splitting (Ichino–Prasanna, *Periods of quaternionic Shimura varieties. I*) is not in
  the sources cache; the gap that asks for it was read for precision only.
- The nine declared gaps are absent from their suppliers, as gaps are; their content was not derived.
- The analytic statements of Layers 6–7 (doubling residue, see-saw, Whittaker coefficients) were
  checked for hypotheses, weights and locators, not re-derived.
- Vogan–Zuckerman, Bloch–Kato and Yamana are cited only through IP23 or a supplier and were not
  opened.

Source independence: 12 passages compared with 4 sources (IP23 Theorem 3.2, Lemma 9.1 and proof, §8.3, §8.4, §10.4, §10.5 with Proposition 10.1, Remark 11.10, proof of Theorem 12.4; Mil17 Lemma 5.13, Theorem 5.26 with Remark 5.27; Wal85 Lemma I.2.1; FM06 Theorems 5.6–5.7), none shared beyond formulas, names and hypothesis lists; largest share IP23, 127 of 146 source mentions; contents compared with IP23: not one to one (`Layer 0 ↔ §§2–3`, `Layers 1–2 ↔ §5`, `Layer 3 ↔ §§6–7`, `Layer 4 ↔ §8`, `Layer 5 ↔ §4`, `Layer 6 ↔ §9`, `Layer 7 ↔ §10`, `Layers 8–9 ↔ §11`, `Layer 10 ↔ §12`), the order of Layers 6–10 forced by their Dependencies lines; the tables of contents of Mil17, Wal85 and FM06 were not compared.

## Source issues

- **Misprint** in IP23 at §3.2, printed page 19 (line 822): the source says the isotypic component is concentrated in degree `2d`; it should be degree `d`, the dimension of the quaternionic Shimura variety; affects nothing.
- **Error** in IP23 at Proposition 8.2, printed page 55 (line 2345): the source says the compact contraction carries a factor `(−1)^ℓ`; it should have none, the sign of the negative definite pairing cancelling that of (8.2); affects nothing.
- **Gap** in IP23 at §4.3, printed page 24 (lines 1029–1031): the source says a character of the norm-one idele classes of `E` is evaluated at `(t₁t₂)⁻¹α`, of norm `(t₁t₂)⁻¹`; it should be a character of the idele classes of `E` trivial on those of `F`; affects nothing.
- **Gap** in IP23 at the proof of Theorem 12.4, printed page 99 (lines 4559–4560): the source says the Galois group acts trivially on the components, without argument; it should take the component class in the Galois-invariant subspace; affects the proof.

## For the human reviewers

- **Scope.** The roadmap plans the main theorems of one refereed article, IP23 (Forum of Mathematics, Pi, 2023): 127 of the 146 source mentions in `packages/HodgeClassesForJacquetLanglands/README.md` are to it.
- **Scope.** Round 1 raised, and the repair disputed, that the layers follow IP23's sections; the pairing by number is in the Source independence line above. Whether that arrangement is acceptable is yours to decide.
- **Scope.** The all-`ℓ` end theorem (§10.8) is conditional on a hypothesis the roadmap does not prove (the degree-`2d` case of Kottwitz's conjecture, §9.2), as in IP23, Theorem 3.2(ii).
- **Licence.** `sources.toml` records Mil17, read from the author's page, as `open-repository`, not `author-page`.
- **Not tested.** No public formalisation outside the pinned libraries and the roadmap pull requests was searched for the four names of `Suggested.lean`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ff6a1d89d5603f424f7c434e8704c7468cb83071", "job": "RT-HodgeClassesForJacquetLanglands~2b", "model": "fable", "worker": "chris-x88"} -->
