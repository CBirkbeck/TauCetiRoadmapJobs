<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2440#issuecomment-6672757107 -->
Review (claude) of 30f2861

Verdict: needs_changes

1. **F01** (P3) The stated library pins are not the pins of the content manifest

   **Location.** README line 39: "The pin is 6b7abb3c7686292736be2955bd3eb9ebf63b456a. Consume `Matrix.conjTranspose` …"; line 43: "The pin is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Consume `TauCeti.map_normUnits_unitFiltration` …".

   **Claim.** Mathlib is pinned at 6b7abb3c… and Tau Ceti at a91d3aa….

   **Witness.** The content checkout's `lake-manifest.json` pins mathlib at f6090c7095e1e56b3464c1daba5f24631f1290d2 and TauCeti at 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a; the manifest history shows the Tau Ceti pin moved from a91d3aa to 358314d on 2026-10-08, before the package was written. The checked-out packages are at those revisions (`git rev-parse HEAD` in each).

   **Exact repair.** On line 39 replace the hash by f6090c7095e1e56b3464c1daba5f24631f1290d2 and on line 43 by 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a (or drop both hashes and say "at the pinned Mathlib" and "at the pinned Tau Ceti", as most roadmaps on main do). Every declaration the two contracts name exists at the actual pins (file and line in Verified sound), so no other sentence changes. `design/plan.json` keeps its design-time baseline; it is not edited at the package stage.

2. **F02** (P3) The relative orbital integral is written over the wrong side of the coset space

   **Location.** README line 221, §0.7: "define RO(f,X) as the integral over the coset space (U(W₁)×U(W₂))/H_X of f(h₁⁻¹Xh₂)".

   **Claim.** f(h₁⁻¹Xh₂) is a function on the right coset space (U(W₁)×U(W₂))/H_X.

   **Witness.** It is invariant under left translation by H_X only. With H_X={(g₁,g₂): g₁Xg₂⁻¹=X} (§0.4), (t₁h₁)⁻¹X(t₂h₂)=h₁⁻¹(t₁⁻¹Xt₂)h₂=h₁⁻¹Xh₂, but (h₁t₁)⁻¹X(h₂t₂)=t₁⁻¹(h₁⁻¹Xh₂)t₂. Rank two, standard forms, X=diag(1,π): H_X={(t,t): t∈U(1)²}; take h₁=1, h₂=w=[[0,1],[1,0]]∈U(V₂), so Y=h₁⁻¹Xh₂=[[0,1],[π,0]], and t=diag(u,1) with u≠1: t⁻¹Yt=[[0,u⁻¹],[πu,0]]≠Y, so f=1 on a small neighbourhood of Y takes different values at the two representatives of the same right coset. Leslie25 lines 613–616 integrate over H_δ\U(W₁)×U(W₂).

   **Exact repair.** Write "over the coset space H_X\(U(W₁)×U(W₂)) of f(h₁⁻¹Xh₂)" (or keep (U(W₁)×U(W₂))/H_X with integrand f(h₁Xh₂⁻¹)=f((h₁,h₂)·X)); both give the same number by unimodularity. Tested on the witness: f(h₁⁻¹Xh₂) is constant on each left coset H_X(h₁,h₂). No Check of §0.7 changes (rank one is abelian).

3. **F03** (P3) Downstream consumers names a roadmap that does not consume this one

   **Location.** README line 836: "GanGrossPrasadUnitaryGroups consumes the local relative comparison through its own supplier contracts."

   **Claim.** GanGrossPrasadUnitaryGroups is a consumer of this roadmap.

   **Witness.** GanGrossPrasadUnitaryGroups at its open head (pull request 1404) cites no section of this roadmap and never names it; its five relative contracts (gap:relative-geometric-comparison, gap:relative-finite-transfer, gap:relative-archimedean-transfer, gap:relative-fundamental-lemma, gap:relative-character-comparison, its README lines 152–160) are declared on EndoscopicTransferAndUnitaryTraceComparison and concern the Jacquet–Rallis comparison for GL_n×GL_{n+1} against U_h, not the unitary Friedberg–Jacquet symmetric space.

   **Exact repair.** Replace the paragraph by: "No roadmap on main or in an open pull request consumes this roadmap yet. The local Jacquet–Rallis contracts that GanGrossPrasadUnitaryGroups declares on EndoscopicTransferAndUnitaryTraceComparison ask for the same objects as gap:jr-local-comparison here, so one supplier serves both; the global geometric and archimedean relative comparisons of that roadmap are separate contracts and do not follow from the lattice theorem." Tested: every sentence then resolves against the two READMEs at their heads.

4. **F04** (P3) The Tau Ceti norm criterion is described for units only

   **Location.** README line 43: "the second says that a unit of the bottom field is a norm exactly when the inertia degree divides its normalized valuation".

   **Claim.** `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` is a statement about units.

   **Witness.** `TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean` line 158 at the pin: `{x : Kˣ}` with `normalizedValuation K x`, i.e. every nonzero element of K; read as valuation units (valuation 0) the criterion is vacuous, and §4.1 uses the depth-zero surjectivity, not this lemma, for the unit c.

   **Exact repair.** Replace "a unit of the bottom field" by "a nonzero element of the bottom field". Tested on x=π (valuation 1, inertia degree 2): not a norm, as the lemma says and as the Check "−π has no lift" of §0.5 uses.

