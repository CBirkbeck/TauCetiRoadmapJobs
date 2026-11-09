# Review of StableHomotopyKTheoryPartII (pull request #1733 at 8947c46)

**Verdict:** accepted

This is an incremental re-review. The roadmap folder changed by one line since b984cf9: a new bullet in Scope and ownership, `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:15`. Nothing outside the folder changed. This report has no findings:

- the previous R02 is repaired, and the new bullet is correct as written;
- the previous R01 (the board manifest) is settled, for the reason given under "Previous findings";
- the gate, the dependency check and the elaboration all pass at this head.

## Previous findings

- R01 — not repaired: `packages/StableHomotopyKTheoryPartII/sources.toml`, lines 186–197. The `stacks-algebra` table still runs from `locator_scheme = "tag"` to `cited_for = ["4.8"]` with no `authors`, `title` or `year`. The board copy is unchanged since the package was submitted.
  - **Settled, not re-raised.** The reply to the previous review says the fix "is outside what a repair may edit", and that reason is right.
  - The manifest is a board file. It is not in this pull request: the folder holds `README.md`, `Suggested.lean` and `metadata.toml`, and the diff outside the folder is empty.
  - The files under review carry the full record: README line 1109 gives the authors, the title, an open-access URL and the locator (Lemma 10.153.7, Tag 04GK).
  - Adding the three fields is bookkeeping for whoever maintains the board manifest. It is not a change to this roadmap.
- R02 — repaired: README line 15 now reads "HermitianKTheoryOfPoincareCategories §5.1a owns the C₂ sphere comparison (the Segal–Lin theorem): for the trivial action the canonical map S→S^(hC₂)→S^(tC₂) exhibits its target as S₂^∧, proved there through the inverse tower of stunted real projective Thom spectra."
  - The bullet goes further than the requested text: it also names §3.4 and grounds the agreement in the definition of the Tate diagonal. Each added claim is checked below; none introduces a defect.
  - It sits after the AInfCohomology bullet instead of before it. That placement makes no difference.

## Verified sound

**Gate, dependency direction and elaboration at 8947c46.** All three were run this round.

```text
gate StableHomotopyKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 238 roadmaps, 2353 edges, 0 problem(s)
```

- The worker's gate record at this head also has `build=0`.
- `lake env lean` on `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean` exits 0 with no output.
- The worktree is clean at 8947c46, and `git diff --stat origin/main...HEAD` outside the folder is empty.
- `Suggested.lean` is unchanged since the previous review, which audited it: a single `import Mathlib`, no declarations, and a docstring naming fourteen headlines that cannot be stated at the pins. It still elaborates.

**Merge-order positions in `ORDER.txt`.**

- HermitianKTheoryOfPoincareCategories is 61, and this roadmap is 330.
- The other suppliers: TangentialBordism 14, StableHomotopyKTheory 16, AInfCohomology 79, KTheoryFiniteLocalFields 88, PadicHodgeRegulators 324, RefinedTraceMethods 327.
- No supplier is later than this roadmap.

**The changed passage, claim by claim.**

