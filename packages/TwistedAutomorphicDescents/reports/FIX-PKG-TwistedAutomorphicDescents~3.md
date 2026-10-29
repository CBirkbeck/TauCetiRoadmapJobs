# Repair report: TwistedAutomorphicDescents

## F01 (P1) — applied

ℒ_v=L(s+½,τ×φ_π∨)/(L(s+1,τ×φ_σ)L(2s+1,τ,ρ)) → L(s+½,τ×φ_π)/(L(s+1,τ×φ_σ∨)L(2s+1,τ,ρ)). Conventions now fix base change (χ↦χ(x/c(x)), first factor) and the Levi action. §4.1 states the self-pair, output and recovery transports outright. Self-pair becomes τ≅φ_π∨; recovery of π uses τ=φ_π tested against π∨. Propagated through §§3.4–3.5, 4.3, 4.5–4.7, 5.7, 5.9, 6.2, 6.4, 7.1–7.2.

Evidence that the finding is right. I recomputed it independently:

- **Direct spherical integral.** For split U(1,1)⊃U₁ (a=1, m=0, ℓ=0, odd residue characteristic, κ=2), Iwasawa decomposition of the open-orbit torus t(y) gives Z_v=Σ_(n≥0)X^n+Σ_(n≥1)Y^n=(1−XY)/((1−X)(1−Y)), with X=χ₁β(ϖ)T and Y=χ₂β(ϖ)⁻¹T. That is L(s+½,τ×φ_π)/L(2s+1,τ,Asai⁺) for φ_π=(β,β⁻¹).
- **Twist test.** Twisting by η′(x)=η(x/c(x)) multiplies τ×φ_π∨ by η′², while τ×φ_π is unchanged. The cross factor τ×φ_σ∨ is also unchanged, and τ×φ_σ is not.
- **Residue test.** For U(1,1) the residue of τ=φ_ξ is ξ∘det, and its index-0 descent is ξ, whose parameter is τ. The old labels would assign that descent τ∨. This contradicts §5.7.
- **Source.** The paper's (4.9) uses the Hermitian product (4.8) (JZ2020 line 1145). That product tests against π∨, so its "π has parameter φ_τ" self-pair (JZ2020 line 2150) agrees with the corrected labels.

Other occurrences of the pattern that were repaired: the AutomorphicSpectralTheory §2.8 contract paragraph, the Checks of §§3.3, 4.1, 4.3, 4.5, 4.6, 4.7, 5.7, 6.4 and 7.1, and the Layer 7 Examples.

## F02 (P1) — applied

Cycles 0.2⇄0.3 and 2.4→2.6→2.5→2.4 → chains. The orthogonal Bessel datum moved into §0.1. §2.4 stops at the surviving open-cell integral; §2.6 identifies the inner period and carries Corollaries 4.4/4.6. Generic periods P_O/Q_O are now defined in §1.1, replacing "§1.1 and §2.1". Unitary labels are fixed in §3.3, so §3.4 drops §4.1. §3.1's forward pointer is removed.

A mechanical scan of every Needs line now finds no forward edge and no self-edge, so the strongly connected components all have size 1. The new edges §2.4→§2.6 (in §§2.6, 3.2 and 4.6) are listed in the Needs lines, and the Layer 0, 4 and 7 summaries were updated. The C₂ character integral (1−1)/2=0 that kills the nonopen cell stays in §2.4 and does not use the inner-period identity.

## F03 (P3) — applied

The §6.1 Check "p^1 and p are different partitions" → "the two partitions need not differ". They coincide exactly in the odd-SO H_W branch at a=2, which forces m=1, d=2, j=0 and k₀=1 and gives [3,1,1] of size 5. Otherwise the numbers of parts differ. The a=6, m=1 Check ([7,5,1] against [7,1⁶]) remains the unequal example.

## F04 (P3) — applied

§7.3 "for U₄ the regular partition [3,1]" → regular [4] (power ranks 3,2,1,0) against the maximal Bessel partition [3,1] (ranks 2,1,0,0), with smaller dimension 1 and ambient dimension 9. For U_(2n) the statement now requires the comparison from a nonzero Whittaker coefficient to a nonzero [2n−1,1] coefficient and a U₁ character projection. Added U₂ and SO₄ Checks and updated the Layer 7 example.

