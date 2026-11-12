# Red-team review of #2138 ExponentialSumsAndCircleMethodPartII at d01cb8f (pass b (claude))

**Verdict:** changes needed

Scope of this pass: every line of `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/README.md` (1722 lines, 94 numbered targets, 14 layers) and of `Suggested.lean` (157 lines, 6 definitions, 2 admitted theorems), `metadata.toml`, the round-1 reports and the repair report (`reports/PORT-ExponentialSumsAndCircleMethodPartII.md`), every cited supplier section at main or at its open head, every cited library declaration at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d`), and the cached sources at the cited lines. No Lean was elaborated (read-only pass): the elaborated types were read from the supplied signature log.

## Round-1 findings at this head

| Round-1 id | Status | Witness at d01cb8f |
| --- | --- | --- |
| pass a F01 (§10.1↔§10.2 cycle) | repaired | `README.md:1199` "No identification of the abutment with mapping cohomology is made in this target."; `README.md:1228` "*Needs:* §§7.5, 9.4 and 3.6 for the finite-field comparison; §10.1 for the general-field transport." Retest k=3,d=2,n=40: Fourier-side cutoff 160+8−12=156, i=j−160>−4, D=74; §10.1 no longer needs §10.2. |
| pass a F02 (standing hypotheses of Layers 5–7) | repaired | `README.md:533` "Throughout this layer assume n≥2, k≥3, d≥1, p>k, ℓ≠p, smooth X and smooth leading boundary …"; same openings at `:756`, `:854`. Retest k=3,d=1,n=2,p=5, f=Y₁³+Y₂³−1, x=(1,−1): f₀(x)=0; §5.14 at m=1 has index a+1−4, so a=5, twist −1; §7.2 gives s−2=2, s=4, m+s=5. A residue of the same class remains in Layers 9, 10, 13: S04. |
| pass a F03 (three instruction Checks) | repaired for the three; class partly repaired | `README.md:841` (rank 0 at m=d, −n at m=d+1), `:1008` (cd 1+1=2), `:1286` (−2811 versus −4). Other Checks of the same kind remain: S05. |
| pass b F01 ("Part II" without a base) | not repaired | The repair report lists it under "Unresolved". Re-raised as S01. |
| pass b F02 (gap:ecf-character-fourier duplicates an owner) | repaired, by a different owner | `README.md:57` "Consume §2.2, *Character sheaves*, and §2.5, *Artin–Schreier sheaves* …" (FourierDeligneTransform); the gap paragraph is gone from the README. FourierDeligneTransform §§2.2, 2.4, 2.5 at its head state the tensor law, pullback, ψ∘Tr base extension, trace and RΓ_c=0. The slug is still in `design/plan.json`: S06. |
| pass b F03 (gap:ecf-one-variable-fourier) | repaired | `README.md:648` derives the one-variable input from FourierDeligneTransform §§2.8, 5.3; recomputed below (row §5.8). |
| pass b F04 (𝔰𝔬₄) | repaired | `README.md:821` "orthogonal dimensions 3, 4 or 5 (𝔰𝔬₃≅𝔰𝔭₂, 𝔰𝔬₄≅𝔰𝔭₂×𝔰𝔭₂, 𝔰𝔬₅≅𝔰𝔭₄), and 𝔰𝔬₆≅𝔰𝔩₄ is not symplectic". |

New material introduced by the repairs (§§1.2–1.5, §3.4a, the §5.8 route, §8.10 through Lang–Weil, `polarCount` through `fwdDiff`, the renumbered AlgebraicTopologyPartII and EtaleDualityAndPerverseSheaves citations) was recomputed; the one error it introduced is S02 (a "not statable" reason that the moved Mathlib pin made false).

## S01 (P2) — "Part II" of a base roadmap that exists nowhere

Re-raised: RT pass b F01 (round 1), listed as "Unresolved" in the repair report.

Location: `README.md:1` ("# Roadmap: exponential sums and the circle method, part II"), `Suggested.lean:6` and `:44` (namespace), the folder name, merge-order line 395.

Claim: the roadmap extends an existing roadmap `ExponentialSumsAndCircleMethod`.

Witness: `roadmaps list` (438 heads) and `roadmaps grep --fixed 'ExponentialSumsAndCircleMethod'` return only this pull request; nothing on main (`TauCetiRoadmap/`, `Completed/`), among the board packages, or in the merge order. The Summary names no base and no point where one stops.

Why the repair report's reason fails: "the folder name is fixed by this job" is a limit on the repair worker, not a refutation. The published folder, title and namespace still assert a base.

Repair (needs a maintainer decision, the repair worker cannot rename): either rename to `ExponentialSumsAndCircleMethod` (folder; `README.md:1` → "# Roadmap: exponential sums and the circle method"; `Suggested.lean:6` → "# Exponential sums and the circle method: target signatures"; `Suggested.lean:44`, `:157` → `TauCetiRoadmap.ExponentialSumsAndCircleMethod`; merge-order line), or open the base roadmap first and add to the Summary one sentence naming it and the section where it stops.

## S02 (P2) — The end-winding headline is declared not statable for a carrier the pin has

Location: `Suggested.lean:26–29`: "End winding, the compact-open double-loop obstruction … lack the space of continuous maps from the complex projective line to the projective closure of `X` with prescribed germ at infinity, its topology and local lifts"; `README.md:7` ("the two end theorems that are statable there").

Claim: §§11.9–11.12 cannot be stated at the pins because the mapping space and its topology are missing.

Witness: Mathlib at the pin `1b1ccf4b` has `Projectivization.instTopologicalSpace` (`Mathlib/Topology/Algebra/Projectivization.lean:44`), `OnePoint.equivProjectivization` (`Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean:84`), `Projectivization.rep`/`mk`, compact-open `C(X, Y)`, `FundamentalGroup` and `GenLoop`. The round-1 check ("no topology on `Projectivization`") was made at the old pin `6b7abb3c`. What remains to supply is the germ condition of §11.1, a predicate with a real body. §13.2 does still lack singular and compact-support cohomology of the mapping scheme.

Repair: state the §11.11 headline with three definitions on native carriers and split the docstring bullet. Draft (not elaborated in this read-only pass; the repair worker elaborates it and compares with §11.1; computed on the instance below):

```lean
open scoped LinearAlgebra.Projectivization

