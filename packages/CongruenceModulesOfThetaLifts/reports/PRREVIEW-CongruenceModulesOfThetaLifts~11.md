# Review of CongruenceModulesOfThetaLifts (pull request #2921 at 88b60bd)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the five lines changed since `632cb0a` found no finding. The two sentences changed in the README are true (the one downstream roadmap named consumes 7.8 (2) in its 8.19d, and the commit now named in [FormalProof] is the one the family index names and holds the files cited), and the title and description agree with this head. No small correction; five format notes carried from the previous review, none blocking. The scope and licence questions about [FormalProof] remain for the human reviewers.

## N01 — The route of 7.11 quotes the base-level bound of [FormalProof] without a locator

The route (lines 1464–1468) gives `D_0·C·x^ε·(B₀ + N_c)` as the bound [FormalProof] states, with no file or declaration. It is `Formalism.MainNotions.DIVinN_at` in `Formalism/SharpRestriction/GlobalTheoremInputs.lean`; naming it would let a reader check the form, as 7.10c does for its own.

## N02 — The route of 7.8 (3) (ii) is two lines from what the item already cites

"The route of (3) (ii) is not given here" (line 1084). ThetaChainsOnDefiniteUnitaryGroups §2.6a (d), already in the *Needs:* line, gives it: at `g𝔭` the character `ψ` defines what a power `ψ^a`, `a` prime to `ℓ`, defines at `𝔭`; the `T_s` and the conditions of `𝒞` are unchanged because `g` fixes their data; and (a)–(c) hold for `ψ^a` by 7.8 (2).

## N03 — In 7.8 the symbol `𝔭′` has two meanings

The setting (line 1003) uses `𝔭′` for an element of `{𝔭, c_𝕃(𝔭)}`; (3) (i) (lines 1041–1042) and its route use it for a place of the larger field `𝕃′` above `𝔭`. Another letter in one of the two would remove the doubt in "the lattices `T_s` at `𝔭′`".

## N04 — "Nine terms" counts the terms of 7.7b (i), not the summands of the declaration cited

Line 946 says the inequality at a point, "with its nine terms", is `GlobalLatticeIndexTheorem`. That definition has eight summands: the sums over `Col` and `Row` of 7.7b (i) are one sum there, over `row ∪ col`. "with the nine terms of (i) (the sums over `Col` and `Row` written as one)" would match what a reader finds.

## N05 — The Check of 7.4 is in rank one, where the powers of `N(w)` in the Hecke polynomial are invisible

For `r + t = 1` both `N(w)^{k(k−1)/2}` and `N(w)^{(1−(r+t))/2}` equal `1`, so the Check pins the direction of Frobenius but not the normalisation of the `T_{w,k}`. A rank-two line would: with roots `β_iN(w)^{−1/2}` the formula gives `T_{w,1}(x) = (β₁ + β₂)·N(w)^{−1/2}` and `T_{w,2}(x) = β₁β₂·N(w)^{−2}`.

## Previous findings

The previous report (of `632cb0a`) had no finding; its three small corrections and five format notes are accounted for here.

- C01 — repaired: "ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties consumes 7.8 (2) in its §8.19d" (line 1780); that roadmap's 8.19d and its supplier contract cite §7.8 (2) and nothing else of this roadmap.
- C02 — repaired: [FormalProof] (line 2043) now reads "the file paths and declaration names cited here are those of its first commit `40e56bab026552e089d7afcfeff08d2defb9c005`, the source as published, under its directory `src/`"; the same commit as the family index names.
- C03 — repaired: the description now says the family index "is carried by every pull request of the family" (no "identical content") and that #2954 "carries the whole family, this folder included … and takes each revision of the folder from here".
- N01–N05 — not repaired (the text is unchanged); written again above as format notes.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| Downstream consumers, the changed sentence; 7.8 (2), governing field `𝒢_M = E(μ_{2ℓ^M}, V_M^{1/ℓ^M})` | The consumer's 8.19d and its contract entry; `E = ℚ`, `ℓ = 3`, `M = 1`, `2 ∈ V_M`, primes 7 and 31 | Consumer cites §7.8 (2) only (field `𝒢_M`, twist selection). 7 ≡ 31 ≡ 1 mod 6; cubes mod 7 are {1, 6}, so 2 is not one; `2^{10} ≡ 1` mod 31, so 2 is a cube: 31 splits completely in `𝒢_1`, 7 does not | holds; the consumer's remark that the norm congruence alone is not enough agrees with 7.8 (2) |
| References, [FormalProof], the commit named | The family index (lines 13–20); the tree of that commit at `src/Formalism/SharpRestriction` | Same 40-character hash in both; the directory exists at that commit and contains `GlobalTheoremInputs.lean` (the file of N01, cited in 7.11) | holds |

The rows for the untouched statements stand as in the previous review, of `632cb0a`.

- Source locators checked against the text: 1 (the directory `src/Formalism/SharpRestriction` at the commit now named in [FormalProof]); the seeded sample falls in no changed passage.
- Library declarations opened at the pin: none (the change touches no library claim; `Suggested.lean` is unchanged and declares nothing).
- Cross-roadmap citations resolved: 1 (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties 8.19d and its contract "From CongruenceModulesOfThetaLifts", at its open head).
- Dependency check: `depcheck: 133 roadmaps, 1488 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: exit 0, no output; no declaration, so no signature to compare and nothing for the one-tactic probe.
- Changes outside the folder: only the three files of the family index, unchanged since `632cb0a`.
- The pull request's text: title and each sentence of the description read against the head (adds a new folder; `Suggested.lean` declares nothing; the two gate exceptions it reports are the ones a run without the family's settings shows; the folder at #2954 equals this head): no sentence contradicted, no change left unstated.

Overlap check: read GluedTargetAndDivisionInequality, SelmerLengthBoundsAndLocalLifting, ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities, LengthBoundsInPadicFamilies, PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, PotentialAutomorphyInfrastructure (as in the previous review; the change adds no object and no supplier, and no open pull request changes this roadmap or drops an id it cites); nothing shared.

Source independence: changed passages only: 2 passages compared with 1 source ([FormalProof], which the two sentences describe without reproducing), none shared; largest share [FormalProof], 126 of 127 locators; contents not compared again (the change adds, removes or reorders no layer).

Research link: The targets are the congruence-module, Ribet-type and weight-elimination inputs of the formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), in the line of Ribet 1976, Hida 1981 and Bellaïche–Chenevier 2009, with Gan–Qiu–Takeda 2014 for 7.5a; README References and the two sources read.

## Not verifiable

- That `40e56bab` is the first commit of the repository was not checked against its history in this round; the hash is the one the family index gives and the previous review resolved all 126 paths at.
- The proofs inside [FormalProof] were not traced, and the published works of the References cited without locators were not opened (as in the previous review).

## Source issues

- none

## For the human reviewers

- **Scope.** 126 of the README's 127 source locators point to [FormalProof], a Lean repository announced on 20 November 2026 (README References); it is not a refereed publication, and the consumers of the headline bounds are roadmaps of the same family.
- **Licence.** The family index states that [FormalProof] belongs to its author and was published without a licence. The README cites file paths and declaration names only and reproduces none of its text.
- **Which pull request merges.** The description now says #2954 merges the family in one piece. This folder is identical there; the family index of #2954 differs from this pull request's in its lines 17–22.