5. **F05** (P3) The Conventions sentence on rank zero contradicts §§2.1 and 4.7

   **Location.** README line 25: "rank zero enters only as GL_0=U_0={1} at n=1 in the adjacent-rank comparison."

   **Claim.** Rank zero occurs in the roadmap only in §§4.3–4.4.

   **Witness.** §2.1 defines X_0 as a point with H(X_0)=ℂe_0 and gives it a Check; §4.7 states Φ_0=Φ_0,0=e_0 and gives it a Check; the Checks of the supplier contracts (line 55) use rank zero.

   **Exact repair.** Replace the clause by "rank zero enters as GL_0=U_0={1} at n=1 in the adjacent-rank comparison and as the one-point spaces X_0 and Herm(V_0) of §§2.1 and 4.7". Tested: the three rank-zero Checks then agree with the Conventions.

Files reviewed read-only: `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md`, `Suggested.lean`, `metadata.toml`, `sources.toml`, and `design/plan.json` for the gap list. Nothing in the package was changed; no source was fetched (all five manifest entries were already cached and certified), so `sources.toml` is unchanged and no `needs-references.toml` was written. Line numbers are those of the package README; source citations are `<source id> line N` in the line-numbered extractions.

Five findings, all P3; no P1 or P2. The mathematics of the sampled targets, the headline theorems and every target touched below was recomputed and holds; the repairs are a stale pair of pin hashes, one coset-side slip, one consumer overclaim and two wording slips.

## Verified sound

### Principles

No route-specific shortcut: the lattice theorem (§4.10) is stated for every characteristic-zero F including residue characteristic two, all a,b>0 and all four form pairs; the germ statements (§§3.1–3.3, 3.5) allow ramified E. No re-planned roadmap: ordinary endoscopy, the split carrier, Satake and parabolic descent, quotient measures, the Weil index and operators, Hermitian lattices, duals and densities, Galois descent and analytic charts are imported by section (resolved below), and the Igusa-free invariant-ring argument of §0.3 is this roadmap's own. Supply runs downward only (gate output below). No copied passages: every statement is restated with a locator (the sampled ones are compared to the text below). No algorithm. `Suggested.lean` has no sorry'd data and no `set_option` (it has no declarations).

### Dependency gate

Run from the content checkout on the package README with `--movable`:

```text
depcheck: 241 roadmaps, 2427 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every roadmap cited is earlier in the merge order or on main: EndoscopicTransferAndUnitaryTraceComparison, GeometryOfNumbersAndQuadraticArithmetic, AdelicAlgebraicGroups, SmoothRepresentationsOfLocalGroups, MetaplecticAutomorphicForms (open pull requests, earlier in the order), ReductiveGroupsPartII and SchemeAndStackFoundations (main).

### Elaboration

`lake env lean <Suggested.lean>` from the content checkout: exit 0, no output at all (0 warnings, 0 errors). The file declares nothing, so the `#check @name` binder comparison and the one-tactic padding probe had nothing to run on; both are vacuous and no change results.

### Seeded source sample (15 targets)