## F05 (P3) — applied

"Corollaries 4.4 and 4.6, pp.775,779" → "pp.776,779", now with JZ2020 line 1627 and line 1769. The locator moved to §2.6 together with the inner-period identification it supports. Corollary 4.4 sits at JZ2020 line 1627, after the marker at line 1594, and line 1595 is printed p.776. Corollary 4.6 sits at line 1769, on printed p.779.

## Check outcomes

- **Elaboration.** `lake env lean` on `packages/TwistedAutomorphicDescents/Suggested.lean`, run from the content checkout: exit 0, with no output and no warnings. `Suggested.lean` is unchanged and has no declarations, so the `#check` comparison of this roadmap's own declarations has nothing to compare.
- **Library signatures.** I also elaborated a scratch file with `#check @` for the eight library declarations named in the supplier contracts: `Nat.Partition`, `Representation.IntertwiningMap`, `MeromorphicOn`, `TauCeti.RegularFormClass.wittDecomposition`, `QuadraticMap.IsometryEquiv.exists_extension`, `TauCeti.equivalent_of_equivalent_prod`, `TauCeti.QuadraticMap.specialOrthogonalGroup` and `TauCeti.QuadraticMap.det_reflection`. It exited 0, and the object files already existed. The elaborated binders match the contracts: a field with invertible 2; a nondegenerate restricted subspace; a finite-dimensional nondegenerate cancelled summand; invertible Q v with a free, finite module. No change was needed.
- **Dependency direction.** The required `gate --depcheck … --name TwistedAutomorphicDescents --order … --movable` exited 0 and printed exactly the following. There is no UPWARD, CYCLE or moved line.

```text
depcheck: 56 roadmaps, 640 edges, 0 problem(s)
```

- **Citations.** `roadmaps resolve` on the README exited 0. It found no cross-roadmap citation and no Lean name that is found nowhere (main 403e086 and 367 open heads).
- **Structure.** All 49 numbered sections have a Needs line and at least three Checks. The 16 README gap slugs equal the 16 slugs of the top-level `gaps` in `design/plan.json`, which is unchanged. I found no LaTeX delimiters, machine paths or process words. `git diff --check` is clean.
- **Arithmetic.** The adversarial pass below was computed by script, and every assertion held.
- **Gate failures.** None were listed for this round.

