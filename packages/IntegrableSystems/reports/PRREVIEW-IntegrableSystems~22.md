# Review of IntegrableSystems (pull request #1651 at 4347340)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** accepted

Incremental re-review. The folder has 0 changed lines since `c1e867d`, the head the previous review read; that review had no finding. Between the two heads the pull request changed only `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md` (22 lines) and `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md` (9 lines). I read that diff against every place this roadmap cites the two siblings. There is no finding.

## Previous findings

- none: the previous review (at `c1e867d`) was an acceptance with no finding, so there is nothing to account for.

## Verified sound

**What changed, and what depends on it.**
- `git diff c1e867d 4347340` touches no file of this folder; `lake-manifest.json`, `lean-toolchain` and the family index (`TauCetiRoadmap/SymplecticGeometry/README.md`, `Suggested.lean`) do not differ from `origin/main` (`71c8f21`, the same main as at the previous review).
- `CotangentLagrangian/README.md`: the two changed hunks are in C2 (the dimension counts now carry the injective-differential hypothesis on the isotropic count) and in the Kodaira–Thurston paragraph (H₁ = π₁^ab now cites the pinned degree-one Hurewicz isomorphism). This roadmap cites CotangentLagrangian three times (README lines 19, 435 and 544): for cotangent forms and canonical transformations, for C3's generating convention and for C3.1's chain dictionary. None of these touches the changed passages. The targets resolve at this head: `## C3. Correspondences and generating functions` (line 382), `### C3.1. Discrete action, iterates and convex billiards` (line 471), and the chain dictionary still names IntegrableSystems I5.2 as its instance (line 510). Each moved down one line; the content is unchanged.
- `ConvexityToric/README.md`: the changed hunks are in §2 (an abbreviation expanded), §3.2 (Kostant's theorem with K, T, W bound and an O(2) negative control), Layer 4 and §5.2 (abbreviations expanded) and the consumers paragraph. This roadmap cites only Layer 1 (1.1) (README line 21); the anchor `## Layer 1: Compact symplectic actions and local models` (line 204) and `### 1.1 Periods, characters and rank-one normalization` (line 206) are unchanged.
- The citations into the family index (its conventions, README line 10, and `## S0`, README lines 111 and 223, at index line 84) and the citations into roadmaps on main resolve as in the previous review, main being the same commit. `roadmaps resolve` (the worker's `citations.md`, computed at this head) lists no unresolved citation and no unresolved Lean name.

**Gate, build and dependency direction.**
- The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `outside-folder=0`, every scanner 0). My own run has every scanner 0 and `depcheck=0`; it lists `outside-folder=4`, naming only the README and `Suggested.lean` of `ConvexityToric` and `CotangentLagrangian`, which this pull request owns. The exclusion diff against `origin/main` is empty: the pull request changes nothing outside its three folders.
- `lake env lean` on `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean`: exactly four `declaration uses sorry` warnings (lines 73, 108, 123, 151), nothing else.
- Dependency check, no UPWARD, CYCLE or `moved:` line:

```
depcheck: 234 roadmaps, 2267 edges, 0 problem(s)
```

**Lean form, signatures, headlines, padding.** `Suggested.lean` is byte-identical to the file the previous review elaborated with `#check @` for all six declarations and probed with one tactic (all four theorems kept `sorry`); the pins are the same, so those results stand. The worker's `signatures.md` at this head reports 0 of 6 declarations with a lost section binder, and `library-matches.md` no same-name hit.

**Overlaps and ownership.** `overlaps.md` at this head: the only other open pull request touching this folder is the pin bump #1187, and the description's `merge-order` block orders this pull request before it. No cited id is dropped, none is defined only by an open revision, and this pull request drops none. The description's IntegrableSystems paragraph agrees with the head (I5 strict annulus theorem in lifted form on the strip; `exists_actionAngle`; the two I3 statements). No gap is declared and none is needed.

**Sources.** No locator of this folder changed, and the README flags none as unverified. The seeded targets (“Supplied by Tau Ceti”, “Quotient and atlas”, “Group, translations and time form”, “Scaling”, “Finite products and open restrictions”, “The positive-period total family”, “Smooth parameter families and estimates”) lie in untouched text; their rows are carried below. The source locators read at the previous review (`lecalvez-wang` lines 75–82, `cds` lines 4470–4483, `smale1959` lines 15–17, `gramain1973` lines 48–60, `egms` lines 533–555) are unchanged.

**Adversarial pass.** No statement changed, so there is no new row; every row is carried, with its values, from the review at `c1e867d`. The two rows that compare with CotangentLagrangian C3 and C3.1 were re-checked against the sibling at this head: the cited sections are untouched by the diff.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| "Supplied by Tau Ceti", I1 | oscillator on ℝ², n=1; n=0 | regular set ℝ²∖{0} dense; 2·1 = dim; ker dH = span X_H is a line, Lagrangian; k ≤ n: 1 ≤ 1; n=0: empty tuple, 0 = 0 | agrees with pinned statements | none; carried from the review at c1e867d |
| "Supplied by Tau Ceti", I2 | H=νI; f=p on T*ℝ | proper needed for completeness (pinned line 94); stabilizer 2πν⁻¹ℤ discrete, ℝ/Λ compact; f=p: stabilizer 0, level a line, no torus claimed | agrees | none; carried from the review at c1e867d |
| "Supplied by Tau Ceti", I4 | Kepler | I_r+|ℓ| = κ√(m/(−2E)) gives H = −mκ²/(2(I_r+|ℓ|)²); Ω_r = mκ²/I³; T = 2πI³/(mκ²) with I=√(mκa) gives 2π√(m/κ)a^(3/2); circular E=−mκ²/(2ℓ²): I_r = 0, e = 0 | agrees | none; carried from the review at c1e867d |
| "Quotient and atlas" | p>0, compacts in [−R,R] | n·t = t+np; integers with \|np\| ≤ 2R: at most 2⌊2R/p⌋+1; lifts differ by np, transition derivative 1 | agrees | none; carried from the review at c1e867d |
| "Group, translations and time form" | circuit t↦q_p(t), 0≤t≤p | ∫dt = p; q_p^*α = dt determines α since q_p is a surjective local diffeomorphism; ×(−1) pulls dt_p to −dt_p | agrees | none; carried from the review at c1e867d |
| "Scaling" | p=1, q=2π; composition | derivative q/p = 2π; (r/q)(q/p) = r/p; dt_p = (p/2π)dθ; D_(p,p) = id | agrees | none; carried from the review at c1e867d |
| "Finite products and open restrictions" | two factors; empty index set | dt₂∧dt₁ = −dt₁∧dt₂ (transposition sign −1); empty product a point, sign +1; period of dt_i on the j-th circle 0 for j≠i | agrees | none; carried from the review at c1e867d |
| "The positive-period total family" | cover Q, deck t↦t+np | Q^*η = p·d(t/p) = dt−(t/p)dp; after deck: dt+n dp−(t/p)dp−n dp, same; Q^*dη = (1/p)dp∧dt ≠ 0; i_p^*η = dt_p | agrees | none; carried from the review at c1e867d |
| "Smooth parameter families and estimates" | k=0,1,2 on \|t\|≤R, p≥ε | t/p, −t/p², 2t/p³; bounds R/ε, R/ε², 2R/ε³; ∂_t∂_p^k = (−1)^k k!/p^(k+1); η_q = qβ = (q/p)η_p | agrees | none; carried from the review at c1e867d |
| `exists_actionAngle` and its Checks | oscillator; critical point; n=0; f=p | (q,p)=(r sinθ, r cosθ): dq∧dp = r dθ∧dr = dθ∧dI, H=I; counterclockwise gives −dθ∧dI; n=0: point, D=ℝ⁰, image = whole (one-point) bundle; f=p: L a line, `hLc` fails; period p: θ↦(p/2π)θ, I↦(2π/p)I, product preserved | true as stated | none; carried from the review at c1e867d |
| I2 period lattice | H=νI | dI = (1/2π)λ dc with λ=2π/ν gives dI = dc/ν; Λ = 2πν⁻¹ℤ | agrees | none; carried from the review at c1e867d |
| I2 global example | a(r,φ)=(r cosφ, r sinφ) on (1,2)×(0,3π) | det Da = r > 0, local diffeomorphism; a(r,π/2) = a(r,5π/2), not injective | agrees | none; carried from the review at c1e867d |
| `mfderiv_proj_lagrangianVectorField` | L=½mv²−V; L=v | ι_Xω_L = m(a dv−b dq) = mv dv+V′dq gives a=v, b=−V′/m; L=v: ω_L=0, field 0 ≠ v, `hreg` fails | true | none; carried from the review at c1e867d |
| `mfderiv_legendreMap_lagrangianVectorField` | same L; L=e^v | dFL(v,−V′/m) = (v,−V′) = X_H at p=mv; e^v: FL misses p≤0, `hbij` fails | true | none; carried from the review at c1e867d |
| I4 free particle against C3 (README 354) | S=−m‖q−Q‖²/(2t) | p = d_qS = m(Q−q)/t, so Q = q+tp/m; P = −d_QS = p; m=1 is C3's acceptance map | agrees with `CotangentLagrangian/README.md` C3 | none; carried from the review at c1e867d |
| I5.0 convention against C3/C3.1 (README 435, 544) | G_k = −S_k | C3.1 relation p=d_1G, P=−d_2G becomes y=−∂_1S, Y=∂_2S; matching equation −d_2G_(k−1)=d_1G_k becomes Y_(k−1)=y_k; marked point (x_1, d_1G_1) = (x_1,y_1) | agrees | none; carried from the review at c1e867d |
| I5.0 normalization | ρ≡1; ρ=1+y; shear R_c | s=a=1, identity; s=a=3/2, v=(2y+y²)/3, a du∧dv = (1+y)dx∧dy; S=(X−x)²/(2c): y=Y=(X−x)/c | agrees | none; carried from the review at c1e867d |
| I5.1 Checks | F=(x+(2y−1)/8,y), c=1 and c=1/8; Moser data ρ=1+ε sin 2πx | N=(x−(6y+1)/8,y), N_Xy=−3/4; c=1/8: N_Xy=+1/8; S_1 = −(2/3)(x−X)²+(x−X)/6−1/96, zero at x−X=1/8, S_12=4/3; a_t=0, b_t=ε(1−cos 2πx)/(2π), dβ=ε sin(2πx)dx∧dy; d/ds ψ^*ω_s = ψ^*(dι_Xω_s+dβ) = 0 exactly for ι_Xω=−β | agrees | none; carried from the review at c1e867d |
| I5.2 Checks | K=1, d=x_2−x_1 | W = −d²/6−d/6−1/96 = 1/32−(d+1/2)²/6 (1/24 unnormalized); y_1 = −(4/3)d−1/6 ∈ [0,1] iff d ∈ [−7/8,−1/8]; critical d=−1/2 gives y_1=1/2, the fixed circle of F | agrees | none; carried from the review at c1e867d |
| I5.3 face formula and Checks | K=1 | ydot_1 = S_11(Y_2−y_1)+S_12(Y_1−y_2) with S_11=−4/3, S_12=4/3, Y_2=y_2=−d: −(8/9)(d+1/2); −1/3 at d=−1/8 (face y_1=0), +1/3 at d=−7/8 (face y_1=1), both outward; d′ = −2W′ = (2/3)(d+1/2); S_11 = −S_12B′ with B′=1 | agrees | none; carried from the review at c1e867d |
| I5.4 Checks | K=1 | G = u−(6v+1)/8; ∂_uG=1, ∂_vG=−3/4; G(0,0)=−1/8, G(1,1)=1/8; root (6v+1)/8 ∈ [1/8,7/8]; flow ydot=1: exit set the upper circle, Ȟ^*(P,L)=0, Inv(P)=∅ | agrees | none; carried from the review at c1e867d |
| `strict_annulus_two_fixed_points`, `strip`, `interiorFundamentalDomain` | F=(x+(2y−1)/8,y), ρ≡1; rigid rotation; boundary points | det DF=1, `harea` 1·1=1; lower −1/8<0, upper +1/8>0; fixed set y=1/2, e.g. (0,1/2) and (1/2,1/2), distinct in [0,1)×(0,1); rotation x+1/4 fails `hlower`; ρ>0 and `harea` force det DF>0; a fixed point at y=0 or 1 contradicts the strict inequalities | true; Le Calvez–Wang Thm 1 after the I5.0 normalization | none; carried from the review at c1e867d |
| I4 pendulum monodromy | loop around (1,0) | γ_J fixed, γ₂ ↦ γ₂+γ_J: matrix [[1,1],[0,1]], determinant 1, not the identity; only P₊ contributes (`egms` line 555) | agrees | none; carried from the review at c1e867d |

## Not verifiable

- Arnold, *Mathematical Methods of Classical Mechanics*, §§49–50; Marsden–Ratiu, Ch. 7; Duistermaat 1980; Conley–Zehnder 1983; Epstein 1966, Thm. 6.4; Spanier, Ch. 6; Lee; Hofer–Zehnder. The manifest records them as uncertified and the README cites them by locator only; unchanged since the previous review.
- Ownership against open pull requests was checked with the overlap list and the citation resolver only, not by reading every open folder.

## Source issues

- none