/-- Projective closure `Σ_{j<n} w_j^k = w_n^k` of the affine Fermat hypersurface; the last
coordinate is the homogenizing one (README §11.6). -/
def fermatClosure (n k : ℕ) : Set (ℙ ℂ (Fin (n + 1) → ℂ)) :=
  {P | ∑ j : Fin n, P.rep j.castSucc ^ k = P.rep (Fin.last n) ^ k}

/-- A prescribed-germ map (README §11.1): finite points go to the affine part, `∞` goes to
`[x : 0]`, and near `∞` some homogeneous lift is `(x + O(|z|), z^d + O(|z|^(d+1)))`, `z = 1/T`,
with radius and constant depending on the map. -/
def IsPrescribedGermMap (n k d : ℕ) (x : Fin n → ℂ)
    (F : C(OnePoint ℂ, ℙ ℂ (Fin (n + 1) → ℂ))) : Prop :=
  (∀ p, F p ∈ fermatClosure n k) ∧
  (∀ T : ℂ, (F (T : OnePoint ℂ)).rep (Fin.last n) ≠ 0) ∧
  (∃ h, F OnePoint.infty = Projectivization.mk ℂ (Fin.snoc x 0) h) ∧
  ∃ ε > (0 : ℝ), ∃ C : ℝ, ∀ T : ℂ, ε⁻¹ < ‖T‖ → ∃ (w : Fin (n + 1) → ℂ) (hw : w ≠ 0),
    F (T : OnePoint ℂ) = Projectivization.mk ℂ w hw ∧
    (∀ j : Fin n, ‖w j.castSucc - x j‖ ≤ C * ‖T‖⁻¹) ∧
    ‖w (Fin.last n) - T⁻¹ ^ d‖ ≤ C * ‖T‖⁻¹ ^ (d + 1)

