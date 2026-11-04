# FIX-RT-TwistedAutomorphicDescents~2: repair of red-team round 2

Files changed: `packages/TwistedAutomorphicDescents/README.md` and `packages/TwistedAutomorphicDescents/design/plan.json` (top-level `gaps` only: the `needs` text of `bessel-restriction-growth` and `orthogonal-auxiliary-induction`). `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## RT-TwistedAutomorphicDescents~2a/F01 (P2) — applied

Verified: JZ2020 line 799 fixes a *nontrivial* ψ_F, and with ψ_F=1, d=3, ℓ=1 the Bessel character is trivial, which gives the constant term along N_1 (partition [1,1,1]). Conventions: "Fix ψ_F on F\A_F, trivial on F and unitary" → "Fix a nontrivial continuous unitary character ψ_F of F\A_F and use its local components throughout; each is nontrivial, since F+F_v is dense in A_F". Added a Conventions Check: the trivial-ψ_F boundary case, plus the split coefficients ±1/(2t). No other place restates the character.

## RT-TwistedAutomorphicDescents~2a/F02, RT-TwistedAutomorphicDescents~2b/F01 (P1) — applied differently

These two findings concern the same split-SO₂ regularized-period branch, so they are settled together. 2b/F01 (P2) is applied as proposed. 2a/F02 (P1) is applied differently: its witness is kept, but its repair (keeping the branch with exponent corrections) is not.

2a's witness holds. I recomputed it: the Mellin transform of the non-constant Fourier part of E(iy,u)=Σ Im(γz)^u is Λ(w+u)Λ(w+1−u)/Λ(2u). At w=0 this is Λ(u)²/Λ(2u)∼−2/u, while E(z,0)=1 is regular. So the claim "holomorphic wherever E is holomorphic" was false on that branch.

2b's points also hold:
- L²_cusp(G_m)=L²(F^×\A^×) has no irreducible closed subspace, because the R_(>0) factor has continuous spectrum.
- No generic discrete parameter exists on a split SO₂. χ⊞χ⁻¹ cannot consist of distinct self-dual blocks. An orthogonal 2-dimensional τ has ω_τ≠1, because L(s,τ×τ)=L(s,Sym²τ)L(s,ω_τ).
- On character modules the regularized period is 0 whenever it is defined: the corrections T^(iλ)/(iλ) cancel.

So every consumer (§§4.1, 4.5–4.7) already excludes this branch. 2a's proposed repair (keep the branch and add correction terms) would maintain a construction that no theorem uses and that never witnesses nonvanishing.

Changes:
- Deleted the bold "Regularized split-torus Bessel period" target, its API bullets and its four Checks.
- §1.1 now explains why the split SO₂ case lies outside the period domain and is never needed.
- §2.1 requires G to have trivial F-split centre. Its holomorphy API now holds on that domain.
- Deleted the regularized clauses in the §2.1 proof route, §2.4, §4.1 (output) and §4.6.
- Replaced the vacuous §2.1 Check with 2a's computed SO₃ witness as a negative control.
- Trimmed `gap:bessel-restriction-growth` in the README and the plan (the texts are still identical).
- Added the zero split-SO₂ descent Check to §5.9: η₁=η₂ is forced.

## RT-TwistedAutomorphicDescents~2a/F03 (P2) — applied

Verified: SO(H)=G_m has no proper parabolic, and in split SO₄ the stabilizer of an isotropic line has Levi GL₁×GL₁ (a Borel subgroup). In the README contract and the plan gap, "from the maximal parabolic of SO(W⊥H^t) with Levi GL_t×SO(W)" → "from the parabolic … stabilizing a chosen t-dimensional totally isotropic subspace of H^t, with Levi GL_t×SO(W) (the whole group when W=0, t=1; non-maximal when W is a hyperbolic plane)". The contract has no Checks block, so both boundary computations went into the §1.4 Checks.

## RT-TwistedAutomorphicDescents~2a/F04 (P3) — applied

- §0.4: the first Check repeated the third (both stated the anisotropic exclusion). It now reads: over Q, w=(2,3/4) and y₃=(1,3/2) both have value 3, and diag(1/2,2) (determinant 1) sends w to y₃ without adjoining √3, while the target e+f/2 (value 1) is impossible.
- §3.1: the four restating bullets are replaced by computed Checks:
  - the §3.4 fixture gives Z_v=3 at q=2 and 2 at q=3, and rescaling b_v gives 6;
  - the character-descent law gives i·(−i)=1, against i·i=−1;
  - the index branches give 0 for (a,ℓ)=(1,1) and for (2,1), on different groups.

## RT-TwistedAutomorphicDescents~2a/F05 (P3) — applied

Verified: ⟨1,1⟩, ⟨−1,−1⟩ and ⟨1,−2⟩ are Q-anisotropic, and the real signatures of H²⊥W are (4,2), (2,4) and (3,3). The §6.3 Check now gives all three cases, each with total 6, a=2, k₀=1 and [3,1,1,1]. The statement's "ambient form SO_(2n+2,2n)" → "ambient form H^(2n)⊥W, of dimension 4n+2 and global Witt index 2n, with its special orthogonal group".

## RT-TwistedAutomorphicDescents~2a/F06 (P3) — applied

Verified against the page markers: line 1190 is on p.767 (§4.2 opening), Proposition 4.1 opens at line 1235 on p.768 and continues past line 1247 onto p.769, and (4.14), (4.15) and (4.16) are at lines 1230, 1273 and 1298 (pp.768–769). In §2.3 the locator "Proposition 4.1 and (4.14)–(4.16), pp.767–768" → "§4.2, pp.767–769, especially Proposition 4.1, pp.768–769, and (4.14)–(4.16), pp.768–769; JZ2020 line 1190, line 1235". No other occurrence of the range.

## RT-TwistedAutomorphicDescents~2a/F07 (P3) — applied

- §3.4 Check: "the open orbit of the anisotropic torus" → "the open orbit of the embedded split torus U₁(F_v)≅F_v^×, x↦(x,x⁻¹), fixing the chosen nonisotropic line".
- §2.6 Check: the "abstract SO₂ isomorphism" wording is replaced. It now says the compact and the split real tori become isomorphic only after extending scalars to C, and differ in real split rank (0 against 1).
- Other "anisotropic U₁" mentions (§§4.1, 6.1, 7.3) are global, where U₁ over a quadratic field extension is anisotropic, so they are correct.

## RT-TwistedAutomorphicDescents~2b/F02 (P1) — applied

Verified: in the middle space H⊥⟨c⟩, W=w⊥ is split exactly when c·q(w) is a square, and both rational orbits occur. A split SO₂ carries no cuspidal σ with a generic discrete parameter (see the F01 settlement). JZ2020 lines 3229–3231 give no argument excluding the split-only case, and I could not prove that case empty.

Changes:
- §7.4: for SO_(2n+1) the smaller group is now an F-anisotropic SO₂, with the added hypothesis that some index-(n−1) datum with anisotropic SO(W) has a nonzero coefficient.
- §7.4 proof route: now gives the K¹ parameter, η⊞ηω_K or the induction of χ̃ with determinant ω_K.
- §7.4 Checks: added the explicit split/anisotropic orbit computation over Q; the SO₃ Check is restated (see F03).
- §7.5: the statement and its Needs line carry the same hypothesis.

## RT-TwistedAutomorphicDescents~2b/F03 (P3) — applied differently

- The §2.1 Check went with the F01 repair and was replaced by 2a's witness.
- The §7.4 SO₃ Check was replaced rather than deleted. The case is not empty on the nonsplit form: an anisotropic SO₃ has p^m={[1³]}, and every plane w⊥ is anisotropic, so the new hypothesis holds automatically. It is empty only on split SO₃=PGL₂, where every cuspidal representation is generic. The new Check states both facts.

## Checks run

- `lake env lean packages/TwistedAutomorphicDescents/Suggested.lean` (from the content checkout): exit 0, no output. The file declares nothing, so there are no `#check @name` signatures to compare. Its docstring headline list still matches the README; the §7.4/§7.5 hypothesis change does not alter which carriers are missing.
- Gate warning (Mathlib is designed for the module system; consider `module`): repaired by adding the `module` header line before `import Mathlib` in `Suggested.lean`, as on main in `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean`. Re-elaborated with `lake env lean`: exit 0, no output, warning gone. Nothing else changed.
- Dependency check, output: `depcheck: 201 roadmaps, 1420 edges, 0 problem(s)` (exit 0). No UPWARD, CYCLE or moved line.
- README "What … must provide" texts compared mechanically with the plan's 18 `gaps` entries: all identical.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| Conventions, nontrivial ψ_F | ψ_F=1, d=3, ℓ=1; split δ=(t,−t) | character ≡1 → constant term, [1³]≠[3]; coefficients 1/(2t), −1/(2t) ≠0 | hypothesis needed, added |
| §1.1 split SO₂ excluded | χ⊞χ⁻¹; η₁⊞η₂, η₁η₂=1; orthogonal τ on GL₂ | needs χ²=1 and χ≠χ⁻¹: impossible; η₁=η₂: not distinct; ω_τ≠1≠trivial discriminant | no generic discrete parameter |
| §1.1 regularized period on characters | f=Σc_iχ_i, g=χ, Φ=Σc_i t^(iλ_i) | corrections T^(iλ)/(iλ)−T^(iλ)/(iλ)=0; λ=0 undefined | never nonzero; branch deleted |
| §2.1 holomorphy API | SO₃⊃split SO₂, a=1, ℓ=0, v=1 | E(z,0)=1; period Λ(u)²/Λ(2u)∼−2/u | false on split SO₂ → domain restricted, witness is a Check |
| §2.1 domain | U(W); SO(W), dim W≥3; anisotropic SO₂; SO₁ | centre U₁ anisotropic; finite; compact; trivial | trivial F-split centre except split SO₂ |
| Auxiliary contract | W=0,t=1; W=H,t=1; W=0,t=2 | whole G_m, induction τ\|·\|^s; Borel of SO₄; maximal Siegel parabolic of SO₄ | new wording correct in all three |
| §0.4 Check | w=(2,3/4), y₃=(1,3/2), diag(1/2,2) | 2·2·3/4=3=2·1·3/2; det 1; (1,3/2) image | holds |
| §3.1 Checks | q=2,3, X=Y=1/q | (3/4)/(1/4)=3; (8/9)/(4/9)=2; ×2 → 6; i(−i)=1, i·i=−1; ℓ−a=0, a−ℓ−1=0 | holds |
| §3.4 split torus | E_v=F_v×F_v | U₁(F_v)={(x,x⁻¹)}≅F_v^×, split rank 1 | wording fixed |
| §6.3 signatures | W=⟨1,1⟩, ⟨−1,−1⟩, ⟨1,−2⟩ | (4,2), (2,4), (3,3); x²−2y²=0 has no Q-point | holds |
| §7.4 orbit criterion | c=1, q(xe+yf+zg)=2xy+z², w=e±f/2 | q(w)=±1; w⊥=⟨−1,1⟩ split, ⟨1,1⟩ anisotropic; det w⊥=−c/q(w) | both orbits occur |
| §7.4 K¹ parameter | χ̃²=1; χ̃²≠1 | η⊞ηω_K, det ω_K; irreducible induction, det ω_K | generic discrete |
| §5.9 split descent | d=2, m=1, a=2, τ=η₁⊞η₂ | χ_v⊞χ_v⁻¹=η_(1,v)⊞η_(2,v) ⇒ η₁=η₂ | descent zero |

## Notes for the maintainer

- No Lean name changed. No cross-roadmap citation was added. The only supplier text changed is the two gap `needs` entries, both owned by earlier roadmaps (AutomorphicFormsOnReductiveGroups, SmoothRepresentationsOfLocalGroups). `gap:bessel-restriction-growth` asks for less than before.
- §§7.4–7.5 now carry an extra hypothesis for split SO_(2n+1). This narrows JZ2020 Proposition 7.3 and Corollary 7.4 as printed, because the source's one-line argument (line 3231) does not cover hyperbolic-plane data. Deciding whether that case can occur is open mathematics; it is not something to do in a repair.
- Ownership against open pull requests was not re-checked this round: no construction was added.
- No suspicious instructions were found in the review texts.
