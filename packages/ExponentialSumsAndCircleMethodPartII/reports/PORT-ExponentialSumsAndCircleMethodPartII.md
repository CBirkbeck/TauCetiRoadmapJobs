# Port report: ExponentialSumsAndCircleMethodPartII

- Branch: `roadmap/exponential-sums-and-circle-method-part-ii`
- Head commit: `d01cb8fc11dea14770b0f6de840ad6c3db3917da` ("ExponentialSumsAndCircleMethodPartII: roadmap (README, Suggested.lean, metadata)"), on base `4ec889e`.
- Files: `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/README.md` (1722 lines, 94 numbered targets), `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/Suggested.lean` (157 lines), `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/metadata.toml` (`topic = "math.NT"`, same one-key form as the folders on main). Nothing outside the folder is touched.

## Checks

Build (`lake build TauCetiRoadmap.ExponentialSumsAndCircleMethodPartII.Suggested`, clean file at the head):

    Build completed successfully (18239 jobs).

Warnings: 2, both `declaration uses sorry` (`Suggested.lean` lines 109 and 135). The first build with the package's plain `import Mathlib` header produced a third warning ("imports `Mathlib` ... designed for use with the module system"); the file now uses `module` / `public import Mathlib` / `@[expose] public section`, as most roadmaps on main do, and that warning is gone.

Gate (`gate ... --base origin/main`, run on the committed tree):

    gate ExponentialSumsAndCircleMethodPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

(Before the commit the gate reported `statement-hygiene=2`, `[Fintype K]` beside `[Field K]` in `polarCount` and `minor_arc_polar_count`; fixed by `[Finite K]` and `Nat.card`, see below.)

Dependency direction (`gate --depcheck ... --movable`), complete output:

    depcheck: 234 roadmaps, 2119 edges, 0 problem(s)

No UPWARD, CYCLE or moved line.