| Claim in line 15 | Checked against | Result |
|---|---|---|
| §5.1a owns the C₂ sphere comparison for the trivial action | HermitianKTheoryOfPoincareCategories (#1266 at febd6d9), README line 787: for the trivial C₂-action the canonical map 𝕊→𝕊^{tC₂} exhibits its target as the 2-completion. Line 19 of its Scope says §5.1a owns the shared C₂ sphere comparison. | matches |
| It is proved there through the inverse tower of stunted real projective Thom spectra | line 787: "Construct the comparison with the inverse tower of stunted real projective Thom spectra … including convergence" | matches |
| §2.7 extends it to every prime and every bounded-below finite-type spectrum by the Singer construction, and §3.4 to every bounded-below spectrum by truncated Tate functors | this README, line 375 (§2.7: B bounded below, degreewise finite type over 𝔽_p) and lines 467 and 475 (§3.4: every bounded-below X, via T_pX≃lim T_p(τ_(≤n)X)). Hermitian line 19 assigns exactly these two extensions to §§2.7 and 3.4 here, "including the odd-prime sphere case". | matches; no second owner |
| Neither §2.7 nor §3.4 uses §5.1a | §2.7 *Needs:* (line 387) and §3.4 *Needs:* (line 483) name no HermitianKTheoryOfPoincareCategories item. Line 375 says the sphere case follows "without a Segal theorem as input". Hermitian §5.1a's *Needs:* (line 799: §5.1, GeometryOfNumbersAndQuadraticArithmetic §6.1a, GeneralizedCohomology, EnhancedDerivedSheaves) has no edge back to this roadmap. | no cycle; the depcheck agrees |
| The Tate diagonal at S is that canonical map | ns18 lines 3236–3242: Definition III.1.4 defines Δ_p as the transformation corresponding to S→S^(hC_p)→S^(tC_p). Page marker 84 runs from line 3212 to line 3242, and the printed page 287 header follows at line 3244, so the definition is on p.286 as cited. The first sphere Check of AInfCohomology (#1044 at 91b0719) §AI.7.2 "Spectral Tate diagonal", line 3855, gives the same composite. | supported; the ns18 reference line 1098 already covers "III.1, pp.285–292" |
| An equivalence S₂^∧≃S^(tC₂) under S is unique up to homotopy | S^(tC₂) is 2-complete: §2.7 asserts this, and so does §5.1a. For a 2-complete Y, restriction along S→S₂^∧ gives Map(S₂^∧,Y)≃Map(S,Y), so the space of maps under S is contractible. | correct (computed in the table below) |

Ownership was searched by object: `roadmaps grep -i --readme-only 'Segal.?Lin|Lin.s theorem|Segal conjecture'` over main and the open heads. Only HermitianKTheoryOfPoincareCategories §5.1a and this roadmap state a Segal-type completion theorem, and the two READMEs now cite each other consistently.

`overlaps.md` and `citations.md` list nothing for this roadmap at this head.

**Seeded sample.** None of the fifteen sampled targets falls in the changed line. Under the incremental rules they are carried from the previous review's reads, recorded in its sample table: 2.5, 4.3, 4.6, 4.7, 5.4, 7.2 and 8.2, with lnr12 line 1411 for 1.2 and malkiewich17 lines 609–622 for 8.1. I also re-read these locators this round:

- §7.4: ns18 lines 640–666, Example I.2.3(iii), pp.219–220. π_*KU^(tC_p) is ℚ_p(ζ_p) in even degrees, π_*KU^(tC_(p²)) is ℚ_p(ζ_p)⊕ℚ_p(ζ_(p²)), and the residual fixed points are unchanged. This supports the statement as written.
- §7.5: ns18 line 3283, p.288. (KU⊗KU)^(tC₂) is rational, as a module over the C₂-Tate spectrum of the KU-local sphere. This supports the statement.
- §4.5: ns18 lines 4972–4977, Remark IV.1.11, p.328. The Tate comparison factors through R⁰(X×BΣ_p)/I. This supports the factorization. The README's Young-subgroup ideal replaces the source's mis-stated ideal; see Source issues.

**Library declarations.** The changed line names no Mathlib or Tau Ceti declaration, so none was opened this round. The 40 `#check`s of the previous review are untouched and are not re-reported.

**Adversarial table.** The first rows are computed this round, for the changed statement and for the sample targets re-read above. The rows marked "carried (~10)" are the previous report's rows for untouched statements, with that report's computed values.

| Statement | Instances | Values on each side / model excluded | Result | Change |
|---|---|---|---|---|
| Line 15: the Tate diagonal at S is S→S^(hC₂)→S^(tC₂) | p=2, X=S | Def. III.1.4 gives Δ₂(S) as the unit composite. On π₀ it sends 1↦1∈ℤ₂. Two wrong models are excluded, since neither is the composite of canonical maps: the zero map (1↦0) and the negated unit (1↦−1≡3 mod 4). | Pass | none |
| Line 15: the same statement about the same map | π₋₁, π₀, π₁ of the target at p=2 | §5.1a (Hermitian line 795): 0, ℤ₂ and, as S₂^∧, ℤ/2·η. §2.7 Check (line 383) at p=2: π_(<0)=0 and π₀=ℤ₂, with π₁=π₁S₂^∧=ℤ/2. | Pass | none |
| Line 15: uniqueness under S | self-maps of S₂^∧; S^(hC₂) as negative control | [S₂^∧,S₂^∧]=π₀S₂^∧=ℤ₂ acts by multiplication by a. A map under S needs a·1=1, so a=1. With S^(hC₂) in place of the target, π₀=A(C₂)^∧_I≅ℤ⊕ℤ₂ has a ℤ summand that is not 2-complete, so the argument would fail. The bullet correctly uses S^(tC₂). | Pass | none |
| Line 15: scope across primes | p=3 | §5.1a is C₂ only (line 787). The odd-prime sphere case S→S^(tC₃), with π₀=ℤ₃, belongs to §2.7, as Hermitian line 19 says. | Pass | none |
| Line 15: direction of supply | positions; *Needs:* lines | 61 &lt; 330. No *Needs:* line here names Hermitian, and §5.1a names nothing here. Depcheck: 2353 edges, 0 problems. | Pass | none |
| 6.1 (sample) | p=2: H𝔽₂, Hℤ. p=3: Hℤ, H𝔽₃ | π_n(H𝔽₂^(tC₂))=Ĥ^(−n)(C₂;𝔽₂)=𝔽₂ for all n, giving ∏_jΣ^jH𝔽₂. π_n(Hℤ^(tC₂)) is ℤ/2 for n even and 0 for n odd (Ĥ¹(C₂;ℤ)=Hom(C₂,ℤ)=0), giving ∏_jΣ^(2j)H𝔽₂. At p=3, W={±1} acts on degree 2k by (−1)^k, so the invariants sit in degrees 4j (Hℤ) and 4j, 4j+1 (H𝔽₃), which are 2j(p−1) and 2j(p−1)+1. | Pass | none |
| 7.4 (sample) | p=2, 3 | ℚ_p-dimension of the source against the target: (1+2) against 1 at p=2, and (2+6) against 2 at p=3. Both differ, so the comparison is not an equivalence. | Pass | none |
| 1.1 normalization | carried (~10) | β(e)=u·u⁻¹=1, β(−e)=−1; with u′=2u, t′=2t, e′=e, t′²=t² at p=3 | Pass | none |
| 1.1 weights (p=3, a=−1) | carried (~10) | t, t², e, t⁻¹e have weights −1, +1, 1, a⁻¹; invariant even period −4, integral period 4 | Pass | none |
| 1.2 duality (sample) | carried (~10): X=S, p=5, a=2 | t∈Ĥ⁻² has weight 2; the dual in Ĥ_(−2)=Ĥ¹ has weight 3 in 𝔽₅ | Pass | none |
| 2.2 | carried (~10) | zero tower 0=0; Ext^(0,0)_A(A,𝔽_p)=𝔽_p=π₀; bottom degrees of U_n(S) are 1, 0, −1 | Pass | none |
| 2.3 | carried (~10) | Sq¹(x⁻¹⊗1)=1 since binom(−1,1)≡1; β(xy⁻¹⊗1)=1; Sq⁰1=P⁰1=1 | Pass | none |
| 2.4 | carried (~10) | M=0: 0=0; M=N=𝔽_p: Hom_A dimensions 1=1 via ε | Pass | none |
| 2.5 (sample) | carried (~10) | Σ^(1+n)(S^(−nρ))_hC_p=Σ(BC_p)^(−nρ̄); bottom cells 3 against 2 at p=2; Σ^(1+n)D(Σ^(−(n−1))B)=ΣU_(n−1)(B) | Pass | none |
| 2.6 (headline) | carried (~10) | Σx⁻¹ in degree 0; Σxy⁻¹ in degree 1+1−2=0 | Pass | none |
| 2.7 (headline) | carried (~10) | S: π₀=ℤ_p and π_(&lt;0)=0; H𝔽_p: π₀Δ=id; Hℚ: 0=0; KU excluded (KU₂^∧/2≠0=T₂(KU)/2) | Pass | none |
| 3.1 | carried (~10) | stable image 1=|L|; empty stages give 0; {0,1}ⁿ gives 2^ℵ₀, outside the hypothesis | Pass | none |
| 3.2 | carried (~10) | 𝔽₂⊕𝔽₂: mixed words form one free orbit, Tate 0; τ_(≤n)(H𝔽_p^⊗p)=0 for n&lt;0 | Pass | none |
| 3.3/3.4 (headline) | carried (~10) | 𝔽_p^(J) has dimension κ against 2^κ for the product; Σ⁻¹H𝔽_p: 𝔽_p in degree −1 on both sides; KU fails | Pass | none |
| 4.1 (headline) | carried (~10) | |W|=1 and 2, with 2 invertible in ℤ₃; z↦z² has exponent 2≠1 | Pass | none |
| 4.2 | carried (~10) | Hℤ, p=2, x=2: restriction 4 and can 2; the candidates 2u and 4u are excluded | Pass | none |
| 4.3 (sample) | carried (~10) | H𝔽₂: 2s(1)=tr(1)≠0, so the middle group is ℤ/4 | Pass | none |
| 4.4/4.5 (sample) | carried (~10) | P₂(2)=3+σ, character 2 against 4; Hℤ at p=5: 30≡0 mod 5 but 30≢0 mod 120 | Pass | none |
| 4.6 (sample) | carried (~10) | Hℤ, p=2: 2↦4≡0 on both routes; 𝔽₃[z]: z³−z≠0; Σ^∞_+∅=0 | Pass | none |
| 4.7 (sample) | carried (~10) | 2↦8≡2 mod 3; ℚ/3=0; in 𝔽₄, a²=a+1≠a; S_p^∧ not compact | Pass | none |
| 4.8 (headline) | carried (~10) | End_(ℤ₂)(ℤ₂[ζ₃])={x,−1−x}, of order 2=|Gal(𝔽₄/𝔽₂)|; ramified control ℤ₃[ζ₃]: 2 lifts against 3 endomorphisms ε↦cε of 𝔽₃[ε]/ε² | Pass | none |
| 5.1 | carried (~10) | H¹(S¹;ℤ_sign)=ℤ/2 against ℤ; [S¹,R]=π₁R | Pass | none |
| 5.2 | carried (~10) | π₂ΣHℤ=0 against π₁=ℤ; π₂Σ²Hℤ=ℤ against 0 | Pass | none |
| 5.4 (sample) | carried (~10) | π_iΣ(Hℤ^tC₂) is ℤ/2 in odd degrees; the reflection acts by +1 on π₁(S^ρ)^tC₂ | Pass | none |
| 5.6 (sample, headline) | carried (~10) | p=2, n=1: u+u²s, with degrees 1 and 2−1 on both routes | Pass | none |
| 6.2 signs | carried (~10) | v(v+u)(v+2u)≡v³−vu² at p=3; (m!)²≡(−1)^(m+1) at p=3, 5, 7; leading coefficient −u^(p−1) | Pass | none |
| 6.2 multiplicativity | carried (~10) | (x−ye)(z−we)=xz+(yz−xw)e; the unsigned form gives the opposite e-coefficient | Pass | none |
| 6.3 (headline) | carried (~10) | −P¹v=2v³; θ₁v=0; θ₀x=−y; θ₀(xz)=yz−xw | Pass | none |
| 7.1/7.3 (sample, headline) | carried (~10) | P₂(−1) has character −1=ψ²(−1); H=1+β gives H^p=1+pβ, and β⁻¹↦β⁻¹/p has product 1 | Pass | none |
| 7.2 (sample) | carried (~10) | dimensions 1 and 3 at p=2; ℚ₃(ζ₃) has degree 2 and W-fixed field ℚ₃; (1+x)^p−1 vanishes at x=0 | Pass | none |
| 7.5 (sample) | carried (~10) | KU₂^∧/2 has π₀=𝔽₂ against rational /2=0; the S control has π₀T₂(S)=ℤ₂ | Pass | none |
| 8.1/8.2 (sample, headlines) | carried (~10) | S²: bottom degrees (1,3), (2,4); S¹: n−n=0; a wedge of κ copies of S² gives bounds independent of κ | Pass | none |
| 8.3 (headline) | carried (~10) | Y=*: A(C_p)=ℤ² against ℤ⊕ℤ_p; both are ℤ_p² after completion | Pass | none |
| gap `steenrod-finite-hopf-chain` | carried (~10) | dimensions 1, 2, 8 at p=2 and 1, 2, 12 at p=3; agrees with agm85 line 217 | Pass | none |

**Declared gap `steenrod-finite-hopf-chain`.** The gap is unchanged since the previous review, which found it precise, minimal and declared with the same slug in `design/plan.json` and the README.

## Not verifiable

- HermitianKTheoryOfPoincareCategories and AInfCohomology have no checkout path in the brief. I read them through `roadmaps show` at their heads, febd6d9 (#1266) and 91b0719 (#1044).
- Three items are carried from the previous review, in untouched text:
  - KTheoryFiniteLocalFields §4.5's boundary normalization cites HM03, which is not in the cache.
  - The bmms86 scan's extraction is garbled beyond Prop. VIII.2.4(vi).
  - The Tau Ceti instance plumbing for L=W(k)[1/p] was not elaborated.

## Source issues

These two were re-read this round while checking locators. Both repeat entries of the previous report.

- **Misprint** in ns18 at Example I.2.3(iii), printed p.220: the source says the p- and p²-series of the multiplicative formal group are (x−1)^p−1 and (x−1)^(p²)−1; it should be (1+x)^p−1 and (1+x)^(p²)−1, which vanish at x=0; affects nothing.
- **Error** in ns18 at Remark IV.1.11, printed p.328: the source says the transfer ideal is the image of the transfer from R⁰(X) to R⁰(X×BΣ_p); it should be generated by transfers from the Young subgroups Σ_i×Σ_(p−i), 0&lt;i&lt;p, since 2⁵−2=30 is not in (120) for Hℤ at p=5; affects a stated result.
