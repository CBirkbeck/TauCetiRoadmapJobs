# Review of AutomorphicLFunctionsAndLocalFactors (pull request #3027 at 4a2d22f)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 126 changed lines since `592bdb1`. It checked the five sections added to Layer AL.3 (AL.3.2.4, AL.3.3.2a, AL.3.3.8a, AL.3.7.1a, AL.3.9.7), the edited Conventions, scope and supplier text, their citations of SmoothRepresentationsOfLocalGroups and AdelicAlgebraicGroups, and every source that can be read legally, and raised no finding: accepted, with three small corrections and no format notes, the first being that the exponent bound AL.3.3.8a is limited to characteristic zero although Zelevinsky's Theorem 9.7(b) supplies its one missing input over every nonarchimedean field. Left for a human: the source the new text cites most (Jacquet–Piatetski-Shapiro–Shalika 1983) and three others are paywalled and could not be checked.

## C01 — The exponent bound AL.3.3.8a is limited to characteristic zero, although its one characteristic-zero input is available over every nonarchimedean local field

The roadmap's local statements are otherwise made for every local field (Conventions, line 37). As it stands, the positive-characteristic case of the bound is planned outside the general roadmap: LocalFactorsOfTwistsAndTypes 6.3 at this head keeps its own route for it.

The README itself says (AL.3.3.8a, line 1459) that the restriction "is that of the supplier target *modular-generic-segments*, which is stated for finite extensions of `ℚ_p`; it is not a restriction of the sources". The only input the restriction comes from is this: an irreducible generic representation is an irreducible product `L(Δ₁)×⋯×L(Δ_r)` of pairwise unlinked segments, with uniquely determined multiset. That is Zelevinsky 1980, Theorem 9.7(b), p.199, stated for any nonarchimedean local field (§1.1, p.170). Every other step of the route holds in either characteristic: AL.3.2.2, AL.3.2.3, AL.3.3.1, unitarity giving `π̄ ≅ π∨`, and the pole of `L(s,π₀×π₀∨)` (Cogdell–Piatetski-Shapiro, Theorem 2.3 and its Corollary, pp.31–32).

The smallest repair would cite Theorem 9.7(b) in place of *modular-generic-segments*. It could go either as a further clause of SR.5.2a *zelevinsky-classification*, which this pull request adds and which already cites 9.7(a), or as a step of this target. The repair would then drop "of characteristic zero" (line 1457), the characteristic paragraph (line 1459) and the exception in the Conventions (line 37).

## C02 — The rank-(n−1) route of AL.3.9.7 uses a completeness lemma that no target or supplier states

An implementer of the rank-(n−1) form needs this lemma, but it is neither in the section's *Needs:* line nor stated anywhere in AL or SmoothRepresentationsOfLocalGroups. Neither README states a completeness or separation property of Whittaker functions. The route (line 1787) concludes from the vanishing of all twisted integrals using the claim that "a smooth function with that support and equivariance whose integrals against all those Whittaker functions vanish is zero". The functions in question are ψ-equivariant under `N_(n−1)` on `GL_(n−1)(F)`, compactly supported modulo `N_(n−1)` on each set where `|det|` is constant, and orthogonal to the Whittaker functions of every irreducible generic representation of `GL_(n−1)(F)`.

A sentence would settle it: say that this lemma is part of the target, with its hypotheses as above and its locator in Henniart's §3 (or wherever the cited proof takes it from).

## C03 — The description says every added section keeps its source's generality, which AL.3.3.8a does not

The description says the general roadmaps receive sections, "each a theorem published before 20 November 2026 and stated in the generality of its source". Its parenthetical lists exceptions only for AnalyticNumberTheoryPartI. AL.3.3.8a is stated only in characteristic zero and says itself that this is not a restriction of the sources (line 1459). If C01 is applied, the sentence becomes true. Otherwise, add to the parenthetical: "and in AutomorphicLFunctionsAndLocalFactors §AL.3.3.8a in characteristic zero, the generality of its supplier for the classification of generic representations".

## Questions for the author