## Adversarial pass

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Conventions: base change | β(ϖ)=i at a split place | φ_β=(i,−i); φ_(β⁻¹)=(−i,i)=c(i,−i)≠(i,−i) | The normalization is pinned; a Check was added |
| §3.3 ratio, numerator | Split U(1,1), q=2 and 3, s=½, twist η(ϖ)=i | q=2: 3 → 3 (dual reading 1/3). q=3: 2 → 2 (dual reading ½) | Numerator is τ×φ_π |
| §3.3 twist invariance | 3 random unitary (χ₁,χ₂,β,μ,η) | τ×φ_π invariant; τ×φ_π∨ not; τ×φ_σ∨ invariant; τ×φ_σ not; Asai χ₁χ₂ invariant | API bullet added |
| §3.3/§4.1 cross roots | Split U₃: (2,3,5) and (i,−i,i) | (2/5, 15) against undualized (10, 3/5). (1,1) with factor 4 against (−1,−1) with factor 4/9 at T=½ | Cross factor is τ×φ_σ∨ |
| §3.4 spherical integral | Series against closed form, 3 random characters, T=0.37 | Σ_(n≥0)X^n+Σ_(n≥1)Y^n equals (1−XY)/((1−X)(1−Y)) equals the ratio (error <1e−9). At q=3: (8/9)/(4/9)=2 | Check added |
| §3.4 degenerate valuations | v(y)>0, <0, =0 with p odd | Bottom-row norm 1, \|y\|, 1; f=α₁^v q^(−v/2), α₂^v q^(v/2), 1 | Consistent with the series |
| §3.5 shifted arguments | α=⅓, β=¼; α=β=½ | 5/12, 11/12, 4/3; boundary 0 | Labels changed only; values unchanged |
| §4.1 self-pair | φ_(π′)=i; φ_π=χ with χ² nontrivial | Weight 1 at τ=z⁻¹ (factor 2) and −1 at τ=z (factor ⅔); χχ⁻¹=1 against χ² | Self-pair τ≅φ_(π′)∨ |
| §4.1 U(1,1) residue | τ=φ_ξ, ξ(ϖ_w)=i | Descent ξ has parameter (i,−i)=τ_w; the test rep ξ⁻¹ has (−i,i)=τ_w∨ | Output transport confirmed |
| §4.1 recovery | Q_ψ(f,g)≠0 | P_(ψ⁻¹)(conj f,g)=conj P_ψ(f,conj g) | Test against π∨ with τ=φ_π |
| §4.3 criterion | Split U₃, χ₁=μ=i, χ₂=−i | Cross weights 1,1 with factor 4, against undualized 4/9 | Check replaced |
| §4.5 self-pair order | r=2, Z=6t⁻²+3t⁻¹, ℒ=2t⁻² | Quotient 3+(3/2)t, value 3 | Values unchanged; labels changed |
| §4.6 output | χ²≠1 | τ=χ⁻¹ gives weight 1; τ=χ gives χ², with no pole | Check added |
| §4.7 central value | Conjugate-self-dual χ, μ at split coordinates | χ∨μ∨=c(χμ) (true twice); χμ∨ equals χμ only if μ²=1 and c(χμ) only if χ²=1 | Bilinear L(½,χμ) reached via the functional equation |
| §6.2/§6.4 hypothesis | φ=χ, φ′=μ | Input (φ∨,φ′) needs L(½,c(χμ))=L(½,χμ); input (φ,φ′) would need L(½,χμ∨) | Hypothesis aligned with the cross value |
| §0.1 Bessel datum | (d,r)=(4,2),(4,1),(5,2),(3,0),(2,1) | Valid ℓ: {0,1},{0,1},{0,1,2},{0},{0}; e₂+e₋₂ has value 2 | Existence criterion ℓ≤r and 2ℓ+1≤d |
| §2.4 surviving cell | a=1, r_W=0, ℓ=0 and 1 | (0,1) with β=1; (0,0) with β=0; cell (1,1) has α=1 and is killed | Check added |
| §6.1 partitions | a=2..29, all m≤11, three branches | Sums all 2a+m; coincidences only (odd-SO, a=2); a=2 forces (m,j)=(1,0) | F03 Check rewritten |
| §7.3 U₄ | Nilpotent ranks; ambient | [4]: (3,2,1,0); [3,1]: (2,1,0,0); N=a=4, m=1 gives 9, k₀=2, [5,1⁴] of size 9 | F04 repaired |
| §7.3 SO₄, U₂ | Orthogonal partitions of 4; index 0 | [4] is excluded (even part of odd multiplicity); U₂ restriction to U₁ is nonzero for a translate | Checks added |

## Ownership, sources and notes for the maintainer

- **Ownership.** The new material is a convention (base change), period transports internal to this roadmap's descent diagram, and the U_(2n) Whittaker-to-maximal-Bessel comparison inside §7.3. I searched main, the open heads and the board for an owner of the comparison and for a competing base-change normalization: none was found. GanGrossPrasadUnitaryGroups fixes no explicit U₁ normalization. AutomorphicSpectralTheory §2.8 is used unchanged, with its symbolic τ×σ evaluated on the identified root representation. No supplier was added, and no plan gap changed.
- **Sources.** No new source was fetched. All locators are in JZ2020 (lines 1145, 1627, 1769, 2150). `sources.toml` and `needs-references.toml` are unchanged.
- **Unproved step in §7.3.** The U_(2n) comparison is now an explicit target. Its proof route is only outlined (Fourier expansion over the middle hyperbolic plane, where cuspidality removes the zero vector). The U₂ case is immediate. For n≥2 the even-unitary regular recovery rests on this step.
- **Changed names other roadmaps might cite.** The only board package that names this roadmap is GanGrossPrasadUnitaryGroups, in a consumer list; it cites none of the sections that changed. The internal order changed in two places: the inner-period identification and Corollaries 4.4/4.6 moved from §2.4 to §2.6, and the generic periods P_O/Q_O are now in §1.1.
- **Source issue.** The roadmap does not use JZ2020's printed unitary cross label τ×σ. Under the standard base change the actual root representation is τ×φ_σ∨, and the inner product (4.8)–(4.9) makes the paper's π the conjugate of the bilinear test vector.