| Target | Text checked | Result |
|---|---|---|
| 0.1 off-diagonal representation | Leslie25 lines 518–539 (§2.1, pp. 13–14): u(W)₁=Hom_E(W₂,W₁), δ(X)=[[0,X],[−X^τ,0]], ⟨Xw₂,w₁⟩₁=⟨w₂,X^τw₁⟩₂, action g∘φ∘h⁻¹ | Statement, adjoint convention and action agree; §1.2 pp. 3–4 is the introduction's version. Correct. |
| 0.3 invariant quotients | Leslie25 lines 556–581 (Proposition 2.1, Lemma 2.2, p. 14) | Both categorical quotients and the charpoly coordinates as stated; the source uses Igusa's criterion, the README's direct invariant-ring route is checked in the table. Correct. |
| 0.4 regular semisimplicity | Leslie25 lines 542–550 (definition, p. 14), 621–639 (Lemma 2.4, pp. 15–16, with π(X,Y)(t²)=det(tI−Z)) | Statement and block charpoly identity as stated. Correct. |
| 0.5 contraction torsor and kernels | Leslie25 lines 590–610 (Lemma 2.3, p. 15); Leslie19 lines 558–567 (Lemma 3.6, p. 12), 608–640 (Lemma 3.9, p. 13) | Torsor, stabilizer projection with inverse t↦(t,X⁻¹tX), kernel isomorphism; the README's F-point image Ω(W₁,W₂) is the sharper statement (recomputed in the table). Correct. |
| 0.8 orbital pushforward | Leslie25 lines 640–651 ((2.4), p. 16); Leslie19 lines 571–591 (§3.2, pp. 12–13), 1379–1393 (Proposition A.3, pp. 25–26) | Lift-independence, C_c^∞(Ω) for nonsingular support, surjectivity, relatively compact support in general. Correct. |
| 0.9 contraction preserves orbital integrals | Leslie25 lines 657–671 (Lemma 2.5, p. 16) | RO(f,x)=Orb(r_!f,r(x)) for f on the whole space, x regular semisimple, through the cutoff. Correct. |
| 1.1 relative data | Leslie25 lines 801–822 (§2.3, p. 20) | Quintuple, symmetric representation, r_{α,β}, matching through contraction. Correct (the n=0 remark at line 803 is E16). |
| 1.2 relative matching and factor | Leslie25 lines 823–839 (§2.3, p. 20), 718–748 (§2.2.2, Lemma 2.7, p. 18), 749–794 (§2.2.3, pp. 18–19) | Δ_rel=Δ∘(r_{α,β},r), κ trivial on S₁(a), nontrivial on S₁(b), the nice-pair factor (2.7) and the κ(inv) correction. Correct. |
| 2.2 base change and the Levi maps | Leslie25 lines 999–1005 (Lemma 3.2, p. 24: Z_i↦q^{−b}X_i, q^{−a}Y_{i−a}), 1745–1754 (proof of Proposition 4.8, p. 39) | Substitution as stated; the p. 39 support claim is E10, refuted in the table. Correct. |
| 2.3 Hironaka's isomorphism | Hironaka99 printed pp. 566, 569, 571 read from the cached publisher PDF rendered to images (the OCR text drops signs): (2.2) s_i=−z_i+z_{i+1}−1−π√−1/log q, s_n=−z_n+(n−1)/2−π√−1/log q; (2.3) image C[q^{±2z}]^{S_n}; Theorem 1; (2.5)–(2.6) with sign (−1)^{n(λ)+|λ|}; transform ∫φ(x)Ψ_z(x⁻¹)dx with ∫_{K·1_n}dx=1; Theorem 2 (rank 2ⁿ); (2.7); Leslie25 lines 1140–1180 (Proposition 3.4, Remarks 3.6–3.7, pp. 26–27) | Locators and statements as cited; p=2 allowed since k/k₀ is unramified (p. 566). Values recomputed in the table. Correct. |
| 3.2 regularized nilpotent distributions | Leslie25 lines 1589–1611 (§4.2, p. 36); Xiao18 lines 152–195 (equation (2), Lemma 2.1, pp. 3–5), 651 (§4.1, p. 15) | Integral over GL_n(F)/T_x of the continued T₁-integral with |t_i|^{±s}, η(det t)η(det g); Lemma 2.1 gives holomorphy at 0 for nontrivial η. Correct. |
| 3.3 germ inversion | Leslie25 lines 1612–1635 (Lemma 4.6, Theorem 4.7, p. 36); Xiao18 lines 905–917 ((7), p. 19), 926–983 (§4.5, Lemma 4.6, Theorem 4.7, pp. 20–21) | Source identities carry no 2^{−r}; the README's factor is E11, confirmed by the rank-one computation in the table. Locators correct. |
| 3.4 additive parabolic descent | Leslie25 lines 1685–1705 (Definition 4.9, p. 38), 1758–1813 (Jacobian |det m₁|_F^b and δ_P, p. 39) | Definition without δ_P^{1/2}, Jacobian and the ξ′ identification as stated. Correct. |
| 4.2 cyclic embedding is pushforward | Leslie25 lines 1258–1296 (Lemma 3.11, pp. 29–30) | r_!(φ)=φ∗1_0 with xx^τ; the sign reconciliation is §4.1. Correct. |
| 4.6 cyclic spherical FL | Leslie25 lines 1153–1154 (Theorem 3.5, p. 27), 2006–2008 (end of §5.2, p. 43) | Statement and the deduction from Propositions 4.8, 5.2 and Theorem 5.3. Correct. |

Also opened while checking corrections and touched targets: Leslie25 lines 478–482 (Lemma 1.8, E01), 783–786 (E02), 897 (E03), 1423 (E04), 1476 (E05), 1543 and 4170 (E06), 1721–1722 (E07), 1838 (E08), 978–979 (E09), 1717–1718 and 1730–1731 (E12, E15), 1960–1968 (E13), 1183–1226 (§3.3, (3.8), Lemma 3.8, p. 28), 1248–1255 (Corollary 3.10), 1297–1333 (Proposition 3.12, (3.9)–(3.10)), 2000–2005 (Theorem 5.3); Xiao18 lines 1015–1023 (Lemma 5.1), 1128–1200 (Theorem 6.1 proof, four-form signs at 1143, factor identity at 1185); Leslie19 lines 174 (Proposition 1.3, p. 4), 693–739 (Conjecture 4.4, Proposition 4.5, p. 15), 754 (Lemma 4.6, p. 16); BP21 lines 99 (Theorem 1, p. 3), 151 (Lemma 1, p. 4), 297–303 ((4)–(5), p. 6), 337–338 (Proposition 1, p. 7), 366–381 (§4 sum space, p. 8). All page locators agree with the page markers of the extractions. No locator was flagged unverified by the author.

