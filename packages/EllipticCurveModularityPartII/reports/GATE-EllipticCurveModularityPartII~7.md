# Human review response

One review comment, one numbered finding. Its four requests are answered below as H01–H04, in the order they appear: the ownership transfer into PadicFamilies, the weight-two equality comparison, the extension boundary, and the ModularIwasawaMainConjectures wording. The new head is `0677414a`. Only `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` changed, at lines 11 and 1028, and line numbers did not shift. **The texts of `TauCetiRoadmap/PadicFamilies/README.md` (head `ed1464b`) and `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md` (head `ce652ac`) are untouched. The companion edits that H01, H02 and H04 ask for still have to be made in those folders.**

## H01 (CBirkbeck) — applied differently

This roadmap's half of the transfer now names the import. Line 11 changes from "PadicFamilies §§4.0.1–4.0.3 extends these objects" to "imports these objects and extends them". Line 1028 changes from "the common theta/Siegel units and ordered symbols, the weight-two finite-level classes and reciprocity, and the rank-zero CM specialization. Its export to PadicFamilies §§4.0.1–4.0.3 identifies …" to the export list the review asks for (normalized theta/Siegel units, ordered symbols with their transfer and ordered-cup sign conventions, weight-two classes with raw and pushforward reciprocity, and the CM induced-character/elliptic-unit adapter), followed by "PadicFamilies §§4.0.1–4.0.3 imports these objects".

The duplicate construction is confirmed at `TauCetiRoadmap/PadicFamilies/README.md` (`ed1464b`) line 85 and lines 2355, 2357, 2371–2373 and 2384, none of which names this roadmap. Deleting that construction and writing the import are edits to that folder, and they are still outstanding there. Only one edit inside this folder would remove the duplicate: importing PadicFamilies §§4.0.1–4.0.2 here. That reverses the direction the review keeps. A scratch copy carrying that *Needs:* clause fails the strict order check with an UPWARD edge to PadicFamilies, which sits two places later in the merge order.

## H02 (CBirkbeck) — applied differently

Line 1028 now assigns the equality to the consumer and fixes its data. It reads: "That roadmap's comparison theorem identifies its k=2, r=r′=1 moment with the class here under the same levels, smoothing integers, units, transfers, norm maps and period choices, with coefficients W_(M,N)(1), and W_f(1) after eigenform projection, retaining the cohomological dual; by the dictionary of §6.0e, Kato's positive Chern-character map gives this identification with no extra sign." The old sentence made this roadmap the subject of the identification and left out the norm maps and the coefficient modules.

The statement names `modularZeta`, which only PadicFamilies defines (its line 2357). It can therefore be stated only there, and it is absent there at `ed1464b`. The two sides have identical domains:
- levels and smoothing integers: M,N≥1, M+N≥5, c,d>1 with gcd(c,6pM)=gcd(d,6pN)=1, at PadicFamilies line 2355 and at line 678 here;
- the support condition: PadicFamilies line 2371 and line 688 here.

At p=7, A_p=2, B_p=1, both Euler operators give 1, 5/7 and 6/7.

## H03 (CBirkbeck) — applied

Line 1028 no longer lists "the rank-zero CM specialization" among the exported objects. It now lists the CM induced-character/elliptic-unit adapter, as line 11 does, and adds "the unconditional modular abelian rank-zero application stays in §6.0e". "Cyclotomic bounds" becomes "broader cyclotomic bounds", matching line 11. PadicFamilies has no competing endpoint: its §4.0.3 (line 2384) ends at the cyclotomic Euler-system bound, and its README contains no rank-zero, Mordell–Weil finiteness or Kato Theorem 14.2 statement.

## H04 (CBirkbeck) — applied differently

Line 1028 now ends "ModularIwasawaMainConjectures uses the geometric classes and their reciprocity through PadicFamilies §4.0, so at weight two these are the classes constructed in §6.0e". This records the re-export path and names §6.0e as the common owner. `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md` at `ce652ac` still assigns the construction to PadicFamilies §4.0 at lines 17, 89 and 91. That wording lives in that folder and is still outstanding. The merge order already supports the path: this roadmap, then PadicFamilies, then ModularIwasawaMainConjectures.

