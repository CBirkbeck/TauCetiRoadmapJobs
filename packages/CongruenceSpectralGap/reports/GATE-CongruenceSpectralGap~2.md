## H01 (CBirkbeck) — answered

Whether the curve Euler–Poincaré formula moves to InverseGaloisAndArithmeticFundamentalGroups is an ownership decision for the maintainer, so this branch leaves it unchanged. Here are the facts at the cited heads. EtaleDualityAndPerverseSheaves (head 34e0692), §5.2, README lines 4914–4936, states `curveEulerPoincareSwan` over an algebraically closed field with ℚ̄_ℓ coefficients, a finite coefficient-field form and coefficient extension, and its scope paragraph (line 13) claims that construction. InverseGaloisAndArithmeticFundamentalGroups (head 740b9cc), README lines 6590–6637, covers only 𝔽_ℓ coefficients on affine curves (s≥1) over an algebraically closed field of characteristic p>0.

In the merge order, InverseGaloisAndArithmeticFundamentalGroups is line 49, CongruenceSpectralGap line 101 and EtaleDualityAndPerverseSheaves line 117. This roadmap therefore cannot consume EtaleDualityAndPerverseSheaves, and its README cites it nowhere. It consumes only the finite-coefficient target (`TauCetiRoadmap/CongruenceSpectralGap/README.md` lines 19, 126, 663, 673 and 777). Either way of resolving the overlap respects the direction of supply:
- EtaleDualityAndPerverseSheaves consumes the §4.2b curve target from here; or
- the InverseGalois target is extended to the rational, proper and characteristic-zero cases, and both roadmaps consume it. In that case the curve Euler–Poincaré paragraph here (lines 663–673) becomes a supplier citation. The perfect-base residue-degree descent, the Swan-constancy criterion and the Kloosterman applications stay here.

## H02 (CBirkbeck) — answered

The requested synchronization is an edit to PadicDifferentialEquationsAndRigidCohomology, which is outside this branch. This branch already carries its own side. At head 5ea2fe1, RD.6.95 (README line 14655) and that roadmap's Suggested.lean lines 100–111 define:
- `RD6.kloostermanSum` over `[CommRing K]` with `z : Fˣ`, the sum of ψ(Σxᵢ+z(∏xᵢ)⁻¹) over `Fin n → Fˣ`;
- `kloostermanSum_bound`, with right side (n+1)·sqrt(|F|)^n.

That is exactly the eliminated-variable sum that §4.2a (`TauCetiRoadmap/CongruenceSpectralGap/README.md` line 635) identifies with `hyperKloosterman F (n+1) ψ z`. §4.2a also identifies its normalization with |F|^(((n+1)−1)/2) in `hyperKloosterman_bound`. PadicDifferentialEquationsAndRigidCohomology is line 134 of the merge order, after this roadmap (line 101), so it may consume these declarations. Lines 19, 22 and 889 here record this roadmap as owner of the coefficient-generic scalar sum and its bound. Recording that dependency at RD.6.95–RD.6.97 is that roadmap's edit.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/CongruenceSpectralGap/README.md` line 259 used to say: "Right finite-adelic translation permutes the components and transports their functions, and the identity component carries the action of SL₂(ℤ)/Γ(N)." It now says:
- The level-preserving action is that of GL₂(ℤ̂)/K(N)≅GL₂(ℤ/N), because K(N) is normal in GL₂(ℤ̂). It permutes the components by multiplying their indices by det(k) mod N.
- The stabilizer det(k)≡1 acts on the identity component by φ(z)↦φ(γ⁻¹z), where γ∈SL₂(ℤ) and γ≡k mod N.
- An h outside the normalizer of K(N) gives the map X_(K(N))→X_(h⁻¹K(N)h) of AdelicAlgebraicGroups §5.2. R(h) carries right-h⁻¹K(N)h-invariant functions onto right-K(N)-invariant ones, so it compares conjugate levels rather than acting on one level.

The same pattern was repaired elsewhere:
- Line 90 (supplier contract): "finite level actions" became right translation X_U→X_(h⁻¹Uh), citing the §5.2 bullet "Riemann-surface structure and change of level for GL₂ quotients" at head 70c4324.
- Line 267 (API bullet).
- Line 272: the N=3 Check is now explicit, with k=diag(1,−1) and R(k)(u,0)=(0,u).
- Line 273: a new negative Check uses the h=diag(p,1) instance. Computing hkh⁻¹=(a, pb; c/p, d) shows that hGL₂(ℤ̂)h⁻¹∩GL₂(ℤ̂) is the set of matrices whose upper-right entry at p is divisible by p.
- Line 276 (*Needs:*).
- Line 340 (§1.1): "decomposing the finite-level action" became "decomposing its right-K(N)-invariant cuspidal space".

## H04 (CBirkbeck) — answered