### Adversarial pass

q≥2; E/F unramified where a row says so; all values computed from the README's definitions and the sources above.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Conventions, factor witness | a=b=1, λ_a−λ_b=π | η(π)|π|_F=(−1)q⁻¹; at q=2: −1/2 | holds |
| Conventions, reversed columns | n=2 | reversal sign (−1)^{n(n−1)/2}=−1, so η(−1); (−1,3)_3=(−1/3)=−1 for ℚ₃(√3) | holds |
| Conventions, q_E | q=2 | q_E=4, |π|_E=1/4 | holds |
| 0.1 adjoint and action | rank one ⟨a₁⟩,⟨a₂⟩; split n=1, (g,h)=(2,1), (A,B)=(1,1) | h₁(Xv,w)=a₁ X̄ v̄… gives X^τ=(a₁/a₂)z̄; split (gAh⁻¹,hBg⁻¹)=(2,1/2), AB=1; wrong model (2,2), AB=4 | holds; Check discriminates |
| 0.1 sign of δ | X=1, rank one | δ=[[0,1],[−1,0]], δ*=−δ, δ²=−I; unsigned model δ*=δ | holds |
| 0.2 charpoly identity | square X over a commutative star ring | charpoly((−X)(Xᴴ))=charpoly((Xᴴ)(−X)) by `Matrix.charpoly_mul_comm` (Charpoly/Basic.lean line 271) | holds; rectangular X not claimed |
| 0.2 nonstandard forms | ⟨1⟩,⟨ε⟩, X=1 | X^τ=ε⁻¹, r₁(1)=−ε⁻¹; image −ε⁻¹N(E^×)≠−N(E^×) | holds |
| 0.2 split rank one | X=(u,v) | X^τ=(v,u), r₁=r₂=−uv; (1,0)↦0 | holds |
| 0.3 invariant ring without Igusa | det B≠0, h=B⁻¹; section Z↦(−Z,I) | (Ah⁻¹,hB)=(AB,I), so P(A,B)=Q(AB) with Q(Z)=P(Z,I); Q(AB) is invariant; Q(−(−Z)·I)=Q(Z) so the pullback is injective; charpoly(diag(1,π))=T²−(1+π)T+π keeps the trace | holds |
| 0.4 charpoly of δ | rank one ⟨1⟩,⟨π⟩, z=1; z=0; split A=diag(1,0), B=I | T²+π⁻¹; T²; T²(T²+1); p(t²) has distinct roots iff p has distinct nonzero roots | holds |
| 0.5 F-point image | y=r₁(X)=−XX^τ, a,b∈W₂ | −h₁(Xa,y⁻¹Xb)=h₁(Xa,(X^τ)⁻¹b)=h₂(a,b): X is an isometry (W₂,h₂)→(W₁,−h₁(·,y⁻¹·)); unramified rank one: −1 lifts, −π does not | holds |
| 0.5 split fibre | r(u,v)=−uv, T≠0 | fibre {(u,−T/u)}, F^× acts by (uh⁻¹,hv) freely and transitively | holds |
| 0.6 cutoff and lift | f=1_{O_E}, B=O_F^×; vol J=2 | χ⁻¹(O_F^×)=O_E^×, fibre integral 1_{O_F^×}; ∫h(b)1_J/vol J=h(b), without the denominator 2h | holds |
| 0.7 coset side | rank two, X=diag(1,π), h₂=w, t=diag(u,1) | t⁻¹Yt≠Y for Y=[[0,1],[π,0]]; left cosets invariant | R02 |
| 0.7 measure scaling | (c₁,c₂,c_T)=(2,3,4); (1,1,2) | 3/2; 1/2 | holds |
| 0.8 rank-one pushforward | f=1_{O_E}, t=−N(X) | 1 iff v(t) even and ≥0; support accumulates at 0; 1_{O_E^×}↦1_{O_F^×} | holds |
| 0.9 comparison | X=1,π,π⁻¹, f=1_{O_E} | RO=(1,1,0); r_!f at valuations 0,2,−2: (1,1,0); torus measure ×2 halves both unit values | holds |
| 1.1 labels and split case | a=b=1; E=F×F | (F^×/N)²: four labels; centre dimensions 2 versus 1, no elliptic datum | holds |
| 1.2 factor | x−y=π; unit; x=y | −q⁻¹ (q=2: −1/2); 1; not regular, formula not invoked | holds |
| 1.3 sums | D=C₂, values 2, 5 | SRO=7; κ-sum −3; new base 5−2=3=(−1)⁻¹(−3) | holds |
| 1.5 lift | vol J=2, h=1_B | (1/2)1_{B×J}↦1_B; 1_{B×J}↦2·1_B | holds |
| 2.1 action and rank zero | φ=1_{π^dO_E^×}, f=e_j; n=0 | g⁻¹∈π^dO_E^× gives g⁻¹∗y=π^{−2d}N(u)y, so φ∗e_j=e_{j+2d}; left-module law from (φ₁∗φ₂)(k)=∫φ₁(g)φ₂(g⁻¹k)dg; X_0 one point, det(∅)=1 | holds |
| 2.2 BC versus ξ | a=b=1; n=2 | Z₁↦T₁²↦q⁻¹X² both ways; Z₁Z₂↦q⁻²XY; Sat_F(T_{(2,0)})=q·P_{(2)}(T;q⁻¹)=q(T₁²+T₂²)+(q−1)T₁T₂ (P_{(2)}(x;t)=x₁²+x₂²+(1−t)x₁x₂, v_{(2,0)}=1), Sat_F(T_{(1,1)})=T₁T₂, so BC(T_{(1,0),E})=T_{(2,0),F}−(q−1)T_{(1,1),F} | holds; E10 confirmed (n=3, a=2, b=1, ϕ=1_{Kϖ^{(1,0,0)}K} has BC(ξ(ϕ)) on the coset (ϖ^{(1,1)},1)) |
| 2.3 invariant measure | g=diag(a,1,…,1) | d(gyg*)=|a|_E^{1+(n−1)}dy=|det g|_E^n dy and |det(gyg*)|_F=|det g|_E|det y|_F, so |det y|_F^{−n}dy is invariant; rank one: C=1/(1−q⁻¹), μ(π^jO_F^×)=1 for all j | holds |
| 2.3 rank-one transform | e_j | Hironaka (2.6) at n=1: Ψ_z(π^m)=(−1)^mq^{mz}=(−1)^mU^{−m}; ê_j=μ(π^jO^×)Ψ_z(π^{−j})=(−1)^jU^j; dictionary: (−1)^j(−T)^j=T^j=Sat_F(1_{π^jO_F^×}) | H₁(e_j)=1_{π^jO_F^×}; U↦T gives −1_{πO_F^×} at j=1 |
| 2.3 module law in rank one | φ=1_{π^dO_E^×} | (φ∗e_j)^=ê_{j+2d}=U^{2d}ê_j and Sat_E(φ)=Z^d, so the action is Sat_E(φ)(Z=U²); dictionary sends U² to T², matching Sat_F(BC φ) | holds |
| 2.3 rank-two values | λ=(1,0),(2,0),(1,1) | inverse orbits (0,−1),(0,−2),(−1,−1): Ψ_z=q^{−1/2}·q/(q−1)·(U₁+U₂); q⁻¹·q/(q−1)·(U₁²+U₂²+(1+q⁻¹)U₁U₂); −U₁U₂ (P_{(0,−1)}=x₁⁻¹+x₂⁻¹, P_{(0,−2)}=x₁⁻²+x₂⁻²+(1−t)x₁⁻¹x₂⁻¹, P_{(−1,−1)}=(x₁x₂)⁻¹); volumes by (2.7): q−1, q(q−1), 1; ê_{(1,0)}=√q(U₁+U₂), ê_{(2,0)}=q(U₁²+U₂²)+(q+1)U₁U₂, ê_{(1,1)}=−U₁U₂ | H₂(e_{(1,0)})=−T_{(1,0),F}; ê_{(2,0)}+(q+1)ê_{(1,1)}=q(U₁²+U₂²)=Sat_E(c_{2,1})(U²) |
| 2.3 freeness | n=0,1,2 | ranks 1,2,4 of C[U^±]^{S_n} over C[U^{±2}]^{S_n}; U₁U₂ not in the subalgebra | 2ⁿ; e_{(1,1)} outside the cyclic image |
| 3.2 Tate values | 1_{O_F^×}, 1_{πO_F^×}, 1_{O_F} | 1; η(π)=−1; Σ(−q^{−s})^k=1/(1+q^{−s})→1/2 | holds |
| 3.3 inversion constant | unramified rank one, lattice unit, v=v*=1; r=0,1,2 | forward (7): Orb_ref=1=G_∅+G_{1}=1/2+1/2, Orb_other=−1/2+1/2=0 (κ_∅(ε)=η(ε)=−1); hence G_{1}=2⁻¹(1·1+1·0)=1/2, the source's unaveraged sum gives 1; HHᵗ=I,2I,4I | E11 confirmed; factor 2^{−r} needed |
| 3.3 scaling | v=π, v*=π⁻¹ | ω=η(π)=−1, raw germ −1/2, ωG=1/2 unchanged | holds |
| 3.4 Jacobian | a=b=1, m₁=π | d(πu′)=q⁻¹du′; the lattice test vanishes at a vector of negative valuation | holds |
| 3.5 ordered sign | a=b=1, v=(1,1), x=diag(x₁,x₂); ℚ₃(√3), x_a=0, x_b=1 | det[v,xv]=x₂−x₁=−D; general: cross factors ∏(λ_b−λ_a)=(−1)^{ab}D_{ab}; D=−1, cyclic det 1, η(−1)=−1: η((−1)D)=1 versus η(D)=−1 | E14 confirmed; unramified η(−1)=1 |
| 3.5 descent Jacobian | x_a−x_b=π | u↦x_au−ux_b has modulus q⁻¹, so G_n=|D|⁻¹G_{a,b}(f_p) (Xiao18 Lemma 5.1 direction) | holds |
| 3.6 averaging | F[x]=F×F, a=b=1 | 2⁻²=2⁻¹·2⁻¹ | holds |
| 3.7 trace kernel | u=w=w′=1 | Tr(2)=4=2+2; N(2)=4≠N(1)+N(1)=2 | E08 confirmed |
| 3.8 generators | a=π⁻¹, b=−π | n(a)n̄(b)n(a)=[[0,π⁻¹],[−π,0]]=w·diag(π,π⁻¹); diag(π⁻¹,π)n(t)diag(π,π⁻¹)=n(π⁻²t); ∪π^{−1−2j}O_F=F | SL₂(F) generated |
| 3.8 support | q(a)=π, t∈π⁻¹O_F; q(a) unit | ψ(tπ)=1; some t∈π⁻¹O_F has ψ(tq(a))≠1 (conductor O_F) | holds |
| 4.1 unit of norm −1 | unramified, any p; ℚ₃(√3) | N(O_E^×)=O_F^× by `map_normUnits_unitFiltration` at i=0; −N(c)XX*=XX*; unit norms ≡a² mod 3∌2 | holds; ramified scope correctly excluded |
| 4.2 shells | d=1,−1; odd valuation | ↦e_2, e_{−2}; 0 | holds |
| 4.3 contraction | Φ=1_{K_m}⊗φ, vol K_m=1; m=0 | Φ̃=vol(K_m)φ=φ; empty-group integral; Ω(I,γ₂)=ω(γ₂)=η(1)=1 in rank one | holds |
| 4.4 boundary | n=1, φ=1_{π^dO_E^×}; odd valuation | BC₁φ=1_{π^{2d}O_F^×}=φ∗e₀, ω=1; 0=0 | holds |
| 4.7 overlattice counts | T=diag(π²,1); T=πI₂; rank one T=unit, π² | L∨/L≅O_E/π², one self-dual overlattice; L∨/L≅k_E² Hermitian plane, isotropic lines q+1; rank-one densities: #{N(x)≡T mod π^k}/q^k=(q+1)/q=1−(−q)⁻¹ for both T, so m₀=1 | Φ_{2,2}=e_{(2,0)}+(q+1)e_{(1,1)} agrees with the 2.3 row; self-density ∏(1−(−q)^{−j})>0 |
| 4.7 grades and rank zero | n=1, d=−1,0,1,2; n=0 | v_F(det xx*)=2v_E(det x)≥0 even; Φ_{1,d}=0,e₀,0,e₂; Φ₀=e₀, empty product 1 | holds |
| 4.8 degrees | n=2, d=1,2; general exponent | q(Z₁+Z₂)↦X+Y; q²h₂↦X²+XY+Y²; d(n−1)−bd_a−ad_b=d_a(a−1)+d_b(b−1) | holds |
| 4.9 partition and single datum | a=b=1, (α,β)=(π,1), source ×2 | target valuations (odd, even), source even: no match, the Ξ-assertion is vacuous; the ordinary identity at (2,0) needs 2≠1 | family form required |
| 4.10 labels and dyadic factor | a=b=1; q=2, x−y=π | targets (unit,0,0,0); −1/2 | holds |
| 5.1 values | e₀; e_{(1,0)}; e_{(1,1)}; 1_{πK}∗e₀; e_{(2,2)} | e₀⊗e₀; −(e₁⊗e₀+e₀⊗e₁); −T₁T₂↦−q⁻¹XY so −q⁻¹e₁⊗e₁; Sat_E(1_{πK})=Z₁⋯Z_n↦q^{−2ab}·central; U₁²U₂²↦q⁻²X²Y² so q⁻²e₂⊗e₂=ξ_E(1_{πK})∗e₀ | cyclic compatibility holds; dictionary sign pinned |
| Headlines in `Suggested.lean` | the five docstring items | no carrier at the pins for the spherical Hecke algebra of a p-adic group, Hironaka's spherical functions, orbital integrals or transfer factors (Tau Ceti grep: only `ModularForms/Newforms/Satake.lean` and the arithmetic `HeckeRing/GLn` modules) | nothing statable; docstring correct |

