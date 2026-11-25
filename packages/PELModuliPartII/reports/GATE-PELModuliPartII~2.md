# GATE-PELModuliPartII~2: answers to the human review of `8ec1479`

The review was written against `8ec1479`. The branch head when this job started was `bfcd949`, which had
already added ACZ16 to References with its §3 as the locator of the O-frame and window definitions.
The repairs below are in commit `92c108f0` on top of `bfcd949`. Line numbers refer to
`TauCetiRoadmap/PELModuliPartII/README.md` at `92c108f0`.

Points, in the order they appear in the review: finding 1 is split into H01 (the window definition) and
H02 (the ACZ16 locators); finding 2 is H03; finding 3 is H04; the smaller point is H05; the page
correction in "What I checked" is H06.

## H01 (riccardobrasca) — applied

l. 167, §0.1: the definition "IP⊆Q⊆P with P/Q projective over S/I" now reads "Q⊆P a submodule with a normal decomposition, that is, P=L⊕T and Q=L⊕IT". A following sentence says that a normal decomposition gives the old two conditions, and that the converse holds when finitely generated projective S/I-modules lift to S. They lift for the Witt O-frame and for `A_{O′/O}(R)` (W_O(R) is I_O(R)-adically complete, Mih19 p. 45, Mih19 line 2008), and also for the Lubin–Tate frames (finite free over W_O(R), with J nil modulo `O′⊗_O I_O(R)`). The reviewer's semilocal counterexample is now a negative-control Check (l. 189); every clause of it was recomputed (see the table below).

## H02 (riccardobrasca) — applied

At `bfcd949`, References already had ACZ16 with §3 for the definitions. Two changes in this commit:
- References (l. 2156) now also gives ACZ16 Definition 2.24 as the construction Mih19 cites on pp. 40 and 48 (Mih19 lines 1830, 2160), with a note that these locators are Mih19's.
- The Route of §0.1 (l. 171) said "the Ahsendorf–Cheng–Zink construction (ACZ16), recalled in Mih19 §10 and §11.2". It now cites ACZ16 Definition 2.24 for the totally ramified step and says that Mih19 states the resulting equivalences ((10.1)–(10.2), p. 40, and p. 43) without giving the construction.

ACZ16 is settled in the manifest as uncertified, so these locators come from Mih19's citations, not from ACZ16 itself.

## H03 (riccardobrasca) — applied

l. 167, §0.1: the clause "compatibly with duality after rescaling the pairing by a unit of the frame", which applied to every R and κ, is replaced.
- **New definitions.** κ′ is the image of κ under `O′⊗_O W_O(R)→W_{O′}(R)`, the strict morphism `L_{O′/O,κ}(R)→L_{O′/O′,κ′}(R)` of Mih19 Prop. 12.10. η=V⁻¹(π′−[π′]), so that the Witt O′-frame is `L_{O′/O′,η}(R)` (Mih19 Ex. 12.9 (1)).
- **New clause.** The equivalence is compatible with duality, through multiplication by ε, when `W_{O′}(R)` has a unit ε with σ(ε)ε⁻¹=κ′/η.
- **Where ε exists.** Mih19 p. 16 (lines 720–723) gives ε in `W_{O′}(O_{K̆′})` for the κ of Ex. 12.9 (2), and hence over every `O_{K̆′}`-algebra.

The Route now gives the argument: Prop. 12.10, Cor. 12.12, (11.2), and Lemma 11.2 applied to the identity as a κ′/η-isomorphism. The scope line now says where the clause is asserted. Your 𝔽_q example is a Check (l. 195). §0.4 (l. 244) now says that its frame-change unit is this ε, which exists over Spf O_L̆=Spf O_K̆ (Mih19 p. 16).

One direction note: Mih19 p. 16 calls the identity `L_{κ}→W` a κ/u-isomorphism. By Mih19's own definition (p. 41) that direction has multiplier u/κ. The existence condition on ε is the same up to replacing ε by ε⁻¹, so the README uses the direction Witt→`L_{κ′}`, whose multiplier is κ′/η.

## H04 (riccardobrasca) — answered

The pull-request description is outside the files this job may edit; the worker updates it. To match the overview (README ll. 5–10) it should say "stops at good primes and, for the CM moduli, at primes unramified in the CM field" and "The moduli statements fix data beyond the generic Kottwitz signature", in the `roadmap-summary` block and in the paragraph below it.

## H05 (riccardobrasca) — applied

l. 1968, PELModuli contract: "over complete noetherian local rings with perfect residue field" → "over complete noetherian local rings of characteristic p with perfect residue field" (PELModuli §M2.15 on main defines `Display` over rings of characteristic p only). "classifies all p-divisible groups over such rings" → "over complete noetherian local rings with perfect residue field of characteristic p, mixed characteristic included", which matches FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §0.13 on main. No other passage tied §M2.15 to these rings; l. 1830 describes FFG Part II and is correct as it stands.

## H06 (riccardobrasca) — applied