## Computed adversarial pass (changed statements)

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Domain of the k=2, r=r′=1 identification | (M,N)=(1,4) and (1,3); p=7, c=5, d=11, M=1, N=4; c=3 | M+N=5 is admitted and 4 is excluded on both sides; gcd(5,42)=1 and gcd(11,168)=1 are admitted; gcd(3,42)=3 is excluded on both sides | Identical domains | Data list at line 1028 |
| Coefficient module and twist | k=2, r=1; y²=x³−x over 𝔽₅ with a₅=−2 | k−r=1, k−2=0, (k−2)!=1; twist one gives (trace, det)=(−2,5), the Tate module; twist two gives (−10,125) | W_(M,N)(1) and W_f(1) are correct; W(2) is excluded | Both named at line 1028 |
| Raw reciprocity Euler operator | p=7, A_p=2, B_p=1 in the cases p∣M; p∤M with p∣N; p∤MN. PadicFamilies exponent k−1−2r=−1 | 1, 5/7, 6/7 on both sides; dropping the quadratic term would give 5/7 in the third case | Agree | None |
| PadicFamilies' extra reciprocity hypotheses at k=2 | r=r′=1; the special case (k−2,k−1)=(0,1); (M,N)=(1,5) and (2,5) | "One of r,r′ equals k−1" holds; the M≥2 case does not arise; support holds for (1,5) and fails for (2,5) on both sides | Agree | None |
| Sign of the identification | {3,7} over ℚ₇ modulo 3; modulo 2 | Cup coordinate 1; ordinary Chern coordinate 2=−1; positive Chern-character coordinate 1, so the sign is +1. An extra minus sign would give 2≠1. Modulo 2, all three equal 1 | +1 for the positive map, −1 for ordinary Chern; modulo 2 is no witness | "No extra sign" at line 1028 |
| Degenerate smoothing | c=1 | Unit 1, symbol 0 and class 0 on both sides; the zero class has zero dual-exponential image | Agree | None |
| Rank-zero boundary | PadicFamilies README searched for rank zero, Mordell–Weil, A_f(ℚ), Theorem 14.2 | No endpoint hit (the single match is a Λ-rank-zero kernel at its line 1086); here rank_ℤ A_f(ℚ)=0 at line 692 | No competing endpoint | Clause at line 1028 |
| Supply direction | Merge-order positions; dependency check before and after the edit; reverse probe | Order: this roadmap, PadicFamilies, ModularIwasawaMainConjectures. 638 edges and 0 problems at both heads. The probe gives a strict UPWARD edge to PadicFamilies, and "moved" under the movable check | Direction kept; the consumer prose adds no edge | None |

## Ownership and citations

- **Ownership against the open pull requests.** Checked by object: the open-roadmap index and main were searched for theta units, Siegel units, `modularZeta`, Beilinson symbols and zeta classes. The only hits are PadicFamilies, this roadmap and ModularIwasawaMainConjectures.
- **Elliptic units.** A search for elliptic units finds no earlier owner of the theta-unit CM adapter. The elliptic-unit argument in ModularSymbolsPadicLFunctions concerns the CM adjoint characters, which are a different object.
- **What was read.** PadicFamilies was read through the roadmap reader at `ed1464b`; ModularIwasawaMainConjectures was read in its supplied checkout at `ce652ac`.
- **Why this roadmap owns §6.0e.** §6.0e is the owner because both companions come later in the merge order. The weight-two notion therefore moves down to this roadmap, which is the move these lines record.
- **No new declarations.** No declaration was added or renamed, and nothing takes another roadmap's namespace.
- **Citations.** The citation resolver lists no cross-roadmap citation and no Lean name as found nowhere.
- **Sources.** No source was newly cited or fetched, and no `needs-references.toml` was written. Kenku stays settled as uncertified.

## Elaborated signatures

`TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` is unchanged by this commit, so no declaration type changed. The earlier per-declaration `#check @name` comparison still stands. No new scratch elaboration was run, because the module build is the only Lean command available for this check.

## Build and gate

Build command: `lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`. Exit status 0, with 13 warnings, all of them "declaration uses `sorry`" on the admitted headline theorems, and no other warning or error. Final line:

```text
Build completed successfully (9233 jobs).
```

Dependency check with the merge order, `--movable` and strict, at the new head (exit status 0; no UPWARD, CYCLE or moved line):

```text
depcheck: 55 roadmaps, 638 edges, 0 problem(s)
```

Gate summary at the committed head (exit status 0):

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