Standing hypotheses: each subsection names its setting (étale, field, unramified); the dyadic case is admitted only where the sources admit it (Hironaka p. 566; Leslie25 Theorem 2.12 has no residue-characteristic restriction; base §4.7 is for any residue characteristic). Every denominator met has a nonvanishing argument: ω(I_n;z), vol J, 1−q⁻¹, D_{ab} on disjoint spectra, h(w,w) a unit, the self-density.

### Duplication and ownership

Searched by object with `roadmaps grep` over main and all open heads (Jacquet–Rallis, Friedberg–Jacquet, Hironaka, relative orbital integral, spherical Fourier): hits are GeometryOfNumbersAndQuadraticArithmetic (its §3.2 owns Hironaka's spherical functions on U(2n)/(U(n)×U(n)) and the Siegel series, a different space, as Scope records), GanGrossPrasadUnitaryGroups (global and local Jacquet–Rallis contracts on the base roadmap, see R03), the base roadmap (citations of Leslie for ordinary endoscopy), and unrelated Jacquet-module or Jacquet–Langlands citations. The board-packages index lists nine packages; none treats the pair (U(W₁⊕W₂),U(W₁)×U(W₂)). Mathlib at the pin: the Hermitian-product and charpoly identities are cited, not restated. This roadmap is the owner of the relative symmetric-space geometry, the X_n module with its fixed dictionary, the germ and descent adapters, the sum-space Weil action and the lattice theorem.

### Suppliers, resolved now

- EndoscopicTransferAndUnitaryTraceComparison (open head, pull request 999): §§1.1 (line 167), 1.4 (289), 1.5 (324), 1.14 (556), 1.17 (639, parts (a)–(c) and the hypotheses "residue characteristic odd where the source uses it"), 2.1 (689), 2.4 (765), 2.9 (892), 2.11 (949), 2.12 (980, stated for unramified E and odd p, as the README says), 3.3 (1142), 4.7 (1856, characteristic 0, any residue characteristic), 4.9(b) (1913). No Jacquet–Rallis section, so the three jr-gaps are not duplicates.
- GeometryOfNumbersAndQuadraticArithmetic (head 851): §2.7 `IntegralHermitianLattice.ofCarrier` (line 709), `IntegralHermitianLattice.dual` (720); §2.9 `SignedHermitianSpace`, `signedHermitianAdjoint` (777, carrier over any commutative field with involution, classification for odd residue characteristic); §3.2 densities with dyadic residue fields (962).
- AdelicAlgebraicGroups (head 792): §2.2 *quotient-measure* (line 1809), Weil's formula for integrable functions (1842), quotient measures in stages (1847).
- SmoothRepresentationsOfLocalGroups (head 1688): *satake-isomorphism* (3233), *parabolic-descent* for GL_n(E), E/F unramified, with the |·|_E^{b/2}, |·|_E^{a/2} twists (3403–3412).
- MetaplecticAutomorphicForms (head 1063): §2.1 `weilIndex` (405), §2.5 `weil_generators` (523), §3.2a `splitHermitianOscillator` (609).
- ReductiveGroupsPartII on main: RG2.0 *smooth-group-analytic-charts* (line 640). SchemeAndStackFoundations on main: §1.24 (line 3068).
- Mathlib at f6090c7: `Matrix.conjTranspose` (ConjTranspose.lean 43), `Matrix.IsHermitian` (Hermitian.lean 44), `isHermitian_mul_conjTranspose_self` (285, rectangular), `isHermitian_conjTranspose_mul_self` (289), `Matrix.charpoly` (Charpoly/Basic.lean 132), `charpoly_mul_comm` (271), `MvPolynomial.hsymm` (Symmetric/Defs.lean 312), `MvPolynomial.bind₁` (Monad.lean 67), `HasStrictFDerivAt.implicitFunction` (Implicit.lean 464, FiniteDimensional section: complete 𝕜 and E, finite-dimensional F, `f'.range = ⊤`). Tau Ceti at 358314d: `map_normUnits_unitFiltration` (Norm/Unramified/Basic.lean 126), `mem_normGroup_iff_dvd_normalizedValuation` (158), both under `[IsUnramified K L]`; `HeckeRing/GLn/PolynomialRing/Basic.lean` exists.
- `roadmaps resolve`: the single lead (`IntegralHermitianLattice.ofCarrier`) is a roadmap declaration of GeometryOfNumbersAndQuadraticArithmetic §2.7, not a library name; nothing is found nowhere.

### Declared gaps

All seven slugs appear with the same spelling in `design/plan.json` `gaps` and in the README contracts (lines 47–50, 55, 63, 71); each names a supplier earlier in the order and a section; each `needs` sentence states objects, hypotheses and a locator. Minimality: the base roadmap's §2.12 is for odd p (unitary-factor-all-quadratic asks for the rest); its §§11.2–11.4 are local unitary packets, not Jacquet–Rallis; GeometryOfNumbers §2.9 is titled for odd residue characteristic and §2.7 constructs lattices and duals without congruence representatives or unit-vector transitivity (its §3.2 line 1029 diagonalizes integral Hermitian matrices inside a proof, not as a stated target). The jr-local-comparison sentence is long but itemised. GanGrossPrasadUnitaryGroups declares overlapping relative contracts on the same supplier; one owner serves both (R03 says so in the README).

### Shape, style and the acceptance test

Title and Summary; Scope and ownership; Conventions with three Checks; Exact supplier contracts (Mathlib, Tau Ceti, seven roadmaps, gaps in the required form); How to read the build; six layers with 36 numbered subsections in build order, each with hypotheses, a locator, a `*Needs:*` line, at least three Checks (counts 3–7) and, for every definition, an API list; every layer ends with Examples and Dependencies; Downstream consumers (R03); Source corrections; References. Greps for LaTeX delimiters, process words, pull-request numbers, machine paths, `lemma` as a keyword and `set_option`: no hits. `Suggested.lean`: `import Mathlib` only, one module docstring naming the five headlines and their missing carriers, the namespace, no declarations. `metadata.toml` topic math.NT. `sources.toml`: five certified entries, no local path, `cited_for` matches the README sections (Leslie19 is cited in §§0.5, 0.6, 0.8, 1.5 and the manifest lists them).

## Not verifiable

- The Annals pagination of Leslie25 and the Duke pagination of BP21 were not compared; the manifest and README pin the arXiv versions that were read.
- Leslie25 Part 2 (the spectral proof of Theorem 11.1, pp. 44–89) was not re-derived; it enters only through gap:jr-product-base-change, whose independence from Theorem 2.12 is a contract on the supplier.
- Hironaka's normalization of the absolute value inside ψ_z in (2.3) was not resolved from the scan; the module law of §2.3 was instead verified directly from the action in rank one and from the cyclic consistency in rank two, which fix Z_i=U_i² independently of that convention.
- The cardinality argument in Leslie19 Lemma 3.9 and Jacobson's classification behind Leslie25 (3.7) were not re-derived; the latter is gap:unramified-hermitian-lattice-orbits.
- Ownership against open pull requests was checked only through `roadmaps grep` and the sibling checkouts the brief lists; pull requests that revise existing roadmaps were not read.

## Source issues

- **Misprint** in Leslie25 at Lemma 1.8, printed p. 12: the source says the centralizer is taken in U(W) although δ lies in Herm(V); it should be U(V); affects nothing.
- **Misprint** in Leslie25 at §2.2.3, printed p. 19: the source says the endoscopic triple is (U(V_a)×U(V_b),s,η); it should read ξ, η being the quadratic character; affects nothing.
- **Misprint** in Leslie25 at §3 opening, printed p. 22: the source says the implication is an unresolved proposition reference; it should be Proposition 3.12; affects nothing.
- **Misprint** in Leslie25 at §4.1.2, printed p. 32: the source says the Hermitian invariants use powers of the linear variable x; it should be powers of y; affects nothing.
- **Misprint** in Leslie25 at §4.1.4, printed p. 33: the source says the upper-left block of the Hermitian embedding is x; it should be y; affects nothing.
- **Misprint** in Leslie25 at Remark 4.4, printed p. 35: the source says the appendix author is Gordan; it should be Gordon; affects nothing.
- **Misprint** in Leslie25 at proof of Proposition 4.8, printed p. 38: the source says the upper test is ϕ⊗1_{Λ_n} with value ϕ at zero; it should be (ϕ∗1_0)⊗1_{Λ_n}; affects nothing.
- **Error** in Leslie25 at §5.1, printed p. 40: the source says the Hermitian partial Fourier kernel is ψ of the norm of the pairing; it should be ψ of the trace of the pairing, the norm not being bilinear; affects the proof.
- **Misprint** in Leslie25 at Lemma 3.1, printed p. 23: the source says the modular character of the E-parabolic carries F-absolute values; it should carry |·|_E; affects nothing.
- **Error** in Leslie25 at proof of Proposition 4.8, printed p. 39: the source says BC(ξ(ϕ)) is supported on cosets with all coweight entries even; this fails when a block has rank at least two, since BC of the (1,0) coset of GL₂ has coefficient −(q−1) on the (1,1) coset; commutation holds by the Satake substitutions instead; affects the proof.
- **Error** in Leslie25 at Theorem 4.7, printed p. 36, and in Xiao18 at Theorem 4.7 and the inversion before it, printed pp. 20–21: the source says the regularized germ equals the character sum over the orbit torsor; it needs the factor 2^{−#S₁}, as the rank-one lattice unit shows (germ 1/2, sum 1); affects a stated result.
- **Gap** in Leslie25 at Proposition 4.8, printed p. 38, and Xiao18 Theorem 6.1, printed p. 23: the four-form signs differ between the construction and its use, Xiao's depending on the second form and Leslie's on the number of split labels; a conversion is needed before the general four-form operator is used; affects the proof.
- **Gap** in Leslie25 at proof of Proposition 5.2, printed p. 43: the source says the Weil action is applied inside the intersection of the two orbital-image spaces; the defect lies in their sum, where the agreeing actions must first be extended; affects the proof.
- **Gap** in Leslie25 at Proposition 4.8, printed pp. 37–38: the source says the hypothesis is for rank n; the proof uses it again in the block ranks a and b; affects the proof.
- **Error** in Leslie25 at §2.3, printed p. 20: the source says there are two orbit representatives in every rank; at n=0 there is one; affects a stated result.
- **Misprint** in Xiao18 at proof of Theorem 6.1, printed p. 24: the source says the cyclic factor identity is ω=χ(D)ω₁ω₂; the ordered determinant gives χ((−1)^{ab}D), which agrees only when −1 is a norm; affects a stated result over ramified E.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "30f2861dc77b39804cc0a779eaae9bf967d739a2", "job": "REV-PKG-EndoscopicTransferAndUnitaryTraceComparisonPartII", "model": "fable", "worker": "chris-x9"} -->