- AL.3.9.7 credits the form with generic twists of rank `n−1` alone to Henniart 1993, Théorème 1.1, p.340. Two later papers describe that theorem with twists of every rank `1≤r≤n−1`: Jacquet–Liu, p.2, and Chai, p.1; Jacquet–Liu also add equal central characters. Does Théorème 1.1 assume only rank `n−1`, as the README says? The statement itself is true: the sketched route uses rank `n−1` alone. What stopped me is that the 1993 paper is behind a paywall.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Seeded sample: Check for the theta-Mellin formula (AL.3.5.1, untouched) | point mass, n=2, `|det g|=3`, θ₀=5, `|a|=2`, η=1, s=1 | `3·5·2^(2·1)=60`; omitting n gives `3·5·2=30`; Cogdell Columbia line 264–267 has `|a|^(ns)` | holds |
| AL.3.2.4 convergence, Steinberg Check | St of GL₂, ψ unramified, `W(diag(ϖ^m,1))=q^(−m)` | `Σ_m q^(−2m)·q^m = Σ q^(−m) = q/(q−1)` | holds |
| AL.3.2.4 tempered negative control | `Ind(1⊠1)`, `|W|²=(m+1)²q^(−m)` | `Σ(m+1)²q^(−m)·q^m = Σ(m+1)² = ∞` | holds |
| AL.3.2.4 the two forms of the integral | n=2, Iwasawa, `δ_B(diag(t,1))=|t|` | `∫_(ZN\G)f = ∫_K∫ f(diag(t,1)k)|t|^(−1)d×t dk`: factor `|det p|^(−1)` | holds |
| AL.3.2.4 holomorphy on `Re(s)>0` | n=m=1, unitary χ, χ′ | poles of `(1−χχ′(ϖ)q^(−s))^(−1)` lie on `Re(s)=0`; Cogdell–PS Corollary p.32 | holds |
| AL.3.3.2a Check 1 | GL₂ principal series × χ | n=m=1 integral is Tate's, sign `ω(−1)^0=1`; product of Tate γ | holds |
| AL.3.3.2a Check 2 | St×`|·|^(1/2)` | `L(s,St⊗ν^(1/2))=L(s+1,1)` vs `L(s+1,1)L(s,1)` | holds; L not multiplicative |
| AL.3.3.2a equal-rank symmetry | conjugate by signed diagonal, `e_nε′=(−1)^(n−1)e_n`, centre −I | signs `(ω_πω_τ)(−1)^(n−1)` cancel; `γ(π×τ)=γ(τ×π)` | holds |
| AL.3.3.2a multiplicativity, any F | Henniart 2002 §2.6 p.595, §1.1 p.588 | JPSS γ multiplicative for normalized induction; F any nonarchimedean field | holds |
| AL.3.3.8a pole of `L(s,π₀×π₀∨)` | segment of length ℓ centred on unitary ρ | Cogdell–PS Thm 2.3: `∏_(j=0)^(ℓ−1)L(j+s,ρ×ρ∨)`; j=0 contains `(1−q^(−s))^(−1)` | holds |
| AL.3.3.8a bound | complementary series `ν^αχ×ν^(−α)χ` | factor `L(s−2α,χ×χ⁻¹)` has pole at s=2α; holomorphy on `Re(s)≥1` forces 2α<1; α=1/2 is reducible | holds |
| AL.3.3.8a Checks | unramified; St; trivial GL₂; n=1 | `|α_i|=q^(−t_i)`; St: r=1, t=0; trivial not generic; n=1: t=0 | hold |
| AL.3.3.8a characteristic | F=`𝔽_p((t))` | Zelevinsky 9.7(b) p.199 for any nonarchimedean F (§1.1 p.170); other inputs characteristic-free | true there too → C01 |
| AL.3.7.1a | n=1; centre; unramified place | `cχ↦cχ⁻¹`; central character `ω⁻¹`; Satake `α↦α⁻¹`; Cogdell Fields pp.38–39 | holds |
| AL.3.9.7 Check 2 | n=2 unramified `{a,b}`, X=`χ(ϖ)q^(−s)`, ψ unramified | `γ=(1−aX)(1−bX)/((1−1/(qaX))(1−1/(qbX)))`; cancellation only if b=qa (reducible) | holds |
| AL.3.9.7 supercuspidal form | Henniart 2002 §1.9 Corollaire p.592 | generic π, π′; supercuspidal ρ of ranks 1…n−1 ⇒ π≅π′; no central-character hypothesis | holds |
| AL.3.9.7 ⌊n/2⌋ form | Jacquet–Liu Conj. 1.1 p.1, Thm 1.3 p.3; Chai Thm 1.1 p.2 | equal central characters, ranks ≤⌊n/2⌋; JL over any nonarchimedean F, Chai p-adic | holds |
| Conventions exception (line 37) | against AL.3.3.8a | both state characteristic zero for the same reason | consistent |