/-- **End winding** (README §11.11). For the cubic Fermat hypersurface in `ℂ⁴⁰`, `d = 2` and
`x = (1, ζ, 0, …)` with `ζ³ = -1`, the compact-open prescribed-germ space has a point whose
fundamental group surjects onto `ℤ`. -/
theorem prescribedGerm_fundamentalGroup_surjective (ζ : ℂ) (hζ : ζ ^ 3 = -1) :
    ∃ g : {F // IsPrescribedGermMap 40 3 2 (fun j => if j.val = 0 then 1 else if j.val = 1 then ζ else 0) F},
      ∃ φ : FundamentalGroup _ g →* Multiplicative ℤ, Function.Surjective φ := by
  sorry
```

Instance: g=(T²,ζT²,1,0,…) has lift w=(1,ζ,z²,0,…,z²): |w₃−x₃|=|z|²≤|z| for |z|≤1 and w_last−z²=0, so C=1, ε=1; F_s equals g for |T|≥1/(2s)−1 (s>0, where r(T)≤s/2) and F₀=g, so each F_s satisfies the predicate with ε depending on s; v(F_s(R))/v(g(R))=σ(s,r(R))⁻¹ winds −1. Replace the docstring bullet by: "The trace-pairing counterexample (§13.2) lacks singular and compact-support rational cohomology of the mapping scheme and the comparison with `ℓ`-adic cohomology; the comparison with `Ω²X` as a non-equivalence (§11.12) is implied by the stated end-winding theorem and AlgebraicTopologyPartII §5.4." Update `README.md:7` and the Summary to name the third stated theorem and the two new definitions (§§11.1, 11.6). If the worker judges the germ predicate too long an encoding, the bullet must still stop claiming that the mapping space and its topology are missing and name the germ predicate alone.

## S03 (P2) — §6.5: the Goursat step uses group-theoretic inputs with no owner, and needs O, not SO

Location: `README.md:821–823`: "The symplectic and orthogonal Lie algebras then have no common nonzero simple quotient … The algebraic-group Goursat argument gives the product, since the connected symplectic group has no nontrivial finite algebraic quotient." *Needs:* §6.3; §6.4; EtaleDualityAndPerverseSheaves §4.7; LefschetzPencilsAndVanishingCycles §§5.1, 5.8, 5.10.

Claim: the route proves that the monodromy closure is the full product and contains (−Id,−Id).

Witness: three inputs appear in no layer, supplier section or pinned citation: (i) Goursat's lemma (it exists: `Subgroup.goursat`, `Mathlib/GroupTheory/Goursat.lean:131`, not cited); (ii) the closed normal subgroups of Sp_{N₂} and of O_{N₁} over E; (iii) non-isomorphism of the quotients. `roadmaps grep -i goursat` finds only the PGL₂ case of ArithmeticGaloisRepresentations. Also, at (k,n₁)=(4,3) N₁=21 is odd and −Id∉SO₂₁, so the route needs closure O_{N₁}; the text says only "take Zariski closure".

Repair: add to the *Needs:* line "`Subgroup.goursat`", and replace the three sentences from "The symplectic and orthogonal Lie algebras then …" to "… no nontrivial finite algebraic quotient." by: "The orthogonal closure is the whole O_{N₁}: it contains SO_{N₁} by the open alternative and a reflection by Picard–Lefschetz (§5.10 of the supplier generates the image by reflections). Prove here, over an algebraically closed field of characteristic zero: a closed normal subgroup of Sp_{2g} is 1, {±1} or Sp_{2g}, and for N≥7 a closed normal subgroup of O_N is 1, {±1}, SO_N or O_N. Apply `Subgroup.goursat` to the closure G⊂O_{N₁}×Sp_{N₂}: Sp_{N₂}/(G∩Sp_{N₂})≅O_{N₁}/(G∩O_{N₁}). If G∩Sp_{N₂}⊂{±1}, the left side is connected of dimension N₂(N₂+1)/2, so the right side is O_{N₁} modulo 1 or ±1, of dimension N₁(N₁−1)/2, forcing N₁=N₂+1; but N₁−N₂=(k−1)((k−1)^(n₁)−(k−1)^(n₂)+2)/k is never 1 for k≥3, since k−1 does not divide k. Hence G⊃Sp_{N₂}, and G is the product." Add the Check: "For (k,n)=(4,3): N₁=21, N₂=6 (a plane quartic, genus 3), dimensions 210 and 21; N₁ is odd, so −Id has determinant −1 and lies in O₂₁ but not SO₂₁." Tested: (k,n)=(3,5): n₁=5, n₂=4, N₁=22, N₂=2(2⁴−1)/3=10, N₁−N₂=12≠1; (4,3): 21−6=15≠1. The dimension count replaces the list of low-rank coincidences and the unowned comparison of B and C types (which have equal dimension exactly when N₁=N₂+1).

## S04 (P3) — "main hypotheses" is used where Conventions promises explicit ones

Location: `README.md:21` "these are the main hypotheses, and each target names the ones it uses"; `:1158` "Under the main finite-field hypotheses"; `:1173` "main hypotheses fixed"; `:1304` "Under the main geometric hypotheses"; `:1661` "the main degree/geometric hypotheses".

Claim: each target states its hypotheses.

Witness: §9.4 does not say whether ℓ has even order modulo p (it must: §9.2 uses §8.6), nor d≥k−1; §10.8 does not say that no condition on ℓ is assumed. The Lean `mapping_geometrically_irreducible` has to be compared with a list the README never writes at §10.8.

Repair: §9.4: "Let k≥3, d≥k−1, n>2ᵏ(k−1), p>k, ℓ≠p of even order modulo p, X and Z smooth, and x≠0 with f₀(x)=0." §9.5: "with k≥3, d≥k−1, n>2ᵏ(k−1), p>k, ℓ of even order modulo p, X and Z smooth, x≠0 with f₀(x)=0, and E, ψ as in Conventions". §10.8: "Let K have characteristic zero or >k, k≥3, d≥k−1, n>2ᵏ(k−1), X and Z smooth and x≠0 with f₀(x)=0; no condition on a coefficient prime is assumed." §13.1: "For K=ℂ, k≥3, d≥k−1, n>2ᵏ(k−1), X and Z smooth, x≠0 with f₀(x)=0". Tested on k=3,d=2,n=40: all four lists hold and agree with the binders of the Lean headline (`hk`, `hd`, `hchar`, `haff`, `hinfty`, `hx`, `hinc`, `hn`).

## S05 (P3) — Remaining Checks that are instructions or restatements

Location and repair (each replacement computed):

- `README.md:487–488` (§4.5: "Monicity removes scalar ambiguity."; "Uniqueness is asserted on the exact rank stratum and only in the stated m-range."). Both hold for any wrong range. Replace the second by: "For L=3, m=2>L/2 and b=(1,0,1): H₁=[[1,0],[0,1]] has rank 2, so b∈A₂∖A₁, and for every p the pair h₁=T+p, h₂=T²+pT−1 satisfies h₁/h₂=T⁻¹+T⁻³+O(T⁻⁴); uniqueness fails above L/2. For L=4, m=1, b=(1,0,0,0) the only triple is (1, 1, T): h₂=T−a gives the T⁻² coefficient a, which must vanish." (Check: (T+p)/(T²+pT−1)=T⁻¹(1+pT⁻¹)(1−pT⁻¹+(1+p²)T⁻²+…)=T⁻¹+0·T⁻²+T⁻³+….)
- `README.md:610` (§5.5: "Do not multiply the numerator names in place of l₁l₂."). Replace by: "For l₁=T, l₂=T−1 and h₁=h₂=1 the numerator is h₁l₂+h₂l₁=2T−1, and 1/T+1/(T−1)=(2T−1)/(T(T−1)); the product h₁h₂=1 would give 1/(T(T−1))."
- `README.md:1007` (§8.4: "Do not replace extended addition with a natural-number maximum."). Replace by: "For G=a, N=1: cd_ψ(G)=cd_ψ(−G)=−∞ and G(a)−G(b)=a−b is a nonzero linear form with cd=−∞=(−∞)+(−∞); a convention sending −∞ to 0 would assert H_c⁰≠0."
- `README.md:1166` (§9.4: "Keep the remainder term 4(r+1)."). Replace by: "For k=3, d=4, n=24: B(4)=192−24+20=188 (r=0) and B(5)=192−24+24=192 (r=1); dropping 4r would give 188 for both."
- `README.md:1494` (§11.8: "Apply this to K=S¹ and K=I×S¹."). Replace by: "For the escaping loop (K=S¹), x₁=a_s(T)≠0 for every T≠0, so the chart x₁≠0 holds on the common tail T≠0 for all s, while v/z^d=σ⁻¹ equals −1 at s=3r(T)/2: |v/z^d−1|=2."
- `README.md:1701` (§13.3: "Use compact-support cohomology on the algebraic side."). Replace by: "For Mor=𝔸^D the j=0 pairing uses H_c^(2D)=ℚ; ordinary H^(2D)(𝔸^D)=0 would make it zero."

## S06 (P3) — Ten gaps of `design/plan.json` are no longer contracts of the README

Location: `design/plan.json`, top-level `gaps` (12 slugs); `README.md:49`, `:79` (2 slugs).

Claim: the plan's gaps are the roadmap's declared supplier contracts.

Witness: the README at this head declares only `gap:sf-fibre-strata` and `gap:lpv-universal-monodromy`. The other ten remain in the plan; `ecf-character-fourier` asks EtaleCohomologyFoundations for L_ψ, which FourierDeligneTransform §§2.2–2.5 states; `symmetric-lattice-shrinking` names "FunctionFieldLatticesAndShrinking, FL.4", which does not exist in GeometryOfNumbersAndQuadraticArithmeticPartII; the six `at2-*` and `edc-top-components` are stated by their suppliers at their heads.

Repair: delete from the plan's `gaps` the slugs `ecf-character-fourier`, `edc-top-components`, `ecf-one-variable-fourier`, `symmetric-lattice-shrinking`, `at2-arrangement-cohomology`, `at2-stable-diagonal`, `at2-tame-polynomial`, `at2-tame-bouquet`, `at2-double-loop-betti`, `at2-fermat-loop-connectivity`, so that plan and README agree on two; withdraw their announcements on the suppliers' jobs.

## Adversarial mathematics pass

Conventions: b is one-based in the README (`b r` = b_{r+1} in Lean); Δ_yG(a)=G(a)−G(a+y)=−`fwdDiff y G a`; Q=#K. "holds" means the computed values agree with the statement as written.

### Suggested.lean declarations (no `variable` block; every binder is in the signature)

| Declaration | Context | Instances and values | Result |
| --- | --- | --- | --- |
| `mappingPolynomial` (§3.1) | `[Field K]`, `{n}`, d, x, j | d=3: x_jT³+a₂T²+a₁T+a₀; d=0: empty sum, x_j | holds |
| `mappingEquation` (§3.1) | same, f | f=Y₁, d=1, x=1: T+a₀; f=0: 0; f=1: 1 | holds |
| `mappingIdeal` (§3.1) | same | f=Y₁: (a₀,1)=⊤; f=0: ⊥; f=1: ⊤; every coefficient spanned, leading f₀(x) included | holds |
| `residuePhase` (§3.4) | k, d, f, x, b: Fin(kd)→K, a | f=Y₁³−Y₂³+1, d=1, x=(1,1): b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c); b=0: 0 | holds |
| `hankelMatrix` (§4.1) | `{K : Type*}` only | L=9,m=4,b₅=1: 5×5 anti-identity, det +1 (10 inversions), rank 5; m≥L: Fin 0 rows; index i+j≤L−1 | holds |
| `polarCount` (§8.8) | `[Field K]`; `Nat.card` of a subtype | foldr gives `fwdDiff (y 0) (fwdDiff (y 1) ⋯)`; k=3,n=1,d=2,b₄=1 over 𝔽₅: 225; b=0: 625; infinite K: 0 (junk, headline has `[Finite K]`) | holds |
| `minor_arc_polar_count` (§8.9) | `[Field K] [Finite K]`, 8 hypotheses | brute force, n=1, f₀=Y^k: 𝔽₅,k=3,d=2, all 15625 b with rank H₂>2: max N/bound 225/250; 𝔽₇ (3000 b): 637/686; 𝔽₅,k=3,d=3 (1509 b): m=3 2025/6250, m=4 729/1250; 𝔽₅,k=4,d=3 (52 b): m=3 953125/1171875, m=4 353125/1171875, m=5 113125/1171875; no violation. m=kd/2: rank ≤ m always, vacuous. n=0: `totalDegree`=0≠k, vacuous. Exponent: h≤kd/(2(k−1))≤d, no truncation | holds |
| `mapping_geometrically_irreducible` (§10.8) | `[Field K] [IsAlgClosed K]`, 10 hypotheses | n=40,k=3,d=2: 16<40; (2:ℚ)<1·(40/8−3+1)=3; conclusion dim 74. n=32: δ=2, 2<2 false. d<k−1: (d/(k−1):ℕ)=0, `hrange` false, so `hd` is implied (P3 note, harmless). Empty or reducible zero locus: radical not prime | holds |

### README targets

| Target | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Conventions | 𝔸¹ vs point; |·|; Koszul | degrees 2, 0, traces q, 1; |1|=1,|T|=q,|T⁻¹|=q⁻¹; −1 (n=4), +1 (n=5) | holds |
| 0.1 | two planes in 𝔸³; uv=0 vs diagonal | 1=2+2−3; V∩Z={0}, dim V=1≤2−1 | holds |
| 0.2 | S={0,1}: line∪(0,1); parabola | 3≤1·2+1·1=3≤2·2; 2≤2·2, section x=0 degree 1 | holds |
| 0.3 | xy=0→𝔸¹_x | fibre dims 0, 1; 1+0=1, 0+1=1 | holds; the stratum equality asked of the gap is true (a dominating component has generic fibre dimension e) |
| 1.1 | 𝔽₂[T], h=2; h=0 | 4=2², 16; only 0 | holds |
| 1.2 | M=I; T⁻¹I; N=0 | self-adjoint; adjoint T·Aᴺ; one vector | holds |
| 1.3 | A (N=1), s=0,−1; diag(T⁻²,T), s=−1; basis (1,T),(0,1) | 1, q; q³·1; leading vectors (0,1),(0,1) dependent | holds |
| 1.4 | diag(T,T⁻²) | minima q⁻²,q; adjoint q⁻¹,q² | holds |
| 1.5 | γ=0,a=c=s=1,q=5; γ=T⁻²,a=4,c=1,s=1; γ=T⁻¹,a=c=1; block identity | 5≤5·1; q³ vs q, ratio q²=q^(1+⌊3/2⌋); 1; T^(c−a)Λ^(−T)=JΛJ⁻¹ both [[T^cI,−T^cγ],[0,T^(−a)I]]; R̂_(n+1)²≥q^(c−a) | holds; agrees with BS20 line 2014–2075 |
| 2.1 | p=5; p=3 | 19≡4, 4²=1; 5≡2, order 2 | holds |
| 2.2 | ℓ=2,p=13; ℓ=3,p=5; ℓ=5,p=17 | 2⁶≡−1; 3∉{1,4}; 5∉{1,2,4,8,9,13,15,16} | holds |
| 3.1 | f=Y₁,d=1; f=0; f=1; zero algebra | ⊤; ⊥; ⊤; one point | holds |
| 3.2 | n=40,k=3,d=2 | 80−6=74 | holds |
| 3.3 | Y₁(Y₁−1) | leading Y₁², ∂=2Y₁ vanishes on Z: excluded | holds |
| 3.4 | cubic example | as `residuePhase` | holds |
| 3.4a | u(a(y,λ))=u(y); φ=λ; φ=0; φ=tv on 𝔸² | cocycle gives u∘a=u; 0; E[−2](−1); E[−2](−1) on t=0 | holds; agrees with BS20 line 772–800 |
| 3.5 | b=0; p=5,ℓ=2 | E[−2dn](−dn); ord₅2=4 | holds |
| 3.6 | one equation | E[−2L](−L) on the zero locus; shift +2L, twist +L | holds |
| 4.1 | L=3,m=0; L=9,m=4; m=L | b=0; rank 5; no rows | holds |
| 4.2 | b=(1,2,4) | H₁ det 0, rank 1; H₀ rank 1 | holds |
| 4.3 | L=9: m=4,5; L=0 | rank 5>4; 4 rows≤5; full | holds |
| 4.4 | α=0; b=(1,2,4) | (0,1); 1/(T−2)=T⁻¹+2T⁻²+4T⁻³ | holds |
| 4.5 | L=3,m=2,b=(1,0,1); L=4,m=1,b=(1,0,0,0) | one-parameter family above L/2; unique (1,1,T) | holds; Checks: S05 |
| 4.6 | m=0; c/(T−a) | (0,1); b_r=ca^(r−1) | holds |
| 4.7 | m′≤m | m′+m′+(m−m′)≤2m | holds |
| 5.1 | translation λT^(d−m)h₂e_j | linear term order −L−1+m+(d−m)+(k−1)d=−1, coefficient err·∂_jf₀(x)≠0; quadratic term order −1−m+m′<−1 | holds |
| 5.2 | xT²+a₁T+a₀ by T−b | quotient xT+(a₁+xb), remainder xb²+a₁b+a₀ | holds |
| 5.3 | m=0; h₂=T−a | E; phase h·f(g(a)) | holds |
| 5.4 | m=d; one coordinate | (0,0); shift −2, twist −1 | holds |
| 5.5 | l₁=T,l₂=T−1 | 2T−1 | holds; Check: S05 |
| 5.6 | (T−a)² | two translations, f≠0 at critical points off X | holds |
| 5.7 | 𝔸^(n−1); two copies | 0; one top class kept | holds |
| 5.8 | g=a; g=a²; g=0; g=a^p−a; g_*E | rank 0; rank 1; H_c⁴=E(−2); H_c²=E(−1); g_*E is a middle extension (inertia orbits = fibre points), G=g_*E/E has H⁰=H_c²=0 at t=0 and by §2.8 at t≠0, NFT(E)=0 (FourierDeligneTransform §5.3 Check), H_c¹(pt)=0 so H_c²(𝔾_m,F)≅H_c²(𝔸¹,NFT G)=0; totals 2+2(n−1)=4+2(n−2)=2n | holds |
| 5.9 | cubic in 𝔸³ | rank 8=2³ in degree 2+2=4 | holds |
| 5.10 | m=0,1 | E; no action | holds |
| 5.11 | m=0 | E[−2nd](−nd) | holds |
| 5.12 | plane cubic, n=2 | H_c⁰=0, dim H_c¹=4, H_c²=E(−1) | holds |
| 5.13 | dim V=2, m=2 | Λ² dim 1 (n=4), Sym² dim 3 (n=5) | holds |
| 5.14 | degree bookkeeping | a−2m−2n(d−m)−m(n−1)=a+m(n−1)−2nd | holds |
| 6.1 | x=(1,ζ,0,…) | f₀(x)=1+ζᵏ=0 | holds |
| 6.2 | relative top trace | E(−(n−1)) | holds |
| 6.3 | Fermat cubic over 𝔽₂₅ | 27 lines rational (25≡1 mod 3); 801−651=150=6·25; 6+10=16=2⁴ | holds |
| 6.4 | n=2; n=k=3 | three 𝔾_m; connected 𝔾_m-bundle | holds |
| 6.5 | (3,3),(4,3),(3,5) | N₁=6, 21, 22; N₂=6 at (4,3), 10 at (3,5) | statement holds; route: S03 |
| 6.6 | m=d, d+1 | 0; −n | holds |
| 7.1 | two stages | d₁ from the closed stratum m to the open stratum m+1, bidegree (1,0); filtration by H_c(Y∖Y_(m−1)) decreasing, as BS20 line 553–557 | holds |
| 7.2 | m=0; k=3,d=1,n=2,m=1 | total degree 2nd; s=4 | holds |
| 7.3 | Fermat point | fibre formula | holds |
| 7.4 | p=7,ℓ=2 | ord₇2=3; eigenvalues (−1)^m vs (−1)^(m+r) | holds |
| 7.5 | (0,0); n=40 | E(L−nd)=E(−D)=E(−74) | holds |
| 8.1 | G=a²,k=2,3; k=1 | y=0; all pairs, dim 2N; point / empty | holds |
| 8.2 | constant; linear; H^p−H | 2N; −∞; 2N | holds |
| 8.3 | order even ⇔ −1∈⟨ℓ⟩ | cyclic group, unique element of order 2 | holds |
| 8.4 | G=a² over 𝔽₅; G=a | 1+1=2; −∞ | holds |
| 8.5 | Spec 𝔽_(q²) | no 𝔽_q-point, a closed point of degree 2 | holds |
| 8.6 | constant; G=a², k=2,3; k=1; induction step | 2N; 1; 2; 2(dd₁+N); max of 2w+(e+c)/2^(k−3) on w≤N, w+e≤dd at w=N | holds |
| 8.7 | Y³; char 3; n equations | Ψ=6uv, 6u²=2!·3u²; Ψ=0; V_Ψ∩Δ={0}, dim≤(k−2)n, degree≤(k−1)ⁿ | holds |
| 8.8 | α=T⁻⁴,k=3,n=1,d=2; α=0 | only be=0: Q²(2Q−1); N₁: ac=0, 2Q−1; equality | holds |
| 8.9 | route; k=3,d=2,m=2 | deg r≤(h−1)(k−1)<m; error ≤Q^(−L−1+m−deg r); −d−(k−1)s=−4=−kd+m; exponent (k−1)ns+(k−2)nh=dn(k−1)−nh | holds; agrees with BS20 line 2083–2128 |
| 8.10 | 𝔸^e; Spec 𝔽_(q²); dual numbers; ∅ | q^(re); 0,2,0,2; 1; 0 | holds |
| 9.1 | scalar cubic | 2Q³−Q²≤2Q³, dimension ≤3 | holds |
| 9.2 | k=3,n=1,d=m=2 | 4−1/2=3.5 | holds |
| 9.3 | L=9; L=12 | m up to 4; up to 5 | holds |
| 9.4 | k=3,d=4,n=24 | B(4)=188, B(5)=192, cutoff 192+8−8=192; printed 188 | holds |
| 9.5 | same | a=190 between 188 and 192 | holds |
| 10.1 | y⁵−y=a | derivative −1 in characteristic 5, 5y⁴−1 over ℂ | holds |
| 10.2 | k=3,d=2,n=40 | j>156, i>−4, 2dn−2L=148=2D | holds |
| 10.3 | tδ=3; tδ=1 | i>−8 vs i>−4; i>0 | holds |
| 10.4 | m=1 | a=2 only; s from 2−n to 2−n | holds |
| 10.5 | n=40, m=1,2 | [−37,−37], [−75,−74]; −1 in none | holds |
| 10.6 | n=40 | 1−2·38·37=−2811 | holds |
| 10.7 | line⊔point; ∅ | rank 1 but a 0-dimensional component; rank 0 | holds |
| 10.8 | i=0 | no m≥1 with 1−m(n−2)≤0≤−m(n−3); E_∞^(0,0)=E₁^(0,0) | holds |
| 10.9 | gradient; k=n=3,d=1; n=2 | critical point only 0, f(0)=1; family dim 1>D=0; D−d+k−1 as BS20 line 253; 1=0 | holds |
| 10.10 | m>d terms | need i≤−m(n−3)<−d(n−3)≤−4(tδ−1) since 4tδ≤dn/4≤d(n−3) | holds |
| 11.1–11.3 | g=(T^d,ζT^d,1,0,…) | lift [1:ζ:z^d:0:…:z^d] | holds |
| 11.4–11.5 | r=1/4: s=0,3/8,1; s=0 any r | σ=1,−1,1; h=max(0,−1)=0 | holds |
| 11.6–11.7 | power sum; |a_s| | a³(1+ζ³)+1=1; |T|^d, uniform convergence to P | holds |
| 11.8–11.10 | K=I×S¹ | tube lemma at K×{∞}; x₀≠0 on X, v∈ℂ×; based homotopy of loops in ℂ× | holds |
| 11.11 | v=1/a_s | ratio σ⁻¹, winding −1 | holds |
| 11.12 | n=40,k=3 | μ=2⁴⁰; π₃X=0; ℤ quotient vs trivial π₁ | holds |
| 12.1–12.2 | w=1.1; w=−1; convexity | not 1+O(|z|); deviation 2; (1−tχ)|w−1|<1/2 | holds |
| 12.3 | constant β; X=S² | fibre Map_*(S²,X); π₀=ℤ | holds |
| 12.4–12.5 | escaping loop | deviation 2 at s=3r(R)/2: not an instance | holds |
| 13.1 | j range | 0≤j<4(tδ−1), as BS20 line 2159–2172 | holds |
| 13.2 | n=40,d=2 | D=74, tδ=3, i=−1>−4, H_c¹⁴⁷=0, H¹(Hco,ℚ)≠0, j=1<8 | holds |
| 13.3 | j≤d(n−3) | 8≤74 | holds |

## Verified sound

- Declarations read: 8 of 8, each compared with its elaborated type in the supplied signature log; 0 lost binders (the file has no `variable` block). No `lemma`, `set_option`, `#eval`, `True` placeholder, sorry'd data or `example`. The header is `module` / `public import Mathlib` / `@[expose] public section`, the form 61 of the 171 `Suggested.lean` files on main use; the gate accepts it.
- Headlines: uniform polar count (§8.9) and conservative irreducibility (§10.8) are stated; the finite-grid and box bounds (§§0.2, 1.1) and the cohomological headlines are correctly declared not statable (no geometric degree of an algebraic set and no ℓ-adic constructible category in Mathlib `1b1ccf4b` or Tau Ceti `2fd255d`, by grep). The end-winding headline is S02. The six definitions are all used by the two theorems; no padding.
- Targets read: 94 of 94; each has a locator and a *Needs:* line (94 lines).
- Locators verified: 56 line locators (48 BS20, 4 LR14v2, 1 BV15, 3 STACKS), plus the BS20 line ranges 2009–2075 and 2076–2128. BS20: all 48 line locators land on the cited printed pages; statements read at Theorem 1.1, Conjecture 1.3, Corollary 1.4, Remark 1.5, Remark 2.2, Definition 2.3, Lemma 2.4(1)–(5), Propositions 2.5, 2.6, Theorem 2.7, Lemmas 3.2, 3.7, 3.8, 4.3, 4.4, Definitions 5.1, 5.2, Lemma 5.3, Proposition 5.5 and the end of its proof, Lemma 5.6, Propositions 5.7, 5.8, the proof of Proposition 2.6, Lemma 6.4 with proof, Proposition 6.2 with proof, (7.1), Conjecture 7.1, Lemma 7.2. LR14v2 lines 124, 144, 226, 231. BV15 line 530. STACKS line 4237 (05F9, More on Morphisms) and, in the Homology chapter fetched through the sources service, lines 2964 (012K) and 3202 (0BK5).
- Checks tested: the Checks and Examples of all 94 targets were read, and those with a computable value were recomputed in the 87 target rows (some cover a run of consecutive targets) and 8 declaration rows above (one to four instances per row); none false; six instruction or restatement Checks: S05. Every definition has at least three Checks.
- Sibling citations checked at the current copies (21 groups): FourierDeligneTransform Conventions, §§2.2, 2.4, 2.5, 2.8, 3.4, 5.3 (open head; earlier in the merge order, line 70); EtaleDualityAndPerverseSheaves §0.4 bold target *Top-degree compactly supported cohomology of a variety* (inside the section "The general flat trace and its multiplicities"), §§0.6, 3.2–3.8, 4.1, 4.3, 4.6, 4.7; SieveMethodsAndPrimePatterns §5.4 *Uniform algebraic point counts*; AlgebraicTopologyPartII §§2.1, 3.5, 4.1, 4.2, 5.1, 5.4 with the hypotheses the README restates (n≥4, d(n−3)≥j, ε_n; n≥5, k_i≥1); InverseGaloisAndArithmeticFundamentalGroups IG.5.1 (the algebraic unit-difference scheme and S_n-torsor are in the target), IG.5.7 bold target, IG.0.T4; DeligneWeightsAndPurity §§8.1, 8.8; LefschetzPencilsAndVanishingCycles §§5.1, 5.8, 5.10; SchemeAndStackFoundations §§0.2, 0.3, 0.7–0.9, 5.12 on main and unchanged in number at its open revision; EtaleCohomologyFoundations, AlgebraicTopology, DGFloer, ClassicalArithmeticCompletion as in round 1 (the resolver and the overlap list report no dropped id).
- Declared gaps: `gap:sf-fibre-strata` is precise and not provided (SchemeAndStackFoundations §0.7 has semicontinuity on the source and the dominant fibre formula only); `gap:lpv-universal-monodromy` is precise and not provided (§5.10 gives open-or-finite). Plan/README mismatch: S06.
- Pinned declarations: all 17 Mathlib and 2 Tau Ceti citations open at the cited file and line.
- Duplication by object: no Hankel-rank arcs, function-field successive minima, polar counts or prescribed-germ spaces at the pins (Tau Ceti's Hankel declarations are analytic operators and positive-semidefinite moment matrices; its successive minima are for ℤ-lattices) or in another roadmap; `Suggested.lean` reuses no fully qualified name of a readable roadmap.
- Policy: `git diff --stat origin/main...HEAD` outside the folder is empty; no pull-request number or process narrative in the README or docstrings; no computational algorithm.
- Dependency gate, complete output: `depcheck: 235 roadmaps, 2132 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).

## Not verifiable

- Lean elaboration, including the S02 draft: no Lean command is permitted in this pass.
- The étale-cohomological routes of §§5.10, 6.2–6.6, 7.1–7.4, 8.6, 9.2 were checked against BS20's statements and on instances, not re-proved.
- The Katz citation behind BS20 line 1165–1167 is not in the cache; the README's replacement route through FourierDeligneTransform §§2.8, 5.3 was checked instead.
- Lee's thesis (Lemma 3.3.5, quoted at BS20 line 2064) is not in the cache; §1.3 proves the count directly and was recomputed.
- Ownership against open pull requests was checked through the brief's index of 438 heads and the listed checkouts only.

## Source issues

- **Error** in BS20 at proof of Proposition 2.6, printed p. 934: a sufficient bound with 4(m+1) is replaced by the smaller one with 4(k−1)⌊m/(k−1)⌋+4, weakening it; it should keep the remainder, giving cutoff 2dn+4(k−1)−4⌊d/(k−1)⌋(n/2ᵏ−k+1); affects a stated result.
- **Misprint** in BS20 at proof of Proposition 2.6, printed p. 934: the last stratum index is ⌊kd/2⌋−1, omitting one stratum when kd is odd; it should be ⌈kd/2⌉−1; affects the proof.
- **Error** in BS20 at Lemma 7.2, printed pp. 940–941: with pointwise germ condition (7.1) and the compact-open topology the space is asserted homotopy equivalent to Ω²X; it should require uniform germ control on compact families, since a Fermat loop has end winding −1; affects a stated result.
- **Misprint** in BS20 at §6, definition of a lattice before Lemma 6.4, printed p. 937: the coefficient vector u runs over 𝔽_q[T]ⁿ for an N×N matrix; it should be 𝔽_q[T]ᴺ; affects nothing.
- **Misprint** in BS20 at proof of Lemma 6.4, printed p. 938: the second count is written with indices a−s, c−s; it should be a−s, c+s, as in the statement; affects nothing.
- **Misprint** in BS20 at proof of Lemma 3.7, printed pp. 917–918: the generic variables are listed as a₂,…,a_(n−1); it should be a₂,…,a_n; affects nothing.
- **Error** in LR14v2 at Lemma 2.6, v2 p. 5: for an affine nondegenerate variety meeting a hyperplane the section is said to have the same degree; it should be at most the degree (parabola y=x², x=0); affects the proof.