Citations (`roadmaps resolve` on the new README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The four leads of the package (AlgebraicTopologyPartII AT2.2–AT2.5) are gone: those ids are now the actual section numbers of AlgebraicTopologyPartII at its head (§§2.1, 3.5, 4.1, 4.2, 5.1, 5.4). Library names were checked by hand at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d`; the tool had no pinned packages).

Signatures: all eight declarations were elaborated with `#check @name` (appended temporarily to `Suggested.lean`, built with the permitted build command, then removed; the clean file was rebuilt). The file has no `variable` block, so no section binder can be lost; every elaborated type matches its README statement (§§3.1, 3.4, 4.1, 8.8, 8.9, 10.8). Changes against the package: `iteratedPhaseDifference` removed; `polarCount` now takes only `[Field K]` and is a `Nat.card` of a subtype; `minor_arc_polar_count` takes `[Finite K]` and bounds by `Nat.card K ^ …` instead of `[Fintype K]`/`Fintype.card K`. The two headline types are otherwise unchanged.

## Draft pull request body

This roadmap builds the geometric circle method of Browning and Sawin for spaces of polynomial maps of degree d with a fixed leading vector from the affine line to a smooth affine hypersurface X⊂𝔸ⁿ of degree k with smooth leading form. It constructs the finite-field Fourier complex of the mapping scheme, its major-arc filtration by Hankel rank and the signed configuration first page of the resulting spectral sequence, proves a geometric Weyl-differencing bound and a polar point count uniform over all finite constant-field extensions (with the function-field lattice shrinking it needs), and deduces a conservative minor-arc vanishing range, the comparison with compact-support cohomology of the mapping scheme, and the end theorem that the mapping scheme is geometrically irreducible of the expected dimension d(n−k) whenever tδ>k−1. The roadmap keeps BS20's sharper printed range as an explicit hypothesis, because the printed stratification argument only supports the conservative one, and it shows by an explicit end-winding loop that the compact-open space of maps with prescribed germ at infinity is not homotopy equivalent to Ω²X; the comparison with Ω²X and the degeneration statement are therefore stated under an explicitly specified stronger topology and a conjectural perfect trace pairing. `Suggested.lean` states the two headline theorems that are statable at the pins, the uniform polar count and conservative irreducibility, on native polynomial, matrix and finite-function carriers.

## Roadmaps this one depends on that are still pull requests

FourierDeligneTransform (a draft), EtaleDualityAndPerverseSheaves, InverseGaloisAndArithmeticFundamentalGroups, DeligneWeightsAndPurity, LefschetzPencilsAndVanishingCycles, AlgebraicTopologyPartII, SieveMethodsAndPrimePatterns. All are earlier than this roadmap in the merge order. On main: SchemeAndStackFoundations, EtaleCohomologyFoundations, AlgebraicTopology, DGFloer, ClassicalArithmeticCompletion (the last cited only to distinguish §4.4). GeometryOfNumbersAndQuadraticArithmeticPartII is no longer a dependency (see below).

## What moved from the Lean to the README

- `iteratedPhaseDifference` (a private alternating-sum difference operator) is deleted from `Suggested.lean`. `polarCount` now composes Mathlib's `fwdDiff` (`Mathlib/Algebra/Group/ForwardDiff.lean:40`) over the k−1 increments. Its content is kept in README §8.1: the alternating-sum expansion with the +1 empty-subset coefficient, and the statement that the `fwdDiff` composite is (−1)^(k−1) times Δ_(y₁)⋯Δ_(y_(k−1)), which does not affect the constancy condition. Check: for k=3 the scalar cubic test still gives 225 ≤ 250 over 𝔽₅ (the constancy set is sign-independent).
- Nothing else moved; the package file was already headline-only (two theorems and the definitions they need).

## Supplier replacements and duplication removals

1. **gap:ecf-character-fourier → FourierDeligneTransform.** FourierDeligneTransform §§2.2–2.5 own L_ψ with its tensor, pullback, base-extension, coefficient-change and trace laws and RΓ_c(𝔸¹,L_ψ)=0, and its §3.4 owns Fourier orthogonality on a vector bundle. The gap paragraph is deleted; Needs lines of §§3.5, 3.6, 5.1, 5.3, 5.6, 8.2 and the layer Dependencies cite FourierDeligneTransform. The 𝔾_a-equivariant cancellation lemma (BS20 Lemma 3.2), which no roadmap states, is now a target here, §3.4a, with its proof route from FourierDeligneTransform §§2.4–2.5 and compact Künneth, and three Checks (u=1 line; trivial action, u=0; φ=tv on 𝔸², where u vanishes on a line and RΓ_c=E[−2](−1)). The red-team lead that CongruenceSpectralGap §4.2b owns L_ψ is outdated at its head: CongruenceSpectralGap now consumes L_ψ from a DeligneWeightsAndPurity contract. FourierDeligneTransform is the earliest roadmap whose scope claims the object.
2. **gap:ecf-one-variable-fourier → FourierDeligneTransform §§2.8 and 5.3.** The one-variable input of §5.8 (H_c^i(𝔾_m×𝔸¹,L_ψ(hg(a)))=0 for i>2 when 1≤deg g<p) is now derived in §5.8's route: §2.8 puts the a-fibre in degree 1 with rank e−1; the trace splitting g_*E=E⊕G makes G a Fourier sheaf in the sense of §5.3; the restriction of the naive transform of G to 𝔾_m is the fibre sheaf; and a Fourier sheaf's transform has no H²_c. Checked on g=a² (fibre sheaf a Kummer-type rank-one sheaf with nontrivial tame monodromy, total complex zero, total trace Σ_{h≠0}Σ_a ψ(ha²)=0) and g=a (rank 0).
3. **gap:edc-top-components → EtaleDualityAndPerverseSheaves §0.4.** Its target *Top-degree compactly supported cohomology of a variety* gives vanishing above 2a and H^(2a)_c free on the a-dimensional components for singular and nonreduced varieties, with ℤ/ℓᵐ coefficients; EtaleCohomologyFoundations §F.4.5 carries this to E. §10.7's route and Needs and the Layer 10 Dependencies cite it.
4. **gap:symmetric-lattice-shrinking: the cited owner no longer contains it.** GeometryOfNumbersAndQuadraticArithmeticPartII at its head is "quadratic and symmetric arithmetic at dyadic primes" and has no *FunctionFieldLatticesAndShrinking* or FL.4; that sub-roadmap was a split proposal in its design that was not adopted. No roadmap on main, open, or on the board states function-field lattice reduction or BS20 Lemma 6.4. The content is therefore stated here as new Layer 1 targets: §1.2 polynomial lattices and adjoints, §1.3 orthogonal bases, successive minima and the strict-ball count (Lee's Lemma 3.3.5 as quoted in BS20's proof), §1.4 adjoint minima, §1.5 shrinking for symmetric lattices (BS20 Lemma 6.4), each with route, Needs and Checks; §8.8 now cites §1.5.
5. **Six AlgebraicTopologyPartII gaps → its sections.** gap:at2-arrangement-cohomology → §2.1 *Split arrangement purity*; gap:at2-stable-diagonal → §3.5 *Stable configuration diagonal*; gap:at2-tame-polynomial → §4.1; gap:at2-tame-bouquet → §4.2; gap:at2-double-loop-betti → §5.1; gap:at2-fermat-loop-connectivity → §5.4. Each statement was read at the head and matches the contract (n≥4 and d(n−3)≥j for §§3.5, 5.1; n≥5 and k_i≥1 for §5.4; sign power ε_n=(n+1) mod 2, the parity of n−1).
6. **Lang–Weil in §8.10 → SieveMethodsAndPrimePatterns §5.4.** §8.10's route re-derived the Lang–Weil lower asymptotic from trace and weights; it now cites *Uniform algebraic point counts* (`SieveLangWeil.lang_weil_uniform` there). IG.0.T4 and DeligneWeightsAndPurity §§8.1, 8.8 remain only for the §6.3 normalization Check.
7. **Library pins moved.** `UnitAddCircle.fundamentalGroupMulEquiv` no longer exists in Tau Ceti at `2fd255d`; the circle fundamental group is now Mathlib's `AddCircle.windingNumberIso` (`Mathlib/Topology/Covering/FundamentalGroupCircle.lean:49`, with `AddCircle.windingNumber_eq_div` at line 61), and Tau Ceti has `Circle.fundamentalGroupMulEquiv` (`TauCeti/AlgebraicTopology/UniversalCover/Circle/FundamentalGroup.lean:334`) and `Circle.fundamentalGroupMulEquiv_expLoop` (line 431, sends the counterclockwise loop to `ofAdd 1`). Line numbers updated: `Matrix.rank` :134, `LaurentSeries` :101, `RatFunc.inftyValuation` :83, `Nat.forall_exists_prime_gt_and_modEq` :463. Every other cited declaration was reopened at the pin at the cited line.
8. Kept as supplier contracts, with no owner found anywhere: gap:sf-fibre-strata (SchemeAndStackFoundations §0.7 has semicontinuity and the dominant fibre formula, §0.8 locus constructibility for geometric properties, but no constructible fibre-dimension level sets) and gap:lpv-universal-monodromy (LefschetzPencilsAndVanishingCycles §5.10 gives open-or-finite and ADE in the finite case, not the exclusion of the finite case for k≥3 outside the cubic surface).

Duplication sweep by object (roadmaps on main, the open heads via `roadmaps grep`/`show`, board packages, and the sibling checkouts): Hankel/Padé (only ClassicalArithmeticCompletion §6.44, infinite criterion; DeligneWeightsAndPurity §1.10 uses that criterion; ToeplitzOperators' Hankel operators are analytic), finite-grid counts (SieveMethodsAndPrimePatterns §5.4 is the presentation-uniform 𝔽_q bound, differing as stated in Scope), function-field lattices (none), additive-character sheaves and Fourier transforms (FourierDeligneTransform), configuration/loop topology (AlgebraicTopologyPartII), universal-hypersurface monodromy (none), circle method (CircleMethodThreePrimes, an open roadmap by another author not in the merge order, is the classical Hardy–Littlewood method over ℕ with no shared object), arithmetic statistics over function fields (ArithmeticStatisticsPartVIII: no shared object). No declaration of `Suggested.lean` reuses the fully qualified name of a declaration in another roadmap. Removals are recorded in "Scope and ownership" only.

## Review items applied

The package review (codex, accepted) had no open findings. The two red-team passes of the same head were read as claims and checked:

- RT pass a F01 (P2), §10.1↔§10.2 cycle: applied. §10.1 transports the finite-field spectral sequence and its abstract abutment and the modeled mapping cohomology, with no identification of the two; §10.2 proves the finite-field comparison from §§7.5, 9.4, 3.6 and then transports it by §10.1. Retest at k=3,d=2,n=40: j>156 on the Fourier side, i=j−160>−4, D=74; §10.1 precedes §10.2.
- RT pass a F02 (P2), standing hypotheses leak into Layers 5–7: applied. Conventions now confine n>2ᵏ(k−1), d≥k−1 and even order to the minor-arc, comparison and irreducibility statements; Layers 5, 6, 7 open with their actual standing hypotheses (n≥2, k≥3, d≥1, p>k, ℓ≠p, smooth X and Z, x≠0 incident; n≥3 and the cubic exclusions only in §§6.4–6.5, 7.4). Retest: k=3,d=1,n=2,p=5, f=Y₁³+Y₂³−1, x=(1,−1): H_c¹(X) has dimension 4 (genus 1, three points at infinity: 2·1+3−1), §5.14 at m=1 gives configuration index a−3, so a=5 and twist −1, matching §7.2's (m,s)=(1,4).
- RT pass a F03 (P3), three instruction Checks: applied with computed values (§6.6: affine rank n(d−m)=0 at m=d and −n at m=d+1; §8.4: cd(a²)=cd(−a²)=1 over 𝔽₅ and both difference forms have degree 2; §10.6: −5 lies above −2811=1−2·38·37 but not above −4).
- RT pass b F01 (P1), "Part II" of a base roadmap that exists nowhere: **unresolved** (see below).
- RT pass b F02 (P2) and F03 (P3), character sheaf and one-variable Fourier input: superseded by items 1–2 above (the owner is FourierDeligneTransform, not CongruenceSpectralGap).
- RT pass b F04 (P3), §6.5 omits 𝔰𝔬₄: applied ("orthogonal dimensions 3, 4 or 5 (𝔰𝔬₃≅𝔰𝔭₂, 𝔰𝔬₄≅𝔰𝔭₂×𝔰𝔭₂, 𝔰𝔬₅≅𝔰𝔭₄), and 𝔰𝔬₆≅𝔰𝔩₄ is not symplectic"); the matching Check now says ranks 3, 4 and 5 do not occur (N₁=6 or ≥21).

## Fixes from the final read-through (as an upstream reviewer)

- §0.1 Check "for a cone, justify …" was an instruction; replaced by the computed cone uv=0 against the diagonal (dim ≤2−1=1, attained).
- §4.2 Check "test a geometric progression" replaced by b=(1,2,4): H₁=[[1,2],[2,4]] rank 1, H₀ rank 1, so b∈A₁∖A₀.
- §6.4's two Checks ("not silently restored", "must satisfy normality") replaced by the n=2 binary-cubic failure (three disjoint 𝔾_m) and the n=k=3 connected 𝔾_m-bundle over a smooth plane cubic.
- §9.2 Check "strict in the degree" now computes the scalar cubic cutoff 3.5, so vanishing starts in degree 4.
- Timeless wording: "corrected", "repaired range", "conservative repair" replaced by "conservative form of the printed statement/range" or by the mathematical reason (§§4.3, 9.4, 9.5, 10.2, 10.5).
- "The companion …" (an unnamed roadmap) in §§10.4, 11.12, 13.3 replaced by the named AlgebraicTopologyPartII sections; §11.12 now states the bouquet type explicitly (2⁴⁰ spheres S³⁹, μ=(k−1)ⁿ) with its source sections.
- "imported from EDC, not planned again here" and "the general top-component supplier contract" in §10.7 replaced by the actual citation and the statement used.
- Conventions now define |·| on all of 𝔽_q((T⁻¹)) (|T⁻¹|=q⁻¹), the vector norm and ‖β‖, which §§1.2–1.5 and 8.8 use, and fix the Frobenius trace ψ(Tr x) on L_ψ by FourierDeligneTransform's Lang-torsor convention.
- Summary rewritten to state what is built, from what, and the end theorems; Scope rewritten to name every owner by section.

## Adversarial mathematics pass

Values are recomputed here; "retain" means the instance agrees with the statement as written.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Conventions: affine normalization | 𝔸¹ vs point | H_c²(𝔸¹)=E(−1), trace q; H_c⁰(pt)=E, trace 1 | retain |
| Conventions: absolute value | 1, T, T⁻¹, 0 | 1, q, q⁻¹, 0; h=0 ball {0} | retain; |T⁻¹| added |
| Conventions: Koszul sign | n=4,5 | transposition −1, +1 | retain |
| Conventions: L_ψ Frobenius | 𝔾_a/𝔽₃, x=1 | trace ψ(1) (FourierDeligneTransform witness) | added |
| §0.1 | two planes in 𝔸³; uv=0 vs diagonal | 1=2+2−3; V∩Z={0}, dim V≤1=1 | retain; Check replaced |
| §0.2 | S={0,1}, line ∪ (0,1); parabola x=0 | 3≤2+1≤4; section degree 1≤2 | retain |
| §0.3 | xy=0→𝔸¹_x | fibre dims 0 off 0, 1 at 0; totals 1=1+0=0+1 | retain (gap kept) |
| §1.1 | 𝔽₂[T], h=2; h=0 | line 4=2², plane 16; only 0 | retain |
| §1.2 (definition) | M=I; M=T⁻¹I; zero matrix; N=0 | Aᴺ self-adjoint; adjoint T·Aᴺ; rank 0≠1 excluded; one vector per ball | new target |
| §1.3 | Aᴺ; basis (1,T),(0,1); diag(T⁻²,T), s=−1 | strict ball 1 vs closed qᴺ; norms q,1 vs minima 1,1, leading vectors (0,1),(0,1) dependent; count q³·1=q³ (deg c₁<3, c₂=0) | new target |
| §1.4 | diag(T,T⁻²) | minima q⁻²,q; adjoint q⁻¹,q²; unreversed formula gives q²,q⁻¹, not increasing | new target |
| §1.5 | γ=0,q=5,a=c=s=1; γ=T⁻²,a=4,c=1,s=1; γ=T⁻¹,a=c=1; a≤0; n=0 | 5≤5·1; q³ vs q, ratio q² = bound q^(1+1) > q^(ns); N=1 (non-strict: q); 1≤…·1; 1≤1 | new target; max term necessary |
| §1.5 route | block lattice, γ symmetric | T^(c−a)Λ^(−T)=JΛJ⁻¹ verified blockwise: both [[T^cI,−T^cγ],[0,T^(−a)I]] | retain |
| §2.1 | p=5, B=20 | ℓ=19≡−1, order 2; ℓ=29>20, residue 4; p=2: −1 has order 1 | retain |
| §2.2 | ℓ=2,p=13; ℓ=3,p=5 | 2⁶≡−1 mod 13, order 12; 3²≡−1 mod 5, order 4 | retain |
| §3.1 definitions | f=0; f=1; f=Y₁,d=1,x=1; d=3 | ideal 0; ⊤; T+a₀ gives ⊤; xT³+a₂T²+a₁T+a₀ | retain |
| §3.2 | n=40,k=3,d=2 | 80−6=74 | retain |
| §3.4 `residuePhase` | f=Y₁³−Y₂³+1,d=1,x=(1,1) | b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c); f+1 adds b₁; b=0 gives 0 | retain |
| §3.4a | φ=λ,u=1; φ=0,u=0; φ=tv on 𝔸² | 0; E[−2](−1); v-integral supported on t=0 gives E[−2](−1)≠0 | new target |
| §3.5 | b=0; p=5,ℓ=2 | stalk E[−2dn](−dn); ord₅2=4, μ₅⊄ℚ₂ | retain |
| §3.6 | one equation, zero vs nonzero value | b-integral E[−2L](−L) on Mor, 0 off it; recovery shift +2L, twist +L | retain |
| §4.1 `hankelMatrix` | L=9,m=4,b₅=1; L=3,m=0; m=L | 5×5 anti-identity, det +1, rank 5; rank 0 iff b=0; zero rows | retain |
| §4.2 | b=(1,2,4) | H₁ rank 1, H₀ rank 1: b∈A₁∖A₀ | Check replaced |
| §4.3 | L=9, m=4,5 | rank 5>4; 4 rows ≤5 | retain |
| §4.4 | L=3,b=(0,0,1),m=1 | h₂=1,h₁=0, error exponent −3=−L−1+m−m′ | retain |
| §4.6–4.7 | m=1, c/(T−a) | b_r=ca^(r−1); 2 parameters ≤2m | retain |
| §5.1 | k=3,d=m=1,L=3,b=(0,0,1) | phase 3(a−c), translation changes by 3λ; cancels by §3.4a | retain |
| §5.2 | xT²+a₁T+a₀ ÷ (T−b) | quotient xT+(a₁+xb), remainder xb²+a₁b+a₀ | retain |
| §5.4 | one quotient coordinate; m=d | shift −2, twist −1; (0,0) | retain |
| §5.8 route | g=a; g=a² (p=5); g=0; g=a^p−a | rank 0, total 0; fibre sheaf rank 1 with no constant quotient, total trace Σ_{h≠0}Σ_aψ(ha²)=q−q=0; H_c⁴=E(−2); fibre H_c²=E(−1) | route replaced, retain |
| §5.12 | smooth affine plane cubic, n=2 | H_c⁰=0, dim H_c¹=2g+3−1=4, H_c²=E(−1) | retain |
| §5.13 | dim V=2,m=2,n=4,5 | Λ²: 1; Sym²: 3 | retain |
| §5.14 / §7.2 | n=4,d=2,m=1; k=3,d=1,n=2,m=1 | index a−13=2 ⇒ a=15, twist −5; index a−3=2 ⇒ a=5, twist −1 (matches §7.2 s=4) | retain; hypotheses widened |
| §6.3 | Fermat cubic pair over 𝔽₂₅ | boundary trace 801−1−625−25=150=6·25; ranks 6+10=16 | retain |
| §6.4 | n=2 binary cubic; n=k=3 | three disjoint 𝔾_m (fails); 𝔾_m-bundle over a smooth plane cubic (connected) | Checks replaced |
| §6.5 | (k,n₁)=(3,3),(4,3),(3,5) | N₁=6, 21, 22; [[−1,1],[0,−1]]²=[[1,−2],[0,1]]≠I | so₄ added |
| §6.6 | m=d; m=d+1 | rank 0, (0,0); rank −n | Check replaced |
| §7.4 | p=7,ℓ=2 | ord₇2=3 odd; eigenvalues +1 vs −1 still separate odd pages | retain |
| §7.5 | n=40,k=3,d=2,(0,0); m=1 | E(6−80)=E(−74); s+40=2 ⇒ s=−38 | retain |
| §8.1 | G=a²,k=2,3; k=1 | y=0, dim 0; all pairs, dim 2; point/empty | retain; `fwdDiff` sign (−1)^(k−1) checked |
| §8.4 | G=a² over 𝔽₅,ℓ=2 | 1+1=2=cd(a²−b²)=cd(−2ay−y²) | Check replaced |
| §8.6 | G=a²,N=1,k=2,3 | bound 1 = cd; bound 2 ≥ 1 | retain |
| §8.7 | f₀=Y³; char 3 | Ψ=6uv, diagonal 6u²=2!·3u²; V_Ψ two lines, dim 1, deg 2; Ψ=0 in char 3 | retain |
| §8.8–8.9 / `polarCount`, `minor_arc_polar_count` | 𝔽₅,n=1,k=3,d=2,m=2,f=Y³,b₄=1; b=0; 𝔽₃ | H₂ rank 3>2; Q²(2Q−1)=225 ≤ 2·5³=250, exponent 4−1=3; 625>250 but rank 0; 81>54 but p=k | retain |
| §8.10 | 𝔸^e; Spec 𝔽_(q²); dual numbers | q^(re); 0,2,0,2,…; 1 each, dim 0 | route now via Lang–Weil |
| §9.2 | k=3,n=1,d=m=2 | cutoff 1·(4−1/2)=3.5 | Check replaced |
| §9.4 | k=3,d=4,n=24,m=5 | B(5)=192−24+24=192; printed 188 | retain |
| §9.5 | same; a=188,190 | 188 excluded; 190 needs the proposition | retain |
| §10.1/10.2 | k=3,d=2,n=40 | j>156, i=j−160>−4, 2dn−2L=160−12=148=2D | cycle removed |
| §10.4–10.5 | n=40,m=1,2 | totals −37; −75,−74; −1 in no band | retain |
| §10.6 | n=40 | 1−2·38·37=−2811; −5 in degeneration range, not in comparison range | Check replaced |
| §10.7 | A¹⊔pt, D=1; ∅ | top rank 1 but a point component <D; top rank 0 | retain; cites EtaleDualityAndPerverseSheaves §0.4 |
| §10.8 / `mapping_geometrically_irreducible` | n=40,k=3,d=2; n=32 | 16<40, 2<1·3, dim 74; 2<2 false | retain |
| §10.9 | k=3,n=3,d=1; n=2 | family dim 1>D=0; equation 1=0 | retain |
| §11.4–11.7 | r=1/4, s=0,3/8,1 | σ=1,−1,1; |a_s(T)|=|T|^d; power sum 1 | retain |
| §11.9–11.11 | constant, F, F·F, F·F⁻¹ | winding 0, −1, −2, 0 | retain; Mathlib/Tau Ceti circle names updated |
| §11.12 | cubic Fermat, n=40 | μ=2⁴⁰ spheres S³⁹, π₂=π₃=0, π₁Ω²X=0 vs quotient ℤ | retain |
| §12.1–12.2 | u=az,w=1+bz; w=1.1; w=−1; t=1,χ=1/2 | seminorms |a|,|b|; 0.1/|z|→∞; deviation 2; bracket within 1/2 of 1 | retain |
| §12.3 | X=pt; X=S², β const | both points; π₀=ℤ=π₀Ω²S² | retain |
| §13.1–13.3 | n=40,k=3,d=2, j=0,1,8 | range 0≤j<8; H_c¹⁴⁷=0 vs H¹(Hco,ℚ)≠0; j≤8≤d(n−3)=74 | retain |

## Ownership against open work

Checked with `roadmaps grep`/`show` on main and all indexed open heads (435), the board packages, and the sibling checkouts given in the brief. This roadmap owns: the finite-grid application, the function-field lattice layer (§§1.2–1.5, no other owner exists), the prime adapters, the mapping scheme and residue phase, the equivariant cancellation lemma §3.4a (a short consequence of FourierDeligneTransform §§2.4–2.5 that no roadmap states), Hankel/Padé arcs, the major-arc and configuration descent, the Goursat application, the localization adapter, cohomological Weyl differencing, the polar count, and the BS20 §7 germ-space applications. Everything else is cited by roadmap and section.

## Unresolved

- **"Part II" with no base roadmap** (red-team pass b F01, P1). No roadmap `ExponentialSumsAndCircleMethod` exists on main, in any open pull request, on the board or in the merge order. The folder name is fixed by this job, so the Summary cannot say where a base stops. A maintainer should either rename the roadmap (folder, title, namespace, merge-order line) or open the base first.
- Two supplier contracts remain open requests: gap:sf-fibre-strata (to SchemeAndStackFoundations, on main) and gap:lpv-universal-monodromy (to LefschetzPencilsAndVanishingCycles).
- FourierDeligneTransform is a draft pull request; the section numbers cited (§§2.2–2.5, 2.8, 3.4, 5.3) are those at its current head and must be rechecked if it renumbers before merging.
- DeligneWeightsAndPurity carries a contract (requested by CongruenceSpectralGap) for the same Artin–Schreier sheaf that FourierDeligneTransform owns; that duplication is between those roadmaps and is not changed here.
- No suspicious instructions were found in any package report, roadmap or source text read.


Pull request: #2138 (roadmap/exponential-sums-and-circle-method-part-ii at d01cb8f)