- Source locators checked against the text: 15 (Cogdell–Piatetski-Shapiro 4, Henniart 2002 3, Jacquet–Liu 2, Chai 1, Tadić 1, Cogdell Fields 3, Cogdell Columbia 1); plus Zelevinsky 1980 Theorem 9.7 and §1.1 for C01.
- Cross-roadmap citations resolved at this head: 14 (SR.0.4 *smooth-dual*, SR.2.2 *parabolic-induction*, SR.3.1 *finite-length* and *cuspidal-support*, SR.3.3 *square-integrable-tempered* and *casselman-criterion*, SR.3a.1 *jacquet-subrepresentation*, SR.4 Satake parameters, SR.5.1 *mirabolic-derivatives*, SR.5.2 *modular-generic-segments* and *segment-representations*, SR.5.2a clause (v), AdelicAlgebraicGroups §2.2 *quotient-measure*, ALS.F.6). SR.5.2a is added by this pull request; the rest are on main.
- Consumers of the new ids at this head: LocalFactorsOfTwistsAndTypes 6.1–6.4 and BaseChangeAndGaloisRepresentationsForUnitaryGroups 14.0a; each uses the statement as AL gives it.
- Record: the merge-base README has 6 layers; none removed or retitled, 0 headings removed, 5 added; main has not changed this folder or SR since the merge base.
- Dependency check: `depcheck: 132 roadmaps, 1478 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` (unchanged by the pull request): exit 0, 14 `sorry` warnings and nothing else. The elaborated types of its 33 declarations were compared for the two flagged by the signature scan.
- Automatic checks: all passed. No file changed outside the folders the pull request owns.
- Ownership against open pull requests: searched the open heads for the local converse theorem, γ-multiplicativity, the exponent bound and the s = 0 pairing; no other owner.

Overlap check: read AutomorphicLFunctionsAndLocalFactorsPartII, GL2AutomorphicRepresentationsAndTransfer, AutomorphicSpectralTheory, LocalFactorsOfTwistsAndTypes, GlobalShtukasAndFunctionFieldLanglands, MetaplecticAutomorphicForms, CongruenceSpectralGap, TwistedAutomorphicDescents; shared: γ-multiplicativity (owner AL.3.3.2a; PartII §10.2 and CongruenceSpectralGap consume it), the local converse theorem (owner AL.3.9.7; GL2AutomorphicRepresentationsAndTransfer R16.0 proves the n = 2, 3 cases for its own correspondence; LocalFactorsOfTwistsAndTypes 6.4 is a corollary), the exponent bound (owner AL.3.3.8a in characteristic zero; LocalFactorsOfTwistsAndTypes 6.3 keeps positive characteristic, C01), the s = 0 pairing (owner AL.3.2.4; LocalFactorsOfTwistsAndTypes 6.1 extends it), the transpose-inverse contragredient (owner AL.3.7.1a; BaseChangeAndGaloisRepresentationsForUnitaryGroups 14.0a is a corollary).

Source independence: changed passages only. 10 passages were compared with 6 sources (Cogdell–Piatetski-Shapiro, Henniart 2002, Jacquet–Liu, Chai, Tadić, Cogdell's Fields lectures); none shares wording beyond statements the mathematics forces. The largest share is Jacquet–Piatetski-Shapiro–Shalika 1983, with 13 of 35 locators in the changed passages; it is not readable (paywalled). No layer is added, removed or reordered, so the arrangement was not compared.

Research link: the added AL.3 sections are the local Rankin–Selberg theorems of Jacquet–Piatetski-Shapiro–Shalika (1983), the generic unitary dual of Bernstein (1984) and Tadić (1986), and the local converse theorems of Henniart (1993) and Jacquet–Liu (2018). Henniart (2002) uses them to characterise the local Langlands correspondence for GL(n). This rests on the README's AL.3 sources and on Henniart 2002 §§1.4–1.9, which I read.

## Not verifiable

- Jacquet–Piatetski-Shapiro–Shalika, *Rankin–Selberg convolutions* (Amer. J. Math. 1983): publisher copy only (paywalled); its 13 locators in AL.3.2.4, AL.3.3.2a and AL.3.3.8a were not read.
- Henniart, *Caractérisation … par les facteurs ε de paires* (Invent. Math. 1993): paywalled, no open copy found; Théorème 1.1, its Remarque, §3 and Lemme 3.5 were not read.
- Bernstein, *P-invariant distributions on GL(N)* (LNM 1041, 1984): paywalled; §8.9 was not read.
- Jacquet–Shalika, *On Euler products … I* (Amer. J. Math. 1981): paywalled; Proposition (1.5) and Corollary (2.5) were not read.

Automatic checks set aside as false positives: the signature scan reported that the defining hypothesis on `besselK` had dropped out of `AL0.BesselHalfOrderDerivative` and `AL0.BesselLaplaceMellin`. Both elaborated types contain it, as an unnamed premise.

## Source issues

- **Misprint** in CogdellFields at Lecture 7, References [1], printed p.59: the source says Jacquet–Shalika I runs over pages 499–588 of Amer. J. Math. 103; it should be 499–558; affects nothing.

## For the human reviewers

- Not tested: the source with the largest share of the changed passages' locators, Jacquet–Piatetski-Shapiro–Shalika 1983 (13 of 35), is paywalled. Wording and arrangement were not compared against it, nor against Henniart 1993, Bernstein 1984 or Jacquet–Shalika 1981.