The pull-request description is not one of the files this job edits, so it is unchanged here. `TauCetiRoadmap/CongruenceSpectralGap/README.md` lines 70–74 carry the order. Facts for the description:
- UnboundedOperators (#1027, head 5e40c73) and VariationalMethods (#1028, head 515847c) are open pull requests by another author that add new folders. Neither is on main or in the merge-order file.
- At those heads, UnboundedOperators README line 339 and VariationalMethods README line 51 both give the order V2.3 → UO-D06 → V5.1.
- UO-D06 needs UO-A01–UO-A03, SelfAdjointSpectralTheory SA-E01 with its graph and resolvent interfaces, and V2.3.
- This roadmap consumes UO-A01–UO-A03 and UO-D06 (lines 14 and 70–74). It uses V2.3 only as a prerequisite of UO-D06, and V5.1 is not an input.

## H05 (CBirkbeck) — applied

`TauCetiRoadmap/CongruenceSpectralGap/README.md` line 475 used to read "AL.1–AL.3 with gap:all-prime-self-pair-positivity and gap:self-pair-local-character-transport". It now reads: "AL.1–AL.3 for the canonical local and global factors, continuation and functional equations; the local self-pair positivity and analytic character and epsilon transport of §2.0, proved here on those factors; SmoothRepresentationsOfLocalGroups SR.2–SR.3 and SR.5.2 and AutomorphicSpectralTheory §7.0b, finite-place unitary-classification prefix, for §2.0". No `gap:` name remains in the README (count 0). The added suppliers are those already named in §2.0's *Needs:* line (line 427).

## Build and gate

- `lake build TauCetiRoadmap.CongruenceSpectralGap.Suggested` exits 0 with three warnings, each "declaration uses `sorry`", at Suggested.lean lines 51, 62 and 78. Suggested.lean is unchanged.
- Elaborated types were checked: `#check @` of `hyperKloosterman`, `hyperKloosterman_bound`, `gauss_power_even_average_bound` and `congruence_eigenvalue_bound` was elaborated once, in a temporary addition that has since been removed. Each type matches its README statement (§§4.2a, 4.2b, 4.3 and 5.3). The file has no `variable` or `include`, so no binder is dropped, and nothing changed.
- Dependency check: `depcheck: 55 roadmaps, 638 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Gate: `gate CongruenceSpectralGap: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Policy greps on the changed files: `set_option` 0; imports are the single line `import Mathlib`; `lemma` 0; sorry'd data 0; pull-request references in the README and Lean 0; LaTeX delimiters 0; process residue in the added lines 0.
- No new source was cited or fetched, and no needs-references file was written. Ownership: no construction was added. The repairs cite AdelicAlgebraicGroups §5.2 (head 70c4324), and §2.0's existing suppliers were checked at the heads listed above.
- The review contains no suspicious instruction.

## Adversarial mathematics record

| Statement (changed or added) | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| K(N) is normal in GL₂(ℤ̂); R(k) preserves right-K(N)-invariance | general u∈K(N), k∈GL₂(ℤ̂) | (R(k)f)(gu)=f(gk·k⁻¹uk)=f(gk), since k⁻¹uk≡1 mod N | holds | stated at line 259 |
| GL₂(ℤ̂)/K(N)≅GL₂(ℤ/N); components permuted by det(k) | N=1, 2, 3 | N=1: trivial group, one component. N=2: (ℤ/2)ˣ trivial, one component. N=3: det(diag(1,−1))=−1≡2, so 1↦2 and 2↦4≡1 | holds | line 259 |
| det≡1 stabilizer acts on the identity component by φ(z)↦φ(γ⁻¹z) | [z,k]=[z,γ_f k₁] with k₁∈K(N); N=2 | [z,k]=[γ⁻¹z,1]; L(γ₁γ₂)φ(z)=φ(γ₂⁻¹γ₁⁻¹z)=L(γ₁)L(γ₂)φ(z), a homomorphism; at N=2 the group is SL₂(ℤ)/Γ(2)≅SL₂(𝔽₂) of order 6 (−I∈Γ(2)), agreeing with the S₃ of the Layer 1 Examples | holds | line 259 |
| R(h) carries right-h⁻¹K(N)h-invariant functions onto right-K(N)-invariant ones (pullback along X_(K(N))→X_(h⁻¹K(N)h)) | u∈K(N); h central; h∈GL₂(ℤ̂) | (R(h)f)(gu)=f(gh·h⁻¹uh)=f(gh); inverse R(h⁻¹). Central h or h∈GL₂(ℤ̂) gives h⁻¹K(N)h=K(N), which is the fixed-level case. The direction agrees with [x,a]↦[x,ah]: X_U→X_(h⁻¹Uh) at the supplier | holds | line 259 and line 90 |
| R(h) is an isometry for the fixed Haar measure | f=1 at N=1 | R(h)1=1, same norm; GL₂(𝔸) is unimodular | holds | line 259 |
| N=3 Check: R(k)(u,0)=(0,u) | representatives 1 and k=diag(1,−1), k²=1 | R(k)F([x,k])=F([x,k²])=F([x,1])=u(x); R(k)F([x,1])=F([x,k])=0 | holds | line 272 |
| Negative Check: h=diag(p,1) does not normalize K(1) | k=(1 1;0 1); general k=(a b;c d) | h⁻¹kh=(1 p⁻¹;0 1)∉GL₂(ℤ_p); hkh⁻¹=(a, pb; c/p, d), so hGL₂(ℤ_p)h⁻¹∩GL₂(ℤ_p)={upper-right ≡0 mod p} | holds | line 273 added |
| API bullet: R(k) corresponds to permutation by det(k) plus SL₂(ℤ)/Γ(N) on the identity summand | N=3, k=diag(1,−1); N=2, k≡(1 1;0 1) | N=3 swaps the two summands. N=2: one summand, acting by φ(z)↦φ(z−1) | holds | line 267 |
| §1.1 "right-K(N)-invariant cuspidal space" | Γ=Γ(3), N=3 | constituents π contribute π^(K(3)); this agrees with the two-summand Hilbert sum of §0.5a | holds | line 340 |
| Layer 2 *Dependencies* agree with §§2.0–2.1 *Needs* | items of lines 427 and 449 | AL.1, AL.3, SR.2–SR.3, SR.5.2, AutomorphicSpectralTheory §7.0b, AutomorphicFormsOnReductiveGroups §2.6, Wiener–Ikehara all listed; `gap:` names: two on one line before, 0 after | holds | line 475 |