l. 167, locator list: "Proposition 13.2 with its proof, pp. 48–49" → "pp. 48–50". The proof ends on p. 50 (Mih19 line 2240). The Route's "Mih19 §13, p. 49" is kept: it cites the δ∘γ statement, which is on p. 49 (lines 2191–2195). The list also gains the new locators: Example 12.9, Proposition 12.10 and Corollary 12.12, the I_O(R)-adic completeness on p. 45, and p. 16.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Window ⇒ IP⊆Q, P/Q≅T/IT projective | L=0; T=0; S=0 | L=0: Q=IT=IP, P/Q=P/IP. T=0: Q=P, P/Q=0 (étale case of Check l. 187). S=0: all modules are 0 | holds | none |
| Converse under lifting | general S with I⊆Jac(S) | lift Q/IP and P/Q to L₀ and T₀; L₀⊕T₀→P is onto by Nakayama, split, kernel K has K/IK=0, so K=0; then Q=L+IP=L⊕IT | holds; needs I⊆Jac(S), which O-frames have | none |
| Lifting for the Witt O-frame and `A_{O′/O}` | O=ℤ_p, R=𝔽_p | W(𝔽_p)=ℤ_p, I=(p), complete; in general Mih19 line 2008 | holds | cited p. 45 |
| Lifting for Lubin–Tate frames | O′=O[x]/E(x), π^N R=0 | O′⊗_O R=R[x]/(E); x^{eN}=0 and π′_R is nilpotent, so the kernel (x−π′_R) is nil; O′⊗W_O(R)≅W_O(R)^e is complete | holds | none |
| Counterexample Check l. 189 | S semilocal at (π,x),(π,x−1); t=x²−x+π | Hensel: roots 0,1 of x(x−1) are simple; β−α≡1 is a unit, so S/I≅O×O; t,π∈Jac; σ⁻¹(mᵢ)=mᵢ, so σ extends; σ̇(t)=1; Ḟ(tc·y)=σ(x−α)σ(c)σ(y)=σ̇(tc)F(y); Ḟ(x−β)=1; x−β∉tS (x−α is not a unit) and x−β∉S^× | the old definition holds, there is no normal decomposition | added |
| Lubin–Tate duality with ε | R=𝔽_q | `W_{O′}(𝔽_q)`=O′, V=π′·, [π′]=0, η=V⁻¹(π′)=1, σ=id, so σ(ε)/ε=1 and the hypothesis is κ=1, the Witt frame, where duality holds | consistent | none |
| κ′/η-isomorphism direction | identity Witt→`L_{κ′}` | on J=I_{O′}(R) (the extension is trivial), σ̇_c(ξ)=V⁻¹(ξ)c, κ=ηc, so σ̇_{κ′}=(κ′/η)σ̇_W; Lemma 11.2 needs σ(ε)ε⁻¹=κ′/η | matches the README's u-morphism convention | Route wording |
| Pairing rescaling sign | Witt→`L_{κ′}`, form ε^a(,) | BiHom needs ε^a=(σ(ε)/ε)σ(ε)^a, so a=−1 (Mih19 line 1910) | the README says "through multiplication by ε" (the window isomorphism), with no exponent claimed | none |
| Check l. 195 | κ=1+π′ (κ²≠1, p odd); κ=−1 | F(e₁)=π′e₂, F(e₂)=−e₁, F²=−π′; (Ḟe₁,Ḟπ′e₂)=1=σ̇(π′); B(e₁,e₁)=κ²B(e₁,e₁), B(e₁,e₂)=κ²B(e₁,e₂), B(e₂,e₂)=κB(e₁,e₁)/π′, B(e₂,e₁)=−κB(e₁,e₂); for κ=−1 a nonzero symmetric B exists | B=0 for κ²≠1, so the Check states κ²≠1 rather than κ≠1 | added |
| Scope-line clause | κ=−1 over 𝔽_q | no ε exists, but BiHom≠0 | "is compatible only where" would overclaim | worded "is asserted to be compatible only where" |
| §0.4 existence of ε | Mih19 K=our K₀, E₀=our K, E=our L | ε∈W_{O_K}(O_L̆) for κ=V⁻¹(θ(π′⊗1−1⊗[π′])) (Mih19 lines 701–723); O_L̆=O_K̆ because L/K is unramified | holds | added |
| §M2.15 contract | PELModuli README l. 2343 on main | "Zink's displays over a ring R of characteristic p" | the clause now matches | applied |

## Build, gate, direction

- Suggested.lean is unchanged: it declares nothing (its docstring lists the headlines that cannot be stated at the pins), so there were no `#check @name` signatures to elaborate, and none changed.
- No README sentence added a backticked Lean name of this roadmap.
- No construction was added that another roadmap could own; the repairs correct §0.1's own definitions.
- No new source was cited: all locators are in Mih19 (in the manifest) or are ACZ16 (settled as uncertified). `needs-references.toml` was not written.

`lake build TauCetiRoadmap.PELModuliPartII.Suggested`: `Build completed successfully (18239 jobs).`

Gate: `gate PELModuliPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

The first gate run flagged `tex=3`: three bare `W_{O′}(R)` outside code spans. They were put in code font before the commit.

Depcheck: `depcheck: 121 roadmaps, 1385 edges, 0 problem(s)` (no UPWARD or CYCLE line).
